with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}

),

final as (
SELECT  {{dbt_utils.hash(dbt_utils.concat(['PC_Name','Primary_Category','PC_unit','PC_unit_description','Decimal_places']))}} [PC_id],
PC_Name,
Primary_Category,PC_unit,PC_unit_description, Decimal_places
FROM (SELECT ltrim(right(Performance_commitment, len(Performance_commitment) - charindex(':',Performance_commitment))) PC_Name,Primary_Category,PC_unit,PC_unit_description, Decimal_places FROM PR14
group by ltrim(right(Performance_commitment, len(Performance_commitment) - charindex(':',Performance_commitment))),
Primary_Category,PC_unit,PC_unit_description, Decimal_places) p
)

select * from final

