with Company_Element as (

    select * from {{ ref('D_Company_Element') }}

),

final as (
	
SELECT  {{dbt_utils.hash(dbt_utils.concat(['Element_acronym','Element_name']))}} [Element_id],[Element_name],[Element_acronym]
FROM (SELECT DISTINCT Element_name, Element_acronym FROM Company_Element) m

)

select * from final


