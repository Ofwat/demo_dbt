with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

final as (
	
  SELECT DISTINCT PR14.Company,PR14.Company_type,PR14.Element_name,PR14.Element_acronym,
   {{dbt_utils.hash(dbt_utils.concat(['PR14.Company','Element_name']))}} as [Company_Element_id]
  FROM PR14
)

select * from final