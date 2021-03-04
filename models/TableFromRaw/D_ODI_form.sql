select  {{dbt_utils.hash(dbt_utils.concat(['odi_form_name','odi_form_name']))}} odi_form_id
    ,odi_form_name
    from {{ ref('raw_ODI_form') }}

