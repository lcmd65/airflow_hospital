{{ config(
    schema='aio',
    materialized='table'
) }}

WITH base_data AS (
    SELECT 
        date,
        time_block,
        bed,
        total_patient_volume,
        (DATE_PART('day', date - DATE '2021-01-01') / 42)::INT AS cycle_id
    FROM {{ ref('preprocessed_data') }}
),
filtered_data AS (
    SELECT * 
    FROM base_data
    WHERE date >= (cycle_id * 42) + DATE '2021-01-01' + INTERVAL '14 days'
)
SELECT * FROM filtered_data;
