-- Total sales per month (already done by Pig, but you can double-check)
SELECT * FROM monthly_sales ORDER BY month;

-- Example: Filter for a specific year
SELECT * FROM monthly_sales WHERE month LIKE '2010-%';

-- Example: Monthly sales trend (with revenue brackets)
SELECT
  month,
  total_sales,
  CASE
    WHEN total_sales >= 50000 THEN 'High'
    WHEN total_sales >= 20000 THEN 'Medium'
    ELSE 'Low'
  END AS sales_level
FROM monthly_sales;
