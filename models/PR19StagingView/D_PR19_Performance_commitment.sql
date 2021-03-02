with pr19 as (
    select * from {{ ref('PR19FDOutcomeView') }}
),

final as (

    select  {{dbt_utils.hash(dbt_utils.concat(['pc_name','primary_category','pc_unit','pc_unit_description','decimal_places']))}} performance_commitment_id
    ,pc_name
    ,primary_category primary_category
    ,pc_unit pc_unit
    ,pc_unit_description pc_unit_description
    ,decimal_places decimal_places
    from (select pc_name
        ,primary_category
        ,pc_unit
        ,pc_unit_description
        ,decimal_places from pr19
        group by pc_name
            ,primary_category
            ,pc_unit
            ,pc_unit_description
            ,decimal_places
        )p
)

select * from final

