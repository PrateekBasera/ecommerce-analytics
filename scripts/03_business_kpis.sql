USE olist_db;

SELECT 
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    COUNT(DISTINCT p.order_id) AS total_orders,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT p.order_id), 2) AS average_order_value,
    COUNT(DISTINCT o.customer_id) AS total_unique_customers
FROM order_payments p
JOIN orders o ON p.order_id = o.order_id;