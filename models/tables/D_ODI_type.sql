with source as (
    
    select * from {{ ref('stg_ODI_type') }}

),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_name','odi_description']))}} [ODI_Type_id]
,ODI_name ODI_Type_Name,ODI_description ODI_Type_Description

    from source

)

select * from renamed
