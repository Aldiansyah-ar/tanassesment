import pandas as pd
import psycopg2
import os

src_dir = os.path.dirname(os.path.abspath(__file__))
customers_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_customers.csv')
sales_transactions_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_sales_transactions.csv')

customers_df = pd.read_csv(customers_file_path)
sales_transactions_df = pd.read_csv(sales_transactions_file_path) 

def insert_data(df, table_name):
    with conn.cursor() as cursor:
        # Iterasi per baris pada DataFrame
        for _, row in df.iterrows():
            # Buat dictionary object baris pada DataFrame
            rows = {k: v for k, v in row.to_dict().items()}
            
            # Siapkan kolom dan nilai untuk query
            columns = ', '.join([f'"{column}"' for column in rows.keys()])
            placeholders = ', '.join(['%s'] * len(rows))
            values = list(rows.values())
            
            # Buat query SQL untuk insert
            query = f"""
                INSERT INTO {table_name} ({columns})
                VALUES ({placeholders})
            """
            # Eksekusi query untuk baris saat ini
            cursor.execute(query, values)

# Konfigurasi database
conn = psycopg2.connect(
    dbname="dump_db",
    user="postgres",
    password="admin",
    host="localhost",
    port="5432"
)

# Pemanggilan fungsi untuk menginput data ke dalam database
insert_data(customers_df, 'customers')
insert_data(sales_transactions_df, 'sales_transactions')

conn.commit()
conn.close()