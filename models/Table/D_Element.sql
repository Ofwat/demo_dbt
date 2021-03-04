    select  {{dbt_utils.hash(dbt_utils.concat(['element_acronym','element_name']))}} element_id
    ,element_name
    ,element_acronym
    from (select distinct element_name, element_acronym from {{ ref('PR14FDOutcomeView') }}) e
