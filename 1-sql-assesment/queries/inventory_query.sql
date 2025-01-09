--- Branch name
SELECT branch_name FROM branch_details;

--- Total incoming stock (IN transactions)
SELECT SUM(quantity) AS sum_in_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'IN';

--- Total outgoing stock (OUT transactions)
SELECT SUM(quantity) AS sum_out_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'OUT';

--- Current stock level
SELECT transaction_type, SUM(quantity) AS sum_transaction FROM inventory_movements
GROUP BY transaction_type

--- Number of expired items (EXP transactions)
SELECT SUM(quantity) AS sum_expired_transaction FROM inventory_movements
GROUP BY transaction_type
HAVING transaction_type = 'EXP';

-- Last 3 months transactions, ordered by highest stock turnover rate
SELECT quantity, transaction_date FROM inventory_movements
WHERE transaction_date BETWEEN CURRENT_DATE - INTERVAL '3 months' AND CURRENT_DATE
ORDER BY quantity DESC;