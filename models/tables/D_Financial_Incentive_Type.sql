with source as (
    
    select * from {{ ref('stg_Financial_Incentive_Type') }}

),

renamed as (

    select {{dbt_utils.hash(dbt_utils.concat(['Financial_Incentive_type']))}}  Financial_Incentive_Type_Id,
    Financial_Incentive_type,
    Financial_Incentive_type_desc
    from source

)

select * from renamed