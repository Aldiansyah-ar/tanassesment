import pandas as pd
import os

# Lokasi direktori file input dan output
src_dir = os.path.dirname(os.path.abspath(__file__))
input_file_path = os.path.join(src_dir, '..', 'data', 'sales_transactions.csv')
output_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_sales_transactions.csv')

df = pd.read_csv(input_file_path)

# Drop data kosong
def data_cleaning(df):
  # Handling data pada kolom transaction_id
  df = df.dropna()
  df = df.drop_duplicates(subset=['transaction_id'])

  # Handling data pada kolom transaction_date
  df = df[df['transaction_date'] != 'invalid_date']

  unformatted_transaction_date = df['transaction_date'] == '2023/12/01'
  df.loc[unformatted_transaction_date, 'transaction_date'] = pd.to_datetime('2023-12-01')

  # Handling data pada kolom customer_id
  df = df[df['customer_id'] != 'INVALID']

  # Handling data pada kolom payment_method
  df['payment_method'] = df['payment_method'].apply(lambda x: x.upper())
  df = df[df['payment_method'] != 'UNKNOWN']

  # Handling data pada kolom quantity
  df = df[(df['quantity'] > 0)]

  # Handling data pada kolom unit_price
  df['unit_price'] = df['unit_price'].apply(lambda x: "{:.2f}".format(x))

  # Handling data pada kolom total_amount
  df['total_amount'] = df['total_amount'].apply(lambda x: "{:.2f}".format(x))

  df.to_csv(output_file_path, index=False)

# Pemanggilan fungsi untuk membersihkan data
data_cleaning(df)