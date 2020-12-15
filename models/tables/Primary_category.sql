with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

final as (
SELECT  {{dbt_utils.hash(dbt_utils.concat(['Performance_commitment','Primary_Category']))}} [PC_id],
PC_ref,Annex,Performance_commitment,Primary_Category,PC_unit,PC_unit_description, Decimal_places
FROM (SELECT PC_ref,Annex,Performance_commitment,Primary_Category,PC_unit,PC_unit_description, Decimal_places FROM PR14) p
)

select * from final

