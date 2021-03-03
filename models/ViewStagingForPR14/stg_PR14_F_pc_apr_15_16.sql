with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),


final as (
    select unique_id
    ,'2015-16' year
    ,'Actual' submission_status
    ,company_type
    ,company
    ,element_name
    ,element_acronym
    ,outcome
    ,pc_ref
    ,annex
    ,performance_commitment
    ,odi_type
    ,odi_form
    ,in_period_odi
    ,vanilla_odi
    ,primary_category
    ,pc_unit
    ,pc_unit_description
    ,decimal_places
    ,direction_of_improving_performance 
    ,[2015-16 notional outperformance payment or underperformance payment accrued at 31 March 2016] notional_outperformance_payment_or_underperformance_payment_accrued
    ,[2015-16 notional outperformance payment or underperformance payment accrued at 31 March 2016 (GBPm)] notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
    ,[2015-16 outperformance payment or underperformance payment in-period ODIs] outperformance_payment_or_underperformance_payment_in_period_ODI
    ,[2015-16 outperformance payment or underperformance payment in-period ODIs (GBPm)] outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
    ,[2015-16 pcl] pcl
    ,[2015-16 pcl met?] pcl_met
    ,[2015-16 performance level - actual] performance_level_actual
    ,[2015-16 Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,[2015-16 Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast (GBPm)] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    ,[Financial_ODI_2015-16] financial_odi
    ,[UnderP_payment_collar_2015-16] underp_payment_collar
    ,[UnderP_payment_deadband_2015-16] underp_payment_deadband
    ,[OutP_payment_deadband_2015-16] outp_payment_deadband
    ,[OutP_payment_cap_2015-16] outp_payment_cap
    ,'N/A' enhanced_underp_payment_collar
    ,'N/A' standard_underp_payment_collar
    ,'N/A' standard_outp_payment_cap
    ,'N/A' enhanced_outp_payment_cap
    from pr14
)

select * from final
