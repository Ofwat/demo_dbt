with source as (
    
    select * from {{ ref('stg_ODI') }}

),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_name','odi_description']))}} [ODI_id]
,ODI_name,ODI_description

    from source

)

select * from renamed
