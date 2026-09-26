CREATE OR REFRESH MATERIALIZED VIEW
    retail_sql_dev.retail_gold.fact_sales

COMMENT 'Sales fact table for Gold analytics'

TBLPROPERTIES (
    'quality' = 'gold',
    'layer' = 'gold'
)

AS
SELECT *
FROM fact_sales_transformed;