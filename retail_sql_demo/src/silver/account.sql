CREATE OR REFRESH MATERIALIZED VIEW retail_sql_dev.retail_silver.account (
    CONSTRAINT non_null_id
        EXPECT (
            id IS NOT NULL
            AND LENGTH(TRIM(id)) > 0
        ),

    CONSTRAINT non_null_customer_name
        EXPECT (
            customer_name IS NOT NULL
            AND LENGTH(TRIM(customer_name)) > 0
        ),

    CONSTRAINT valid_billing_country
        EXPECT (
            billing_country IS NOT NULL
            AND LENGTH(TRIM(billing_country)) > 0
        ),

    CONSTRAINT valid_billing_city
        EXPECT (
            billing_city IS NOT NULL
            AND LENGTH(TRIM(billing_city)) > 0
        )
)
COMMENT 'Silver Salesforce account data with standardized fields and quality monitoring'
AS
SELECT *
FROM account_transformed;