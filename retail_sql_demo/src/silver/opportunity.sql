CREATE OR REFRESH STREAMING TABLE
    retail_sql_dev.retail_silver.opportunity (
        CONSTRAINT non_null_id
            EXPECT (id IS NOT NULL),

        CONSTRAINT non_null_name
            EXPECT (name IS NOT NULL),

        CONSTRAINT valid_amount
            EXPECT (amount IS NULL OR amount >= 0),

        CONSTRAINT valid_probability
            EXPECT (
                probability IS NULL
                OR probability BETWEEN 0 AND 100
            ),

        CONSTRAINT valid_stage
            EXPECT (
                stage_name IN (
                    'Prospecting',
                    'Qualification',
                    'Needs Analysis',
                    'Proposal/Price Quote',
                    'Negotiation/Review',
                    'Closed Won',
                    'Closed Lost'
                )
            )
    )
COMMENT 'Salesforce opportunity data with core sales fields and data quality checks'
AS
SELECT *
FROM STREAM(opportunity_transformed);