import os
import pandas as pd

src_dir = os.path.dirname(os.path.abspath(__file__))
input_file_path = os.path.join(src_dir, '..', 'data', 'customers.csv')
output_file_path = os.path.join(src_dir, '..', 'data', 'cleaned_customers.csv')

df = pd.read_csv(input_file_path)

def data_cleaning(df):
    # email
    df = df.dropna()

    unformatted_email = df['email'] == 'jane.smith@email'
    df.loc[unformatted_email, 'email'] = 'jane.smith@email.com'

    # phone
    df = df[(df['phone'] != 'invalid_phone')]

    unformatted_phone = df['phone'] == '123-456-7890'
    df.loc[unformatted_phone, 'phone'] = '+1234567890'

    # customer_id
    df = df.drop_duplicates(subset=['name'])

    # join_date
    unformatted_join_date = df['join_date'] == '2023/07/01'
    df.loc[unformatted_join_date, 'join_date'] = '2023-07-01'

    df = df[df['join_date'] != 'future_date']

    df['join_date'] = pd.to_datetime(df['join_date'])

    # total_purchases
    df['total_purchases'] = df['total_purchases'].apply(lambda x: "{:.2f}".format(x))

    df.to_csv(output_file_path, index=False)

data_cleaning(df)