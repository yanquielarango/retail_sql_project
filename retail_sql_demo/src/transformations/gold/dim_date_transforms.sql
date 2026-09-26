CREATE OR REFRESH PRIVATE MATERIALIZED VIEW dim_date_transformed
AS
WITH dates AS (
    SELECT EXPLODE(
        SEQUENCE(
            TO_DATE('${start_date}'),
            TO_DATE('${end_date}'),
            INTERVAL 1 DAY
        )
    ) AS full_date
)
SELECT
    CAST(DATE_FORMAT(full_date, 'yyyyMMdd') AS INT) AS date_key,
    full_date,
    YEAR(full_date) AS year,
    QUARTER(full_date) AS quarter,
    CONCAT('Q', CAST(QUARTER(full_date) AS STRING)) AS quarter_name,
    MONTH(full_date) AS month,
    DATE_FORMAT(full_date, 'MMMM') AS month_name,
    DATE_FORMAT(full_date, 'MMM yyyy') AS month_year,

    YEAR(full_date) * 100 + MONTH(full_date) AS month_year_sort,

    TRUNC(full_date, 'month') AS month_start,
    WEEKOFYEAR(full_date) AS week_of_year,
    DAYOFMONTH(full_date) AS day,
    DATE_FORMAT(full_date, 'EEEE') AS day_name,

    PMOD(DAYOFWEEK(full_date) - 2, 7) + 1 AS day_of_week_sort,

    DAYOFWEEK(full_date) IN (1, 7) AS is_weekend

FROM dates;