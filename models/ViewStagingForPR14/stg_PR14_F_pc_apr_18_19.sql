select unique_id
	,'2018-19' year
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
	,[2018-19 notional outperformance payment or underperformance payment accrued at 31 March 2019] notional_outperformance_payment_or_underperformance_payment_accrued
	,[2018-19 notional outperformance payment or underperformance payment accrued at 31 March 2019 (GBPm)] notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
	,[2018-19 outperformance payment or underperformance payment in-period ODIs] outperformance_payment_or_underperformance_payment_in_period_ODI
	,[2018-19 outperformance payment or underperformance payment in-period ODIs (GBPm)] outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
	,[2018-19 pcl] pcl
	,[2018-19 pcl met?] pcl_met
	,[2018-19 performance level - actual] performance_level_actual
	,[2018-19 Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
	,[2018-19 Total AMP6 outperformance payment or underperformance payment 31 March 2020 forecast (GBPm)] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
	,[Financial_ODI_2018-19] financial_odi
	,[OutP_payment_deadband_2018-19] outp_payment_deadband
	,[UnderP_payment_deadband_2016-17] underp_payment_deadband
	,[OutP_payment_cap_2018-19] outp_payment_cap
	,[UnderP_payment_collar_2018-19] underp_payment_collar
    ,'N/A' enhanced_underp_payment_collar
    ,'N/A' standard_underp_payment_collar
    ,'N/A' standard_outp_payment_cap
    ,'N/A' enhanced_outp_payment_cap
    from {{ ref('PR14FDOutcomeView') }}
