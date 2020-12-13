# Spice Analysis

| ![Collage of spices](spice-collage.png "Spice Analysis Collage") |
| :----------------------------------------------------------- |
| Collage of family spices from Dollar Street. Photos by: Johan Eriksson, Lucy Forsyth, Isaiah Williams, Omar Hayana, Rosine Fidele, Joseph Ramirez, Raashi Saxena, and Alisa Sidorenko. Licensed under creative commons 4.0 |

---

## Description

This is an accompanying repository for our paper that tried to answer the following statistical question: *How Income & Location Impact the Number of Spices in a Household*.

#### Technologies used for this analysis

- Python 3.8.3
- RStudio 1.3.1073

---

## How to use

Before trying out our code, make sure to install some R dependencies: ggplot2 and RColorBrewer. For installation of our python dependencies, use terminal to cd into this folder, and use this command:

```bash
pip3 install -r requirements.txt
```

---

## Sampling frame

Our sampling frame was created using code/appendix.py, which scraped family data from Dollar Street. It was last gathered on October 10, 2020. This frame has a total of 397 cases. Here is some information explaining the columns of this frame.

| Variables  | Type        | Description                                                  |
| :--------- | :---------- | :----------------------------------------------------------- |
| id         | Identifier  | A unique string of characters and integers.                  |
| name       | Identifier  | The family name.                                             |
| income     | Numeric     | Income of family in dollars. Please check how these values were calculated [by Dollar Street](https://www.gapminder.org/dollar-street/about). |
| country    | Categorical | The name of the country the family lives in.                 |
| continent  | Categorical | The name of the continent the family lives in.               |
| url        | Identifier  | The Dollar Street URL of the family.                         |
| slug       | Identifier  | A unique identifier found at the end of the family URL.      |
| short_desc | Identifier  | A short description about the family.                        |

## References

### [Dollar Street](https://www.gapminder.org/dollar-street)

By using Dollar Street family data, created by Anna Rosling Rönnlund at Gapminder, it helped answer our question. Please check them out!