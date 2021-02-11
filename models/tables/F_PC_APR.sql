with F_PC_APR_UNION as (
    
    select * from {{ ref('stg_F_PC_APR_UNION') }}

),
Company as (
    select * from {{ ref('D_Water_Company') }}
),
DPC as (
    select * from {{ ref('D_PC_Company_AMP') }}
),
Odi_Type as (
    select * from {{ ref('D_ODI_type') }}
),
ODI_Type_INP_ODI as (
    select * from {{ ref('D_ODI_type') }}
),
e as (
    select * from {{ ref('D_Element') }}
),
form as (
    select * from {{ ref('D_ODI_form') }}
),
Submission as (
    select * from {{ ref('D_Submission_status') }}
),
renamed as (

select 
Year OFWAT_Year
,F_PC_APR_UNION.[Submission_Status]
,DPC.Unique_ID
,Company.[Water_Company_ID] 
,DPC.[PC_Company_AMP_id]
,Submission_Status_ID,
e.element_ID,
form.ODI_Form_ID
,[UnderP_payment_collar]
,[UnderP_payment_deadband]
,[OutP_payment_deadband]
,[OutP_payment_cap]
,PCL 
,PCL_met 
,performance_level_actual PCL_Actual
,ODI_Type.ODI_Type_id Notional_ODI_Type_ID,
notional_outperformance_payment_or_underperformance_payment_accrued_GBPm Notional_ODI_Payment_Accrued_GBPm
,ODI_Type_INP_ODI.ODI_Type_id Payment_In_Period_ODI_Type_ID
,[outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm] Payment_In_Period_ODI_GBPm

FROM [F_PC_APR_UNION] 
  left join Company  on F_PC_APR_UNION.Company=Company.water_company_acronym

left join DPC on F_PC_APR_UNION.[Unique ID]=DPC.Unique_ID

left join ODI_Type on F_PC_APR_UNION.[notional_outperformance_payment_or_underperformance_payment_accrued]=ODI_Type.ODI_Type_Description
left join ODI_Type_INP_ODI on F_PC_APR_UNION.[outperformance_payment_or_underperformance_payment_in_period_ODI]=ODI_Type_INP_ODI.ODI_Type_Description
left join e on F_PC_APR_UNION.[Element_price_control_acronym]=e.Element_acronym

left join  form on F_PC_APR_UNION.[ODI form]=form.[odi_form_name]
left join  Submission on F_PC_APR_UNION.[Submission_Status]=replace(Submission.submission_status_description,'APR','')
where F_PC_APR_UNION.Company is not null
)

select * from renamed