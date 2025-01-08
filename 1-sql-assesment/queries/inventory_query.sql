SELECT branch_name FROM branch_details;

SELECT SUM(quantity) AS sum_in_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'IN';

SELECT SUM(quantity) AS sum_out_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'OUT';

SELECT transaction_type, SUM(quantity) AS sum_transaction FROM inventory_movements
GROUP BY transaction_type

SELECT SUM(quantity) AS sum_expired_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'EXP';

SELECT quantity, transaction_date FROM inventory_movements
WHERE transaction_date BETWEEN CURRENT_DATE - INTERVAL '3 months' AND CURRENT_DATE
ORDER BY quantity DESC;