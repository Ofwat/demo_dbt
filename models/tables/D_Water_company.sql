with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),
company_names as (
    select * from {{ ref('stg_Water_company_names') }}
),
company_type as (
    select * from {{ ref('stg_Water_company_type') }}
),

final as (

  select DISTINCT {{dbt_utils.hash(dbt_utils.concat(['pr14.Company','pr14.company_type']))}} as Water_company_id
  ,pr14.Company water_company_acronym
  ,company_names.water_company_name
  ,pr14.company_type water_company_type
  ,company_type.water_company_type_description 
  from pr14
  left join company_names on pr14.Company=company_names.water_company_acronym
  left join company_type on pr14.company_type=company_type.water_company_type

)

select * from final