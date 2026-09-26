CREATE OR REFRESH MATERIALIZED VIEW
    retail_sql_dev.retail_gold.dim_product

COMMENT 'Product dimension for Gold analytics'

TBLPROPERTIES (
    'quality' = 'gold',
    'layer' = 'gold'
)

AS
SELECT *
FROM dim_product_transformed;