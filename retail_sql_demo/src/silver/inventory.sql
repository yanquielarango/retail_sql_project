CREATE OR REFRESH STREAMING TABLE retail_sql_dev.silver.inventory (
    CONSTRAINT non_null_inventory_id
        EXPECT (inventory_id IS NOT NULL AND LENGTH(TRIM(inventory_id)) > 0)
        ON VIOLATION DROP ROW,
    CONSTRAINT valid_stock_quantity
        EXPECT (stock_quantity >= 0)
        ON VIOLATION DROP ROW
)
COMMENT 'Silver inventory data with standardized fields and quality monitoring'
AS
SELECT
    *
FROM STREAM(retail_sql_dev.postgres_bronze.inventory);