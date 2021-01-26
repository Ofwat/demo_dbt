with PR14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),
ODI_type as (
    select * from {{ ref('D_ODI_type') }}
),
D_ODI_form as (
    select * from {{ ref('D_ODI_form') }}
),
PCCompanyAMP as (
    select * from {{ ref('D_PC_Company_AMP') }}
),

final as (
 select {{dbt_utils.hash(dbt_utils.concat(['PR14.Unique_ID','ODI_type.ODI_id','D_ODI_form.ODI_form_id']))}} [PC_ODI_id]
	  , PR14.Unique_ID
      , Performance_commitment
      , Primary_Category
      , PR14.ODI_type
      , ODI_type.ODI_id
      , PR14.ODI_form
      , D_ODI_form.ODI_form_id
      , In_period_ODI
      , Vanilla_ODI
  FROM PR14 
left join PCCompanyAMP on
 PR14.[Unique_ID]=PCCompanyAMP.[Unique_ID]
left join ODI_type on
 PR14.[ODI_type]=ODI_type.[ODI_name]
left join D_ODI_form on
 PR14.[ODI_form]=D_ODI_form.[odi_form_name]
)

select * from final