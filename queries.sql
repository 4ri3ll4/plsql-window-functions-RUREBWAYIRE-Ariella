SELECT c.customer_id, c.name, 
       SUM(t.amount) AS total_deposits,
       RANK() OVER (ORDER BY SUM(t.amount) DESC) AS deposit_rank
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
WHERE a.account_type = 'Savings'
GROUP BY c.customer_id, c.name;


SELECT TO_CHAR(t.transaction_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_total,
       SUM(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM')) AS running_total
FROM transactions t
GROUP BY TO_CHAR(t.transaction_date, 'YYYY-MM')
ORDER BY month;


SELECT TO_CHAR(t.transaction_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_total,
       LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM')) AS prev_month_total,
       ROUND(
         ((SUM(t.amount) - LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM')))
          / LAG(SUM(t.amount)) OVER (ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM'))) * 100, 2
       ) AS growth_percent
FROM transactions t
GROUP BY TO_CHAR(t.transaction_date, 'YYYY-MM')
ORDER BY month;


SELECT c.customer_id, c.name,
       SUM(t.amount) AS total_transactions,
       NTILE(4) OVER (ORDER BY SUM(t.amount) DESC) AS spending_quartile
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.name
ORDER BY spending_quartile;


ELECT TO_CHAR(t.transaction_date, 'YYYY-MM') AS month,
       SUM(t.amount) AS monthly_total,
       ROUND(
         AVG(SUM(t.amount)) OVER (
             ORDER BY TO_CHAR(t.transaction_date, 'YYYY-MM')
             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 2
      ) AS moving_avg
FROM transactions t
GROUP BY TO_CHAR(t.transaction_date, 'YYYY-MM')
ORDER BY month;

