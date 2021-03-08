with Fpcaprunion as (
    select * from {{ ref('stg_F_pc_apr_union') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pccompamp as (
    select * from {{ ref('stg_PC_company_amp_union') }}
),
financialincentive as (
    select * from {{ ref('stg_PR14_Financial_incentive_type') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
submission as (
    select * from {{ ref('D_Submission_status') }}
),
odi_characteristics as (
    select * from {{ ref('D_ODI_characteristics') }}
),
renamed as (
    select year OFWAT_Year
    ,Fpcaprunion.submission_status
    ,pccompamp.unique_id
    ,company.water_company_id
    ,pccompamp.pc_company_amp_id
    ,Submission_status_id
    ,element.element_id
    ,odi_characteristics.ODI_characteristics_id
    ,underp_payment_collar
    ,underp_payment_deadband
    ,outp_payment_deadband
    ,outp_payment_cap
    ,pcl 
    ,pcl_met
    ,performance_level_actual pcl_Actual
    ,isnumeric(performance_level_actual) numeric_pcl_actual
    ,case when isnumeric(performance_level_actual) =1 then performance_level_actual 
    else null end numeric_derived_pcl_actual
    ,financialincentive.financial_incentive_id
    ,coalesce([notional_outperformance_payment_or_underperformance_payment_accrued_GBPm],
    [outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm]) financial_incentive_payment_GBPm
    ,Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    from Fpcaprunion 
        left join company  on Fpcaprunion.company=company.water_company_acronym
        left join pccompamp on Fpcaprunion.unique_id=pccompamp.unique_id
        left join element on Fpcaprunion.element_acronym=element.element_acronym
        left join submission on Fpcaprunion.submission_status=submission.submission_status_name
        left join financialincentive on (coalesce([notional_outperformance_payment_or_underperformance_payment_accrued],
                [outperformance_payment_or_underperformance_payment_in_period_ODI])) = financialincentive.financial_incentive_type
                and 
                (case when [notional_outperformance_payment_or_underperformance_payment_accrued] is not null then 'Notional Period'
                when [outperformance_payment_or_underperformance_payment_in_period_ODI] is not null then 'IN Period ODI'
                else null end) = financialincentive.Incentive_Period
        left join odi_characteristics on Fpcaprunion.odi_form = odi_characteristics.odi_form
        and Fpcaprunion.odi_type = odi_characteristics.odi_type
        and Fpcaprunion.odi_timing = odi_characteristics.odi_timing
        where Fpcaprunion.company is not null
)

select * from renamed

