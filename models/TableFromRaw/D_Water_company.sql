with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),
company_names as (
    select * from {{ ref('raw_Water_company_names') }}
),
company_type as (
    select * from {{ ref('raw_Water_company_type') }}
),

final as (

  select DISTINCT {{dbt_utils.hash(dbt_utils.concat(['pr14.Company','pr14.company_type']))}} as water_company_id
  ,company_names.water_company_acronym
  ,company_names.water_company_name
  ,company_type.water_company_type
  ,company_type.water_company_type_description 
  from pr14
  left join company_names on pr14.Company=company_names.water_company_acronym
  left join company_type on pr14.company_type=company_type.water_company_type

)

select * from final