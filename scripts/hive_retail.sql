CREATE EXTERNAL TABLE IF NOT EXISTS monthly_sales (
  month STRING,
  total_sales DOUBLE
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/tejas/retail-sales-project/output/pig_monthly_sales';
