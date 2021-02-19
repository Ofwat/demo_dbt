with source as (

    select * from {{ ref('stg_Financial_incentive_type') }}

),

renamed as (

    select {{dbt_utils.hash(dbt_utils.concat(['financial_incentive_type']))}} Financial_incentive_type_id
    ,financial_incentive_type
    ,financial_incentive_type_desc
    from source

)

select * from renamed 