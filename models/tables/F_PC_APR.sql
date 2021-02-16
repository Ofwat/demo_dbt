with F_PC_APR_UNION as (
    
    select * from {{ ref('stg_F_PC_APR_UNION') }}

),
Company as (
    select * from {{ ref('D_Water_Company') }}
),
DPC as (
    select * from {{ ref('D_PC_Company_AMP') }}
),
NOTIONAL_Incentive as (
    select * from {{ ref('D_Financial_Incentive_Type') }}
),
INP_Incentive as (
    select * from {{ ref('D_Financial_Incentive_Type') }}
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
e.element_ID
,[UnderP_payment_collar]
,[UnderP_payment_deadband]
,[OutP_payment_deadband]
,[OutP_payment_cap]
,PCL 
,PCL_met 
,performance_level_actual PCL_Actual
,NOTIONAL_Incentive.Financial_Incentive_Type_Id Notional_Incentive_Type_ID,
notional_outperformance_payment_or_underperformance_payment_accrued_GBPm Notional_Incentive_Payment_Accrued_GBPm
,INP_Incentive.Financial_Incentive_Type_Id Payment_In_Period_ODI_Type_ID
,[outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm] Payment_In_Period_ODI_GBPm

FROM [F_PC_APR_UNION] 
  left join Company  on F_PC_APR_UNION.Company=Company.water_company_acronym

left join DPC on F_PC_APR_UNION.[Unique ID]=DPC.Unique_ID

left join NOTIONAL_Incentive on F_PC_APR_UNION.[notional_outperformance_payment_or_underperformance_payment_accrued]=NOTIONAL_Incentive.Financial_Incentive_type
left join INP_Incentive on F_PC_APR_UNION.[outperformance_payment_or_underperformance_payment_in_period_ODI]=INP_Incentive.Financial_Incentive_type
left join e on F_PC_APR_UNION.[Element_price_control_acronym]=e.Element_acronym

left join  Submission on F_PC_APR_UNION.[Submission_Status]=replace(Submission.submission_status_description,'APR','')
where F_PC_APR_UNION.Company is not null
)

select * from renamed