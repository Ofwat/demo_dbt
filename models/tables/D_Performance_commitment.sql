with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),

final as (

    SELECT  {{dbt_utils.hash(dbt_utils.concat(['PC_Name','primary_category','pc_unit','pc_unit_description','decimal_places']))}} D_performance_commitment_id,
    PC_Name pc_name,
    primary_category primary_category,pc_unit pc_unit
    ,pc_unit_description pc_unit_description, decimal_places decimal_places
    FROM (SELECT ltrim(right(performance_commitment, len(performance_commitment) - charindex(':',performance_commitment))) PC_Name,primary_category,pc_unit,pc_unit_description, decimal_places FROM pr14
    group by ltrim(right(performance_commitment, len(performance_commitment) - charindex(':',performance_commitment))),
    primary_category,pc_unit,pc_unit_description, decimal_places) p

)

select * from final

