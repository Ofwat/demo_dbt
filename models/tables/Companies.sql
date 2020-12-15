with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

element as (

    select * from {{ ref('Elements') }}

),

final as (
	
  SELECT DISTINCT PR14.[Company],PR14.[Company_type] ,element.[Element_id] element_id,
   {{dbt_utils.hash(dbt_utils.concat(['Company','PR14.Company_type']))}} as [Company_id],
   {{dbt_utils.hash(dbt_utils.concat(['Company','element_id']))}} as [Company_element_id]
  FROM PR14
  INNER JOIN [dw_niyati].[Elements] element ON PR14.[Element_name]=element.[Element_name]
)

select * from final