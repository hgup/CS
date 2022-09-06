---
layout: default
title: Choice of Idioms
parent: R Programming
nav_order: 1

---

# Choice of Idioms

Depending on the task and data we can decide to use an **idiom** that we are familiar with.

Here is a list of choices that you should be familiar (and are useful in the most general scenarios).

| Idiom                                                        | Usage                                                        | Additional Notes                                             | Ref   |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ----- |
| Simple Bar Chart                                             | One dimensional data                                         | Highlight Bars that are of significance                      | 6.1.1 |
| *Bar Plot for* <br />Multiple Responses (Simple)             | For Multidimensional Data;<br />Ex. *(Agree/Disagree/Strongly/NA) etc* | Use the right color coding, Ex. Give grey for **NA** and a **dark color** for **Strong** agreement and a **light color** for a **neutral** agreement. Differentiate between agree and disagree using different colors (e.g. Blue and Pink) | 6.1.3 |
| *Bar Plot for* <br />Multiple Responses Questions (**Segregate Agree/Disagree** Variant) | The same as above with the difference being that ***Disagree** is to the left* and ***Agree** is to the right* so that **there's a clear distinction between Agree VS Disagree** | Indexing should be done on both ends. Keep a Separate panel for **NA**. | 6.1.4 |
| *Bar Plot for* <br />Multiple Response Questions (**Panel** Variant) | Separate all the possible choices (NA/ Agree/ +strongly / Disagree) and give them separate panels such that **we can compare individual choices across questions**. | Indexing of all panels should be done correctly              | 6.1.5 |
| *Bar Plot for* <br />Multiple Responses (**Symbols** for Individuals) **`TECHNIQUE`** | Show **Orange** (For Women) and **Blue** (for Men) to give idea about the demographics of the responses. | Instead of percentages, let each *person symbol* represent 10 people and the index contain **number of people** | 6.1.6 |
| *Bar Plot for* <br />Multiple Response categories (**Grouped**) | If we **compare the responses of three countries for different statements**, its better to group them. | Put percentages of Agree and Disagree on either sides of the plot to show the overall agreement-disagreement ratio. | 6.1.7 |
| Column Chart with **2 line labelling**. **`TECHNIQUE`**      | We can put bars in a dense fashion because of their uniform breadth. But the same is not true for labels.<br />To make them fit, **we can alternate their occurrences into 2 lines**. |                                                              | 6.1.8 |
| Column Chart with 45° labelling **`TECHNIQUE`**              | As the name says...                                          |                                                              | 6.1.9 |
| *Profile Plot for* Multiple Responses. Based on Mean Value   | Views on different statements on either side of the line. Plotting their means and Joining them. Different lines to compare demographics. |                                                              |       |

