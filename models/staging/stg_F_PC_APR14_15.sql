SELECT [Unique ID]
,'2014-15' Year
,'Actual' Submission_Status
      ,[Company type] Company_type
      ,[Company] Company
      ,[Element (price control)] Element_price_control
      ,[Element (price control) acronym] Element_price_control_acronym
      ,[Outcome]
      ,[PC ref. (company)] PC_ref_company
      ,[PR14 Annex 4 order]
      ,[Performance commitment]
      ,[ODI type]
      ,[ODI form]
      ,[In-period ODI]
      ,[Standard ('vanilla') financial ODI] Standard_vanilla_financial_ODI
      ,[Primary Category]
      ,[PC unit]
      ,[PC unit description]
      ,[Decimal places]
      ,[Direction of improving performance]
,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued
,0 notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI
,0 outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
,0 PCL
,'NA' PCL_met
,[2014-15 performance level - actual] performance_level_actual
,0 Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
,0 Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
,0 Financial_ODI
,0 UnderP_payment_collar
,0 UnderP_payment_deadband
,NULL OutP_payment_deadband
,convert(char(20),'0') as OutP_payment_cap
from PR14_FD_outcome_New_CSV

