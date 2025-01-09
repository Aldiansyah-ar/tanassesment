-- Staff ID
SELECT staff_id FROM staff_records;

--- Staff's branch name
SELECT branch_code FROM sales_transactions;

--- Number of transactions handled
SELECT staff_id, COUNT(staff_id) AS number_transaction_handled FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

--- Total sales amount
SELECT staff_id, SUM(total_amount) AS total_sales_amount FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

--- Average transaction value
SELECT staff_id, AVG(total_amount) AS average_transaction_value FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

--- Performance score
SELECT staff_id, performance_score FROM staff_records;

-- Active staff (no resignation date) in 2023
SELECT staff_id, resignation_date FROM staff_records
WHERE EXTRACT(YEAR FROM resignation_date) != 2023;