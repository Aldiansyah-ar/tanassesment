SELECT staff_id FROM staff_records;

SELECT branch_code FROM sales_transactions;

SELECT staff_id, COUNT(staff_id) AS number_transaction_handled FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

SELECT staff_id, SUM(total_amount) AS total_sales_amount FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

SELECT staff_id, AVG(total_amount) AS average_transaction_value FROM sales_transactions
GROUP BY staff_id
ORDER BY staff_id;

SELECT staff_id, performance_score FROM staff_records;

SELECT staff_id FROM staff_records
WHERE EXTRACT(YEAR FROM resignation_date) != 2023;

