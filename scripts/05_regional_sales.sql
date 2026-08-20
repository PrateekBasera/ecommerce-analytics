USE olist_db;

SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_unique_customers,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;