with Fpcaprunion as (
    select * from {{ ref('stg_F_pc_apr_union') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pccompamp as (
    select * from {{ ref('D_PC_company_amp') }}
),
notionalincentive as (
    select * from {{ ref('D_Financial_incentive_type') }}
),
inpincentive as (
    select * from {{ ref('D_Financial_incentive_type') }}
),
element as (
    select * from {{ ref('D_Element') }}
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
    ,underp_payment_collar
    ,underp_payment_deadband
    ,outp_payment_deadband
    ,outp_payment_cap
    ,pcl 
    ,pcl_met
    ,performance_level_actual pcl_Actual
    ,notionalincentive.D_Financial_incentive_type_id notional_incentive_type_id
    ,notional_outperformance_payment_or_underperformance_payment_accrued_GBPm notional_incentive_payment_accrued_GBPm
    ,inpincentive.D_Financial_incentive_type_id In_Period_incentive_type
    ,outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm In_Period_payment_GBPm
    from Fpcaprunion 
        left join company  on Fpcaprunion.company=company.water_company_acronym
        left join pccompamp on Fpcaprunion.unique_id=pccompamp.unique_id
        left join element on Fpcaprunion.element_acronym=element.element_acronym
        left join submission on Fpcaprunion.submission_status=replace(submission.submission_status_description,'APR','')
        left join notionalincentive on Fpcaprunion.notional_outperformance_payment_or_underperformance_payment_accrued=notionalincentive.financial_incentive_type
        left join inpincentive on Fpcaprunion.outperformance_payment_or_underperformance_payment_in_period_ODI=inpincentive.financial_incentive_type
        where Fpcaprunion.company is not null
)

select * from renamed