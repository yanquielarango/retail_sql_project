CREATE OR REFRESH PRIVATE STREAMING TABLE product_catalog_transformed
AS
SELECT
    UPPER(TRIM(product_id)) AS product_id,
    INITCAP(TRIM(product_name)) AS product_name,
    INITCAP(TRIM(category)) AS category,

    COALESCE(
        INITCAP(TRIM(subcategory)),
        'Unknown'
    ) AS subcategory,

    COALESCE(
        INITCAP(TRIM(brand)),
        'Unknown'
    ) AS brand,

    ROUND(unit_price, 2) AS unit_price,

    INITCAP(TRIM(supplier_name)) AS supplier_name,

    launch_date,

    CASE
        WHEN unit_price >= 3000 THEN 'PREMIUM'
        WHEN unit_price >= 500 THEN 'MID_RANGE'
        ELSE 'BUDGET'
    END AS product_segment,

    __START_AT AS start_at,
    __END_AT AS end_at,

    (__END_AT IS NULL) AS is_active,

    updated_at,
    CURRENT_TIMESTAMP() AS processed_at

FROM STREAM(retail_sql_dev.postgres_bronze.product_catalog);