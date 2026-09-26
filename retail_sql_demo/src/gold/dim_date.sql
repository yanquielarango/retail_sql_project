CREATE OR REFRESH MATERIALIZED VIEW
    retail_sql_dev.retail_gold.dim_date

COMMENT 'Date dimension for the Gold layer'

TBLPROPERTIES (
    'quality' = 'gold',
    'layer' = 'gold'
)

AS
SELECT *
FROM dim_date_transformed;