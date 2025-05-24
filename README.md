# Retail Sales Analysis Pipeline

This end-to-end project ingests online retail data, processes it with Hadoop/Pig/Hive, and visualizes monthly sales in a Jupyter notebook.

## Project Structure

retail-sales-project/
├── raw_data/ # source files (Excel, original CSV)
│ └── monthly_sales.csv
├── processed_data/ # cleaned CSVs for Hadoop
│ └── online_retail_II.csv
├── scripts/ # Pig & Hive scripts
│ ├── retail_pig_backup.pig
│ ├── hive_retail.sql
│ └── hive_queries.sql
├── notebooks/ # your Jupyter notebooks
│ └── monthly_sales_analysis.ipynb
├── data/ #  final CSV exports
├── output/ # Pig/Hive output in HDFS (local copy)
├── .gitignore
├── README.md
└── requirements.txt # Python deps for notebook

## How to run

1. **Pig ETL**  
   ```bash
   pig retail_pig_backup.pig
2. ** Hive SQL**
    ```bash
   hive -f scripts/hive_retail.sql
   hive -f scripts/hive_queries.sql
4. **Visualization**
    ```bash
   cd notebooks
   jupyter notebook
6. **Install dependencies**
    ```bash
   pip install -r requirements.txt
