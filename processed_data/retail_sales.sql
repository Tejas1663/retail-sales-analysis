CREATE TABLE IF NOT EXISTS retail_sales (
  InvoiceNo STRING,
  StockCode STRING,
  Description STRING,
  Quantity INT,
  InvoiceDate STRING,
  UnitPrice FLOAT,
  CustomerID STRING,
  Country STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

SELECT * FROM retail_sales LIMIT 10;
data/online_retail_II.csv' INTO TABLE retail_sales;

