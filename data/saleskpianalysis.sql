use genz_fashion;

 SELECT
    COUNT(order_id) AS total_orders
FROM orders;



SELECT 
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders;



SELECT
    SUM(quantity) AS total_units_sold
FROM orders;



 SELECT
    ROUND(
        AVG(order_value),
        2
    ) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(
            p.price *
            o.quantity *
            (1 - o.discount / 100)
        ) AS order_value
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY o.order_id
) AS order_summary;



SELECT
    ROUND(
        AVG(discount),
        2
    ) AS average_discount_percentage
FROM orders;



SELECT
    ROUND(
        (
            SUM(
                ((p.price * (1 - o.discount / 100))
                - p.cost_price) * o.quantity
            )
            /
            SUM(
                p.price * o.quantity *
                (1 - o.discount / 100)
            )
        ) * 100,
        2
    ) AS profit_margin_percentage
FROM orders o
JOIN products p
    ON o.product_id = p.product_id;
