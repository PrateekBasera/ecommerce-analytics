USE olist_db;

SELECT 
    p.payment_type,
    COUNT(DISTINCT p.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue,
    ROUND(AVG(p.payment_value), 2) AS avg_payment_per_transaction,
    ROUND(AVG(p.payment_installments), 1) AS avg_installments
FROM order_payments p
GROUP BY p.payment_type
ORDER BY total_revenue DESC;