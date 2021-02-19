with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),


final as (
	
    select  {{dbt_utils.hash(dbt_utils.concat(['element_acronym','element_name']))}} Element_id
    ,element_name
    ,element_acronym
    from (select distinct element_name, element_acronym from pr14) e
)

select * from final