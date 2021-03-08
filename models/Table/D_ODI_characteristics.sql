SELECT {{dbt_utils.hash(dbt_utils.concat(['odi_type','odi_form','odi_timing']))}} ODI_characteristics_id
,odi_type
,odi_form
,odi_timing
  FROM {{ ref('stg_ODI_characteristics') }}