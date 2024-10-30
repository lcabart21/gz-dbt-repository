SELECT
    date_date,
    products_id,
    orders_id,
    revenue,
    quantity,
    purchase_price,
    CAST(quantity*purchase_price as FLOAT64) as purchase_cost,
    CAST(revenue-(quantity*purchase_price) as FLOAT64) as margin,
    {{ margin_percent('revenue', 'quantity * purchase_price') }} AS margin_percent
from {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
USING (products_id)