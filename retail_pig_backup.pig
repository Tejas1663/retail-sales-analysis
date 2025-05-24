SET default_parallel 4;

-- Step 1: Load raw data
raw = LOAD '/user/tejas/retail-sales-project/online_retail_II.csv'
USING PigStorage(',') AS (
    InvoiceNo: chararray,
    StockCode: chararray,
    Description: chararray,
    Quantity: chararray,
    InvoiceDate: chararray,
    Price: chararray,
    CustomerID: chararray,
    Country: chararray
);

-- Step 2: Filter out invalid rows and cast numeric fields
filtered = FILTER raw BY (Quantity matches '\\d+' AND Price matches '\\d+(\\.\\d+)?');

sales = FOREACH filtered GENERATE
    InvoiceNo,
    StockCode,
    Description,
    (int)Quantity AS Quantity,
    InvoiceDate,
    (double)Price AS Price,
    CustomerID,
    Country;

-- Step 3: Compute month and sale amount
month_sales = FOREACH sales GENERATE
    SUBSTRING(InvoiceDate, 0, 7) AS month,
    (Quantity * Price) AS sale_amt;

-- Step 4: Group by month and calculate total sales
grouped = GROUP month_sales BY month;

monthly_totals = FOREACH grouped GENERATE
    group AS month,
    SUM(month_sales.sale_amt) AS total_sales;

-- Optional: Sort by month
sorted_totals = ORDER monthly_totals BY month;

-- Step 5: Store result
STORE sorted_totals INTO '/user/tejas/retail-sales-project/output/pig_monthly_sales'
USING PigStorage(',');
