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
,'N/A' notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI
,'N/A' outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
,'N/A' PCL
,'NA' PCL_met
,[2014-15 performance level - actual] performance_level_actual
,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
,'N/A' Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
,'N/A' Financial_ODI
,'N/A' UnderP_payment_collar
,'N/A' UnderP_payment_deadband
,'N/A' OutP_payment_deadband
,convert(char(20),'0') as OutP_payment_cap
from PR14_FD_outcome_New_CSV

