with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),


final as (
	
    SELECT  {{dbt_utils.hash(dbt_utils.concat(['element_acronym','element_name']))}} [D_element_id],[element_name],[element_acronym]
    FROM (SELECT DISTINCT element_name, element_acronym FROM pr14) m

)

select * from final