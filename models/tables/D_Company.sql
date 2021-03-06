with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}

),


final as (
	
  SELECT DISTINCT PR14.[Company] Company_name,PR14.[Company_type],
   {{dbt_utils.hash(dbt_utils.concat(['PR14.Company','PR14.Company_type']))}} as [Company_id]
  FROM PR14
)

select * from final