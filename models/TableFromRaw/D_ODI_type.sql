select  {{dbt_utils.hash(dbt_utils.concat(['odi_type_name','odi_type_description']))}} odi_type_id
    ,odi_type_name
    ,odi_type_description
    from {{ ref('raw_ODI_type') }}

