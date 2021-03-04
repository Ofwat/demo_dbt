select unique_id
    ,'2023-24' year
    ,'Not sure' submission_status
    ,'N/A' company_type
    ,company
    ,'N/A' element_name
    ,'N/A' element_acronym
    ,outcome
    ,pc_ref
    ,'N/A' annex
    ,pc_name performance_commitment
    ,odi_type
    ,odi_form
    ,'N/A' in_period_odi
    ,'N/A' vanilla_odi
    ,primary_category
    ,pc_unit
    ,pc_unit_description
    ,decimal_places
    ,direction_of_improving_performance
    ,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued
    ,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
    ,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI
    ,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
    ,[2020-25 performance commitment levels 2023-24] pcl
    ,'N/A' pcl_met
    ,'N/A' performance_level_actual
    ,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
    ,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
    ,[Financial ODI may accrue or apply 2023-24] financial_odi
    ,'N/A' underp_payment_collar
    ,'N/A' underp_payment_deadband
    ,'N/A' outp_payment_deadband
    ,'N/A' outp_payment_cap
    ,[Enhanced underperformance payment collar 2023-24] enhanced_underp_payment_collar
    ,[Standard underperformance payment collar 2023-24] standard_underp_payment_collar
    ,[Standard outperformance payment cap 2023-24] standard_outp_payment_cap
    ,[Enhanced outperformance payment cap 2023-24] enhanced_outp_payment_cap
     from {{ ref('PR19FDOutcomeView') }}
