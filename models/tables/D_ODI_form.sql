with odi as (
    select * from {{ ref('stg_ODI_form') }}
),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_form_name','odi_form_name']))}} odi_form_id
    ,odi_form_name
    from odi

)

select * from renamed
