with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}

),
company_names as (
    select * from {{ ref('stg_Water_company_names') }}
),
company_type as (
    select * from {{ ref('stg_Water_company_type') }}
),


final as (
	
  SELECT DISTINCT PR14.[Company] Company_acronym,company_names.Company_name,PR14.[Company_type],company_type.Company_type_name,
   {{dbt_utils.hash(dbt_utils.concat(['PR14.Company','PR14.Company_type']))}} as [Water_Company_id]
  FROM PR14
  left join company_names on
 PR14.[Company]=company_names.[Company_acronym]
 left join company_type on
 PR14.[Company_type]=company_type.[Company_type]
)

select * from final