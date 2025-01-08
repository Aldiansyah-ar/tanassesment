import pandas as pd
import os

src_dir = os.path.dirname(os.path.abspath(__file__))
input_file_path = os.path.join(src_dir, '..', 'data', 'sales_transactions.csv')
output_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_sales_transactions.csv')

df = pd.read_csv(input_file_path)

def data_cleaning(df):
  # transaction_id
  df = df.dropna()
  df = df.drop_duplicates(subset=['transaction_id'])

  # transaction_date
  df = df[df['transaction_date'] != 'invalid_date']

  unformatted_transaction_date = df['transaction_date'] == '2023/12/01'
  df.loc[unformatted_transaction_date, 'transaction_date'] = pd.to_datetime('2023-12-01')

  # customer_id
  df = df[df['customer_id'] != 'INVALID']

  # payment_method
  df['payment_method'] = df['payment_method'].apply(lambda x: x.upper())
  df = df[df['payment_method'] != 'UNKNOWN']

  # quantity
  df = df[(df['quantity'] > 0)]

  # unit_price
  df['unit_price'] = df['unit_price'].apply(lambda x: "{:.2f}".format(x))

  # total_amount
  df['total_amount'] = df['total_amount'].apply(lambda x: "{:.2f}".format(x))

  df.to_csv(output_file_path, index=False)

data_cleaning(df)