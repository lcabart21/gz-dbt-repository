SELECT
    products_id,
    orders_id,
    quantity,
    purchase_price,
    CAST(quantity*purchase_price as INT64) as purchase_cost,
    CAST (revenue-(quantity*purchase_price) as INT64) as margin
from {{ ref('stg_raw__sales') }}
LEFT JOIN {{ ref('stg_raw__product') }}
USING (products_id)