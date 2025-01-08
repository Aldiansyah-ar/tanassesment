import pandas as pd
import psycopg2
import os

src_dir = os.path.dirname(os.path.abspath(__file__))
customers_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_customers.csv')
sales_transactions_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_sales_transactions.csv')

customers_df = pd.read_csv(customers_file_path)
sales_transactions_df = pd.read_csv(sales_transactions_file_path) 

def insert_data(df, table_name):
    # Iterasi per baris pada DataFrame
    with conn.cursor() as cursor:
        for _, row in df.iterrows():
            # Filter kolom berdasarkan excluded_fields
            filtered_row = {k: v for k, v in row.to_dict().items()}
            
            # Siapkan kolom dan nilai untuk query
            columns = ', '.join([f'"{column}"' for column in filtered_row.keys()])
            placeholders = ', '.join(['%s'] * len(filtered_row))
            values = list(filtered_row.values())
            
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

insert_data(customers_df, 'customers')
insert_data(sales_transactions_df, 'sales_transactions')

conn.commit()
conn.close()