CREATE OR REFRESH MATERIALIZED VIEW
    retail_sql_dev.retail_gold.dim_customer (
        customer_id STRING,
        customer_name STRING,
        customer_type STRING,
        billing_city STRING,
        billing_state STRING,
        billing_country STRING,

        phone STRING
            MASK retail_sql_dev.retail_gold.mask_customer_phone,

        website STRING,
        industry STRING,
        annual_revenue DECIMAL(38,20),
        number_of_employees INT,
        description STRING
    )
COMMENT 'Customer dimension for Gold analytics with RLS and CLS'

TBLPROPERTIES (
    'quality' = 'gold',
    'layer' = 'gold'
)

WITH ROW FILTER
    retail_sql_dev.retail_gold.filter_customer_region
    ON (billing_state)

AS
SELECT *
FROM dim_customer_transformed;