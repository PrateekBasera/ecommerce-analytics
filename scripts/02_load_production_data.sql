USE olist_db;

INSERT INTO customers
SELECT 
    customer_id, 
    customer_unique_id, 
    CAST(customer_zip_code_prefix AS SIGNED), 
    customer_city, 
    customer_state
FROM raw_customers;

INSERT INTO orders
SELECT 
    order_id, 
    customer_id, 
    order_status,
    NULLIF(order_purchase_timestamp, ''),
    NULLIF(order_approved_at, ''),
    NULLIF(order_delivered_carrier_date, ''),
    NULLIF(order_delivered_customer_date, ''),
    NULLIF(order_estimated_delivery_date, '')
FROM raw_orders;

INSERT INTO order_items
SELECT 
    order_id, 
    CAST(order_item_id AS SIGNED), 
    product_id, 
    seller_id, 
    NULLIF(shipping_limit_date, ''), 
    CAST(price AS DECIMAL(10,2)), 
    CAST(freight_value AS DECIMAL(10,2))
FROM raw_order_items;

INSERT INTO order_payments
SELECT 
    order_id, 
    CAST(payment_sequential AS SIGNED), 
    payment_type, 
    CAST(payment_installments AS SIGNED), 
    CAST(payment_value AS DECIMAL(10,2))
FROM raw_order_payments;