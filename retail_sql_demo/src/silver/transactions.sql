CREATE OR REFRESH MATERIALIZED VIEW retail_sql_dev.retail_silver.transactions (
    CONSTRAINT valid_transaction_id
        EXPECT (transaction_id IS NOT NULL),

    CONSTRAINT valid_product_id
        EXPECT (product_id IS NOT NULL),

    CONSTRAINT valid_quantity
        EXPECT (quantity > 0),

    CONSTRAINT valid_selling_price
        EXPECT (selling_price >= 0),

    CONSTRAINT valid_discount
        EXPECT (
            discount_amount >= 0
            AND discount_amount <= selling_price
        ),

    CONSTRAINT valid_timestamp
        EXPECT (transaction_timestamp IS NOT NULL),

    CONSTRAINT valid_rescued_data
        EXPECT (_rescued_data IS NULL)
)
AS
SELECT *
FROM transactions_transformed;