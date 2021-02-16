with Fpcaprunion as (
    select * from {{ ref('stg_F_pc_apr_union') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pccompamp as (
    select * from {{ ref('D_PC_company_amp') }}
),
odi_type as (
    select * from {{ ref('D_ODI_type') }}
),
oditypeimpodi as (
    select * from {{ ref('D_ODI_type') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
odiform as (
    select * from {{ ref('D_ODI_form') }}
),
submission as (
    select * from {{ ref('D_Submission_status') }}
),

renamed as (
    select year OFWAT_Year
    ,Fpcaprunion.submission_Status
    ,pccompamp.unique_id
    ,company.D_water_company_id
    ,pccompamp.D_pc_company_amp_id
    ,D_submission_status_id
    ,element.D_element_id
    ,odiform.D_odi_form_id
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
    ,oditypeimpodi.D_odi_type_id Payment_In_Period_ODI_Type_ID
    ,outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm Payment_In_Period_ODI_GBPm
    from Fpcaprunion 
        left join company  on Fpcaprunion.company=company.water_company_acronym
        left join pccompamp on Fpcaprunion.[Unique ID]=pccompamp.unique_id
        left join odi_type on Fpcaprunion.notional_outperformance_payment_or_underperformance_payment_accrued=odi_type.odi_type_description
        left join oditypeimpodi on Fpcaprunion.outperformance_payment_or_underperformance_payment_in_period_ODI=oditypeimpodi.odi_type_description
        left join element on Fpcaprunion.Element_price_control_acronym=element.element_acronym
        left join odiform on Fpcaprunion.[ODI form]=odiform.odi_form_name
        left join submission on Fpcaprunion.Submission_Status=replace(submission.submission_status_description,'APR','')
        where Fpcaprunion.company is not null

)

select * from renamed