with PR14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV') }}
),
Company as (
    select * from {{ ref('D_Company') }}
),
PC as (
    select * from {{ ref('D_PC') }}
),
AMP as (
    select * from {{ ref('D_AMP_Year') }}
),

final as (
  SELECT  {{dbt_utils.hash(dbt_utils.concat(['Company','Performance_commitment']))}} [PC_Company_AMP_id],
  Company.Company_name
      ,PC.PC_Name
      ,PC.PC_id
      ,'PR14' AMP_name
  FROM PR14
   JOIN Company ON PR14.Company=Company.Company_name
   JOIN PC ON PR14.PC_ref=PC.PC_ref
    )

select * from final