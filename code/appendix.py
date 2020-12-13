import requests
from bs4 import BeautifulSoup
import json
import pandas
import math

URL_base = "https://www.gapminder.org/dollar-street/?zoom=6&p="
URL_families_base = "https://www.gapminder.org/dollar-street/families/"
page = requests.get(URL_base)
pageNum = [i for i in range(7)]

families = []

# requesting and getting data from dollar street
for number in pageNum:
    currentURL = URL_base + str(number)
    currentPage = requests.get(currentURL)
    currentSoup = BeautifulSoup(currentPage.content, 'html.parser')
    currentSoupResults = currentSoup.find("script", type="application/json").contents[0]
    currentJS = json.loads(str(currentSoupResults))

    family = currentJS["props"]["pageProps"]["initialMobxState"]['albumStore']['thingStore']['mediaRegistry']

    # append dictionary of family data to families list
    for i in family:
        family_url = URL_families_base + i['place']['slug'].lower()
        families.append(
            {"id": i['place']['id'], 
            "name": i['place']['name'], 
            "income": int(math.ceil(i['place']['income'])), 
            "country": i['country']['name'], 
            "short_desc": i['place']['descriptionShort'], 
            "continent": i['region']['name'], 
            "url": family_url, 'slug': i['place']['slug']
            }
        )

# export to csv
df = pandas.DataFrame(families) 
df.to_csv('collection.csv', index=False, encoding="utf-8-sig")