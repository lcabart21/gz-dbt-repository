select
    date_date,
    count(orders_id) as nb_transactions,
    round(sum(revenue),2) as revenue,
    round(avg(revenue),2) as average_basket,
    round(sum(margin),2) as margin,
    round(sum(margin + shipping_fee - logcost - ship_cost),2) as operational_margin,
    round(sum(purchase_cost),2) as purchase_cost,
    round(sum(logcost),2) as logcost,
    sum(quantity) as quantity
from {{ ref("int_orders_margin") }}
left join {{ ref("stg_raw__ship") }} using (orders_id)
group by date_date
