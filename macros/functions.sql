{% macro margin_percent(revenue, purchase_cost) %}
    CASE 
        WHEN {{ revenue }} = 0 THEN NULL
        ELSE ROUND(({{ revenue }} - {{ purchase_cost }}) / {{ revenue }},2)
    END
{% endmacro %}
