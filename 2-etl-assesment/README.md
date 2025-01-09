# ETL Assesment

## Overview

ETL Assesment merupakan bagian kedua Data Enginner Assesment. ETL Assesment berisi tugas proses pembersihan data dan input data ke dalam database. Data input dan output disimpan di dalam folder './data'. Proses pembersihan dan input data ke dalam database menggunakan file Python di dalam folder './src' dan error logs di dalam folder './logs'.

## Project Structure

    .
    ├── ...
    ├── 2-etl-assesment                            # Folder ETL Assesment
    │   ├── data
    │   │    ├── customers.csv                     # Dataset of customers
    │   │    ├── sales_transactions.csv            # Dataset of sales transactions
    │   │    ├── cleaned_customers.csv             # Cleaned customers dataset
    │   │    ├── cleaned_sales_transactions.csv    # Cleaned sales transactions dataset
    │   │    └── db_dump.sql                       # Database target 
    │   ├── logs                                    
    │   ├── src 
    |   |    ├── customers.py                      # Cleaning and transforming customers dataset
    |   |    ├── loadtosql.py                      # Input cleaning of each dataset into database
    |   |    └── sales_transactions.py             # Cleaning and transforming sales transactions dataset
    │   └── README.md                              # Documentation
    └── ...

## Data Documentation

    customers.csv
    ├── customers_id : CUSXXX (VARCHAR(10))
    ├── name: (VARCHAR(100))
    ├── email: xxx@email.com (VARCHAR(100))
    ├── phone: VARCHAR(15)
    ├── join_date: yyyy-mm-dd
    └── total_purchases: DECIMAL(12,2)

    sales_transactions.csv
    ├── transaction_id : TX00X (VARCHAR(20))
    ├── transaction_date: yyyy-mm-dd
    ├── customers_id : CUSXXX (VARCHAR(100))
    ├── product_name: VARCHAR(100)
    ├── quantity: INTEGER (quantity > 0)
    ├── unit_price: DECIMAL(12,2) (unit_price > 0)
    ├── total_amount: DECIMAL(12,2) (total_amount > 0)
    ├── payment_method: 'CASH','CREDIT','DEBIT'
    └── status: VARCHAR(20) 

## Tools Used

- Pandas : v.2.2.3
- PostgreSQL : v.16.0
- Psycopg2 : v.2.9.10

## Instalations

- Run customers.py untuk membersihkan dataset customers.csv
- Run sales_transactions.py untuk membersihkan dataset sales_transactions.csv
- Run loadintosql.py untuk input data ke dalam database 