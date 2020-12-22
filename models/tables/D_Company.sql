with Company_Element as (

    select * from {{ ref('D_Company_Element') }}

),

final as (
	
  SELECT DISTINCT Company_Element.[Company] Company_name,Company_Element.[Company_type],
   {{dbt_utils.hash(dbt_utils.concat(['Company_Element.Company','Company_Element.Company_type']))}} as [Company_id]
  FROM Company_Element
)

select * from final