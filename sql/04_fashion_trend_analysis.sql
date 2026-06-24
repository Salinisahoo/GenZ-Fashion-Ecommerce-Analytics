use genz_fashion;

-- ==================================================
-- Trend 1: Monthly Sales Trend
-- ==================================================

SELECT
    DATE_FORMAT(
        order_date,
        '%Y-%m'
    ) AS sales_month,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1 - o.discount/100)
        ),
        2
    ) AS monthly_revenue

FROM orders o

JOIN products p
ON o.product_id = p.product_id

GROUP BY sales_month

ORDER BY sales_month;



-- Trend 2: Top 10 Best-Selling Products
-- ==================================================

SELECT
    p.product_name,

    SUM(
        o.quantity
    ) AS units_sold

FROM orders o

JOIN products p
ON o.product_id = p.product_id

GROUP BY p.product_name

ORDER BY units_sold DESC

LIMIT 10;



-- Trend 3: Highest Revenue Products
-- ==================================================

SELECT
    p.product_name,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1 - o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN products p
ON o.product_id = p.product_id

GROUP BY p.product_name

ORDER BY revenue DESC

LIMIT 10;



-- Trend 4: Fashion Style Performance
-- ==================================================

SELECT
    p.style,

    SUM(o.quantity) AS units_sold,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1-o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN products p
ON o.product_id = p.product_id

GROUP BY p.style

ORDER BY revenue DESC;



-- Trend 5: Category Performance
-- ==================================================

SELECT
    p.category,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1-o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN products p
ON o.product_id = p.product_id

GROUP BY p.category

ORDER BY revenue DESC;



SELECT
    c.city,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1-o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id

GROUP BY c.city

ORDER BY revenue DESC;




-- ==================================================
-- Trend 6: Revenue by City
-- ==================================================

SELECT
    c.city,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1-o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id

GROUP BY c.city

ORDER BY revenue DESC;





-- Trend 7: Payment Mode Analysis
-- ==================================================

SELECT
    payment_mode,

    COUNT(*) AS total_orders

FROM orders

GROUP BY payment_mode

ORDER BY total_orders DESC;




-- Trend 8: Customer Segment Revenue
-- ==================================================

SELECT
    c.customer_type,

    ROUND(
        SUM(
            p.price *
            o.quantity *
            (1-o.discount/100)
        ),
        2
    ) AS revenue

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id

GROUP BY c.customer_type

ORDER BY revenue DESC;




-- Trend 9: Age Group Revenue
-- ==================================================

SELECT

CASE

WHEN age BETWEEN 18 AND 21
THEN '18-21'

WHEN age BETWEEN 22 AND 25
THEN '22-25'

WHEN age BETWEEN 26 AND 30
THEN '26-30'

ELSE '31-35'

END AS age_group,

ROUND(
SUM(
p.price *
o.quantity *
(1-o.discount/100)
),
2
) AS revenue

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id

GROUP BY age_group

ORDER BY revenue DESC;
