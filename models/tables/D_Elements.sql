with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}

),


final as (
	
SELECT  {{dbt_utils.hash(dbt_utils.concat(['Element_acronym','Element_name']))}} [Element_id],[Element_name],[Element_acronym]
FROM (SELECT DISTINCT Element_name, Element_acronym FROM PR14) m

)

select * from final