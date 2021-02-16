with source as (
select * from {{ ref('raw_Financial_incentive_type') }}
),

renamed as (
    select financial_incentive_type,financial_incentive_type_desc
    from source
)

select * from renamed