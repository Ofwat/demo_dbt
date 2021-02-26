with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),


final as (
    select unique_id
    ,'2017-18' year
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
    ,[2017-18 notional outperformance payment or underperformance payment accrued at 31 March 2018] notional_outperformance_payment_or_underperformance_payment_accrued
    ,[2017-18 notional outperformance payment or underperformance payment accrued at 31 March 2018 (GBPm)] notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
    ,[2017-18 outperformance payment or underperformance payment in-period ODIs] outperformance_payment_or_underperformance_payment_in_period_ODI
    ,[2017-18 outperformance payment or underperformance payment in-period ODIs (GBPm)] outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
    ,[2017-18 pcl] pcl
    ,[2017-18 pcl met?] pcl_met
    ,[2017-18 performance level - actual] performance_level_actual
    ,[2017-18 Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,[2017-18Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast (GBPm)] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    ,[Financial_ODI_2017-18] financial_odi
    ,[OutP_payment_deadband_2017-18] outp_payment_deadband
    ,[UnderP_payment_deadband_2016-17] underp_payment_deadband
    ,[OutP_payment_cap_2017-18] outp_payment_cap
    ,[UnderP_payment_collar_2017-18] underp_payment_collar
    from pr14
)

select * from final
