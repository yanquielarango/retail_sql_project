CREATE OR REFRESH PRIVATE MATERIALIZED VIEW dim_customer_transformed
AS
SELECT
    id AS customer_id,
    customer_name,
    type AS customer_type,
    billing_city,
    billing_state,
    billing_country,
    phone,
    website,
    industry,
    annual_revenue,
    number_of_employees,
    description

FROM retail_sql_dev.retail_silver.account_valid

WHERE NOT is_deleted
  AND is_active;