with pr14 as (
    select * from {{ ref('PR14FDOutcomeView') }}
),


final as (
    select unique_id
    ,'2014-15' year
    ,'Actual'  submission_status
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
    ,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued
    ,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
    ,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI
    ,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
    ,'N/A' pcl
    ,'N/A' pcl_met
    ,[2014-15 performance level - actual] performance_level_actual
    ,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    ,'N/A' financial_odi
    ,'N/A' underp_payment_collar
    ,'N/A' underp_payment_deadband
    ,'N/A' outp_payment_deadband
    ,'N/A' outp_payment_cap
    from pr14
)

select * from final
