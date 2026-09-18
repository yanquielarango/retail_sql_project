CREATE OR REFRESH STREAMING TABLE retail_sql_dev.blob_bronze.transactions
COMMENT 'Bronze transactions ingested incrementally from CSV files'
TBLPROPERTIES (
    'quality' = 'bronze',
    'layer' = 'bronze'
)
AS
SELECT *
FROM STREAM read_files(
    '/Volumes/retail_sql_dev/volumes/blob_source/transactions_source',
    format => 'csv',
    header => true,
    nullValue => 'null',
    includeExistingFiles => true,
    schemaHints => '
        transaction_id STRING,
        opportunity_name STRING,
        product_id STRING,
        store_id STRING,
        quantity INT,
        selling_price DECIMAL(10,2),
        discount_amount DECIMAL(10,2),
        transaction_timestamp STRING,
        payment_mode STRING,
        sales_channel STRING
    ',
    schemaEvolutionMode => 'addNewColumns',
    rescuedDataColumn => '_rescued_data'
);