USE olist_db;

SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
WHERE o.order_purchase_timestamp IS NOT NULL
GROUP BY sales_month
ORDER BY sales_month ASC;