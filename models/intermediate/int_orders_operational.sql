SELECT
    orders_id,
    date_date,
    (margin+shipping_fee-logcost-ship_cost) as operational_margin,
    quantity
FROM {{ ref('int_orders_margin') }}
LEFT JOIN {{ ref('stg_raw__ship') }}
USING (orders_id)