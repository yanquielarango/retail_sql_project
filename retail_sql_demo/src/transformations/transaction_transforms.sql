CREATE TEMPORARY VIEW transactions_transformed
AS
SELECT
    transaction_id,
    opportunity_name,
    product_id,
    store_id,
    CAST(quantity AS INT) AS quantity,
    CAST(selling_price AS DECIMAL(10,2)) AS selling_price,
    CAST(discount_amount AS DECIMAL(10,2)) AS discount_amount,
    TO_TIMESTAMP(
        transaction_timestamp,
        'dd-MMM-yyyy hh.mm.ss a'
    ) AS transaction_timestamp,
    payment_mode,
    sales_channel,
    _rescued_data
FROM retail_sql_dev.blob_bronze.transactions;