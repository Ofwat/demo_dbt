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
/*added company and element because more than 1 records of pc and odi 
where getting pulled when they were not considered*/
Company as (
    select * from {{ ref('D_Company') }}
),
element as (
    select * from {{ ref('D_Elements') }}
),

final as (
 select {{dbt_utils.hash(dbt_utils.concat(['Performance_commitment','Primary_Category','ODI_type.ODI_id','D_ODI_form.ODI_form_id','Company','element.Element_acronym']))}} [PC_ODI_id]
	  , PR14.[Unique_ID]
      , element.Element_acronym
      , Company
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
left join Company on
 PR14.[Company]=Company.[Company_name]
left join element on
 PR14.[Element_acronym]=element.Element_acronym
)

select * from final