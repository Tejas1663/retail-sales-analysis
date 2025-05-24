import pandas as pd

df = pd.read_csv('../processed_data/online_retail_II.csv')
df.rename(columns={'Price':'UnitPrice','Customer ID':'CustomerID'}, inplace=True)

# robust date parse:
df['InvoiceDate_parsed'] = pd.to_datetime(
    df['InvoiceDate'],
    infer_datetime_format=True,
    dayfirst=False,
    errors='coerce'
)
bad = df[df['InvoiceDate_parsed'].isna()]
if not bad.empty:
    print(f"⚠️ {len(bad)} rows failed to parse. Sample:")
    print(bad['InvoiceDate'].drop_duplicates().head(10).to_list())
    bad[['InvoiceDate']].drop_duplicates().to_csv('../output/bad_dates.csv', index=False)
df['InvoiceDate'] = df['InvoiceDate_parsed']
df.drop(columns=['InvoiceDate_parsed'], inplace=True)

df['month']      = df['InvoiceDate'].dt.to_period('M').astype(str)
df['sale_amt']   = df['Quantity'] * df['UnitPrice']

monthly = df.groupby('month')['sale_amt'].sum().reset_index()
monthly.columns = ['month','total_sales']
monthly.to_csv('../output/monthly_sales_python.csv', index=False)

