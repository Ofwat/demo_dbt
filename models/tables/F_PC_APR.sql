with F_PC_APR_UNION as (
    select * from {{ ref('stg_F_PC_APR_UNION') }}
),
Company as (
    select * from {{ ref('D_Water_company') }}
),
PCCompAMP as (
    select * from {{ ref('D_PC_company_amp') }}
),
odi_type as (
    select * from {{ ref('D_ODI_type') }}
),
ODI_Type_INP_ODI as (
    select * from {{ ref('D_ODI_type') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
Odiform as (
    select * from {{ ref('D_ODI_form') }}
),
submission as (
    select * from {{ ref('D_Submission_status') }}
),

renamed as (
    select Year OFWAT_Year
    ,F_PC_APR_UNION.Submission_Status
    ,PCCompAMP.unique_id
    ,Company.D_water_company_id
    ,PCCompAMP.D_pc_company_amp_id
    ,D_submission_status_id
    ,element.D_element_id
    ,Odiform.D_odi_form_id
    ,UnderP_payment_collar
    ,UnderP_payment_deadband
    ,OutP_payment_deadband
    ,OutP_payment_cap
    ,PCL 
    ,PCL_met
    ,odi_type.D_odi_type_id
    ,performance_level_actual PCL_Actual
    ,odi_type.D_odi_type_id Notional_ODI_Type_ID
    ,notional_outperformance_payment_or_underperformance_payment_accrued_GBPm Notional_ODI_Payment_Accrued_GBPm
    ,ODI_Type_INP_ODI.D_odi_type_id Payment_In_Period_ODI_Type_ID
    ,outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm Payment_In_Period_ODI_GBPm
    FROM F_PC_APR_UNION 
    left join Company  on F_PC_APR_UNION.Company=Company.water_company_acronym
    left join PCCompAMP on F_PC_APR_UNION.[Unique ID]=PCCompAMP.unique_id
    left join odi_type on F_PC_APR_UNION.notional_outperformance_payment_or_underperformance_payment_accrued=odi_type.odi_type_description
    left join ODI_Type_INP_ODI on F_PC_APR_UNION.outperformance_payment_or_underperformance_payment_in_period_ODI=ODI_Type_INP_ODI.odi_type_description
    left join element on F_PC_APR_UNION.Element_price_control_acronym=element.element_acronym
    left join Odiform on F_PC_APR_UNION.[ODI form]=Odiform.odi_form_name
    left join submission on F_PC_APR_UNION.Submission_Status=replace(submission.submission_status_description,'APR','')
    where F_PC_APR_UNION.Company is not null

)

select * from renamed