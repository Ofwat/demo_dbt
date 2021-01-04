with source as (
    
    select * from {{ ref('stg_ODI_form') }}

),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_form_name','odi_form_name']))}} [ODI_form_id]
,odi_form_name

    from source

)

select * from renamed
