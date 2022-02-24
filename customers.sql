WITH first_order AS (
SELECT o.customer_id
, MIN(o.created_at) AS first_order_at
FROM analytics-engineers-club.coffee_shop.orders o
GROUP BY o.customer_id
)
SELECT fo.customer_id
, c.name
, c.email
, fo.first_order_at
, COUNT (DISTINCT o.id) AS number_of_orders
FROM analytics-engineers-club.coffee_shop.customers c
LEFT JOIN analytics-engineers-club.coffee_shop.orders o
ON c.id = o.customer_id
LEFT JOIN first_order fo
ON c.id = fo.customer_id
GROUP BY 1,2,3,4
