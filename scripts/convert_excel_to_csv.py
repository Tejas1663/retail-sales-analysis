import pandas as pd

# Load the Excel file
excel_file = '/home/tejas/retail-sales-project/raw_data/online_retail_II.xlsx'

# Load sheet names to pick one
sheet_names = pd.ExcelFile(excel_file).sheet_names
print("Available Sheets:", sheet_names)

# Load a specific sheet (change if needed)
df = pd.read_excel(excel_file, sheet_name='Year 2010-2011')  # or 'Year 2009-2010'

output_path = '/home/tejas/retail-sales-project/processed_data/online_retail_II.csv'
df.to_csv(output_path, index=False)

print("CSV saved successfully!")
