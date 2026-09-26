CREATE OR REFRESH PRIVATE STREAMING TABLE  account_transformed
AS
SELECT
    TRIM(Id) AS id,
    IsDeleted AS is_deleted,
    TRIM(Name) AS customer_name,
    TRIM(Type) AS type,
    ParentId AS parent_id,

    TRIM(BillingStreet) AS billing_street,
    TRIM(BillingCity) AS billing_city,
    TRIM(BillingState) AS billing_state,
    TRIM(BillingPostalCode) AS billing_postal_code,
    TRIM(BillingCountry) AS billing_country,

    TRIM(ShippingStreet) AS shipping_street,
    TRIM(ShippingCity) AS shipping_city,
    TRIM(ShippingState) AS shipping_state,
    TRIM(ShippingPostalCode) AS shipping_postal_code,
    TRIM(ShippingCountry) AS shipping_country,

    TRIM(Phone) AS phone,
    TRIM(Website) AS website,

    COALESCE(
        TRIM(Industry),
        'Unknown'
    ) AS industry,

    AnnualRevenue AS annual_revenue,
    NumberOfEmployees AS number_of_employees,

    TRIM(Description) AS description,

    `__START_AT` AS start_at,
    `__END_AT` AS end_at,

    CASE
        WHEN `__END_AT` IS NULL THEN TRUE
        ELSE FALSE
    END AS is_active,

    CURRENT_TIMESTAMP() AS processed_at

FROM STREAM(retail_sql_dev.salesforce_bronze.account);