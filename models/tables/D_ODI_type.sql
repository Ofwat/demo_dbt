with odi as ( 
    select * from {{ ref('stg_ODI_type') }}
),

renamed as (

    select  {{dbt_utils.hash(dbt_utils.concat(['odi_type_name','odi_type_description']))}} [D_odi_type_id]
    ,odi_type_name
    ,odi_type_description
    from odi

)

select * from renamed
