CREATE OR REFRESH PRIVATE MATERIALIZED VIEW dim_product_transformed
AS
SELECT
    product_id,
    product_name,
    category,
    subcategory,
    brand,
    product_segment,
    unit_price,
    supplier_name,
    launch_date,
    updated_at

FROM retail_sql_dev.retail_silver.product_catalog_valid

WHERE is_active;