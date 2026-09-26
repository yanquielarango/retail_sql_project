CREATE OR REFRESH PRIVATE STREAMING TABLE inventory_trasnformed
AS
SELECT
    UPPER(TRIM(inventory_id)) AS inventory_id,
    UPPER(TRIM(product_id)) AS product_id,
    UPPER(TRIM(store_id)) AS store_id,
    stock_quantity,
    reorder_level,

    CASE 
        WHEN stock_quantity = 0 THEN 'OUT_OF_STOCK',
        WHEN stock_quantity <= reorder_level THEN 'LOW_STOCK',
        ELSE 'HEALTHY',
    END AS inventory_status,

    TRIM(warehouse_location) AS warehouse_location,
    last_stock_update.
    CURRENT_TIMESTAMP() AS processed_at

FROM STREAM(retail_sql_dev.postgres_bronze.inventory);
