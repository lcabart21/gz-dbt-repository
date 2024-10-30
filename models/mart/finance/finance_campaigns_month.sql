SELECT
    FORMAT_DATE('%Y-%m',DATE (date_date)) AS year_month
    ,ROUND(SUM(ads_margin)) AS ads_margin
    ,ROUND(AVG(average_basket)) AS average_basket
    ,ROUND(SUM(operational_margin)) AS operational_margin
    ,ROUND(SUM(ads_cost)) AS ads_cost
    ,ROUND(SUM(ads_impression)) AS ads_impression
    ,ROUND(SUM(ads_clicks)) AS ads_clicks
    ,ROUND(SUM(quantity)) AS quantity
    ,ROUND(SUM(revenue)) AS revenue
    ,ROUND(SUM(purchase_cost)) AS purchase_cost
    ,ROUND(SUM(margin)) AS margin
    ,ROUND(SUM(shipping_fee)) AS shipping_fee
    ,ROUND(SUM(logcost)) AS log_cost
    ,ROUND(SUM(ship_cost)) AS ship_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY FORMAT_DATE('%Y-%m',DATE (date_date))
ORDER BY year_month DESC