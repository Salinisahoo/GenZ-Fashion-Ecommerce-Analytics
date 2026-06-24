SELECT
    o.order_id,
    o.order_date,
    o.quantity,
    o.discount,
    o.payment_mode,

    c.customer_id,
    c.age,
    c.gender,
    c.city,
    c.customer_type,

    p.product_id,
    p.product_name,
    p.category,
    p.style,
    p.price,
    p.cost_price,

    ROUND(
        p.price *
        o.quantity *
        (1-o.discount/100),
        2
    ) AS revenue,

    ROUND(
        (
            (p.price*(1-o.discount/100))
            - p.cost_price
        ) * o.quantity,
        2
    ) AS profit

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN products p
ON o.product_id = p.product_id;