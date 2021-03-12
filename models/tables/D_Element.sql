with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),


final as (
	
    select  {{dbt_utils.hash(dbt_utils.concat(['element_acronym','element_name']))}} element_id
    ,element_name
    ,element_acronym
    from (select distinct element_name, element_acronym from pr14) e
)

select * from final