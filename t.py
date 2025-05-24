import pandas as pd

# Load and convert first part
df1 = pd.read_excel("online_retail_II.xlsx")
df1.to_csv("online_retail_II_part1.csv", index=False)

# Load and convert second part
df2 = pd.read_excel("online_retail_II_part2.xlsx")
df2.to_csv("online_retail_II_part2.csv", index=False)
