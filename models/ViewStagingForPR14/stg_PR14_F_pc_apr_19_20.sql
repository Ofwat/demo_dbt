with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),


final as (
    select unique_id
    ,'2019-20' year
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
    ,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020] notional_outperformance_payment_or_underperformance_payment_accrued
    ,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020 (GBPm)] notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
    ,[2019-20 outperformance payment or underperformance payment in-period ODIs] outperformance_payment_or_underperformance_payment_in_period_ODI
    ,[2019-20 outperformance payment or underperformance payment in-period ODIs (GBPm)] outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
    ,[2019-20 pcl] pcl
    ,[2019-20 pcl met?] pcl_met
    ,[2019-20 performance level - actual] performance_level_actual
    ,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020 (GBPm)] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    ,[Financial_ODI_2019-20] financial_odi
    ,[UnderP_payment_collar_2019-20] underp_payment_collar
    ,[UnderP_payment_deadband_2016-17] underp_payment_deadband
    ,[OutP_payment_deadband_2019-20] outp_payment_deadband
    ,[OutP_payment_cap_2019-20] outp_payment_cap
    ,'N/A' enhanced_underp_payment_collar
    ,'N/A' standard_underp_payment_collar
    ,'N/A' standard_outp_payment_cap
    ,'N/A' enhanced_outp_payment_cap
    from pr14
)

select * from final
