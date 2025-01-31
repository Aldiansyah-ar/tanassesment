PGDMP      7                 }            dump_db    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    60889    dump_db    DATABASE     ~   CREATE DATABASE dump_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE dump_db;
                postgres    false            �            1259    60901 	   customers    TABLE     �  CREATE TABLE public.customers (
    customer_id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15),
    join_date date NOT NULL,
    total_purchases numeric(12,2) DEFAULT 0.00,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    60911    sales_transactions    TABLE     �  CREATE TABLE public.sales_transactions (
    transaction_id character varying(20) NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
    customer_id character varying(10),
    product_name character varying(100) NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    total_amount numeric(12,2) NOT NULL,
    payment_method character varying(10),
    status character varying(20) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT sales_transactions_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['CASH'::character varying, 'CREDIT'::character varying, 'DEBIT'::character varying])::text[]))),
    CONSTRAINT sales_transactions_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT sales_transactions_total_amount_check CHECK ((total_amount > (0)::numeric)),
    CONSTRAINT sales_transactions_unit_price_check CHECK ((unit_price > (0)::numeric))
);
 &   DROP TABLE public.sales_transactions;
       public         heap    postgres    false            �          0    60901 	   customers 
   TABLE DATA           x   COPY public.customers (customer_id, name, email, phone, join_date, total_purchases, created_at, updated_at) FROM stdin;
    public          postgres    false    215   0       �          0    60911    sales_transactions 
   TABLE DATA           �   COPY public.sales_transactions (transaction_id, transaction_date, customer_id, product_name, quantity, unit_price, total_amount, payment_method, status, created_at) FROM stdin;
    public          postgres    false    216          '           2606    60910    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    215            )           2606    60908    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    215            +           2606    60921 *   sales_transactions sales_transactions_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_pkey PRIMARY KEY (transaction_id);
 T   ALTER TABLE ONLY public.sales_transactions DROP CONSTRAINT sales_transactions_pkey;
       public            postgres    false    216            ,           2606    60922 6   sales_transactions sales_transactions_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_transactions
    ADD CONSTRAINT sales_transactions_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 `   ALTER TABLE ONLY public.sales_transactions DROP CONSTRAINT sales_transactions_customer_id_fkey;
       public          postgres    false    215    216    4649            �   �   x������0���)�&�N���X]��,^��j�m���fDa����3����{��*��ypH������jH�K[9��rԹfЌ��6ba���f���+�&�b�5���cX��)�����l���M��Ȗ����J�s�����$m-�2�H��_�Ӷ�.��Hw�J��"i�:���zi�+���w���yz\����ʲ�
A�C      �   �   x����
�`E��S���4��J��ڤA�6�A�������tU�����s�"#�K�"�0�H#D�����P��RD���;ޤ�"����ײ-�.Dm����b$�~H8��p�B���֦����@=�׌���w�4��@aYޏ�� @l�;J�άG]Vť:�L~�B�ݕ?+�?��{��< �WY�     