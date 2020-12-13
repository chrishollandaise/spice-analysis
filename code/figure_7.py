#!/usr/bin/env python
# coding: utf-8

# In[25]:


import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt 


# In[26]:


# old rule arrangement based on spice_range variable
groups = [[] for i in range(10)]
cat = [i for i in df.spice_range.cat.categories]

for spice_range, income in zip(df.spice_range, df.income):
        groups[cat.index(spice_range)].append(income)
        
# groups based on old rule arrangement
for i in range(len(groups)):
    print(cat[i], len(groups[i]))


# In[27]:


df = pd.read_csv("spices_data.csv")
df['spice_range'] = df['spice_range'].astype('category')


# In[28]:


# organizing groups, keep adding groups together until they reach at least 14 cases
groups_new = [groups[0], 
              groups[8], 
              groups[9] + groups[1], 
              groups[2] + groups[3] + groups[4] + groups[5] + groups[6] + groups[7]]

cat_new = [cat[0], cat[8], "9-16", "17-52"]


# In[29]:


new_income = []
new_ranges = []

# preparing data into a readable list for sns
for listIndex in range(len(groups_new)):
    for index in range(len(groups_new[listIndex])):
        new_income.append(groups_new[listIndex][index])
        new_ranges.append(cat_new[listIndex])


# In[30]:


# creating new df based on new groups
data = {'income': new_income, 'spice_range': new_ranges}
new_df = pd.DataFrame(data, columns=['income', 'spice_range'])


# In[31]:


# configuring some plot settings, visual
sns.set(rc={'figure.figsize':(11.7,8.27)})
sns.set_style("darkgrid")
sns.set_context('paper', font_scale=1.9, rc={'axes.titlesize': 19.6})

# setting up some parameters in the way it orders
median = ['0-4', '5-8', '9-16', '17-52']
black_diamond = dict(markerfacecolor='white', marker='D')

# plotting it
g = sns.boxplot(data=new_df, order=median, orient="h", x="income", y="spice_range", 
                palette="Pastel1", flierprops=black_diamond, fliersize=10, width=0.5)

plt.xlabel("Income ($)", size=18, weight="bold", labelpad=20)
plt.ylabel("Range of Spices", size=18, weight="bold", labelpad=20)


# In[32]:


# exporting new .csv with new group arrangement
new_df.to_csv(r'anova_test.csv', index = False)

