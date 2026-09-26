CREATE OR REFRESH STREAMING TABLE
    retail_sql_dev.retail_silver.product_catalog (
        CONSTRAINT valid_product_id
            EXPECT (
                product_id IS NOT NULL
                AND LENGTH(TRIM(product_id)) > 0
            ),

        CONSTRAINT valid_product_name
            EXPECT (
                product_name IS NOT NULL
                AND LENGTH(TRIM(product_name)) > 0
            ),

        CONSTRAINT valid_category
            EXPECT (category IS NOT NULL),

        CONSTRAINT valid_price
            EXPECT (unit_price > 0),

        CONSTRAINT valid_launch_date
            EXPECT (launch_date IS NOT NULL),

        CONSTRAINT valid_supplier
            EXPECT (supplier_name IS NOT NULL)
    )
COMMENT 'Silver product catalog with standardized data and quality rules'
AS
SELECT *
FROM STREAM(product_catalog_transformed);