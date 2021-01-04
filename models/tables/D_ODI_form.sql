with source as (
    
    select * from {{ ref('stg_ODI_form') }}

),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_form','odi_form']))}} [ODI_form_id]
,ODI_form

    from source

)

select * from renamed
