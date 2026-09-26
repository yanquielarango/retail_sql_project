CREATE OR REFRESH PRIVATE STREAMING TABLE opportunity_transformed
AS
SELECT
    Id AS id,
    IsDeleted AS is_deleted,
    AccountId AS account_id,
    Name AS name,
    Description AS description,
    StageName AS stage_name,

    CAST(Amount AS DECIMAL(18,2)) AS amount,

    CASE
        WHEN CAST(Amount AS DECIMAL(18,2)) > 100000
            THEN 'ENTERPRISE'
        WHEN CAST(Amount AS DECIMAL(18,2)) > 25000
            THEN 'MID_MARKET'
        ELSE 'SMALL'
    END AS deal_size,

    Probability AS probability,
    CloseDate AS close_date,
    Type AS type,
    NextStep AS next_step,
    LeadSource AS lead_source,
    IsClosed AS is_closed,
    IsWon AS is_won,
    ForecastCategory AS forecast_category,
    OwnerId AS owner_id,
    CreatedDate AS created_date,
    LastModifiedDate AS last_modified_date

FROM STREAM(retail_sql_dev.salesforce_bronze.opportunity);