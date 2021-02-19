with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),

final as (

    select  {{dbt_utils.hash(dbt_utils.concat(['pc_name','primary_category','pc_unit','pc_unit_description','decimal_places']))}} Performance_commitment_id
    ,pc_name
    ,primary_category primary_category
    ,pc_unit pc_unit
    ,pc_unit_description pc_unit_description
    ,decimal_places decimal_places
    from (select ltrim(right(performance_commitment, len(performance_commitment) - charindex(':',performance_commitment))) pc_name
        ,primary_category
        ,pc_unit
        ,pc_unit_description
        ,decimal_places from pr14
        group by ltrim(right(performance_commitment, len(performance_commitment) - charindex(':',performance_commitment)))
            ,primary_category
            ,pc_unit
            ,pc_unit_description
            ,decimal_places
        )p
)

select * from final

