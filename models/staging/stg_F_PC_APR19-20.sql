SELECT [Unique ID]
,'2019-20' Year
      ,[Company type]
      ,[Company]
      ,[Element (price control)]
      ,[Element (price control) acronym]
      ,[Outcome]
      ,[PC ref. (company)]
      ,[PR14 Annex 4 order]
      ,[Performance commitment]
      ,[ODI type]
      ,[ODI form]
      ,[In-period ODI]
      ,[Standard ('vanilla') financial ODI]
      ,[Primary Category]
      ,[PC unit]
      ,[PC unit description]
      ,[Decimal places]
      ,[Direction of improving performance]
	  ,[UnderP_payment_deadband_2016-17] UnderP_payment_deadband
,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020] notional_outperformance_payment_or_underperformance_payment_accrued
,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020 (GBPm)] notional_outperformance_payment_or_underperformance_payment_accrued_GBPm
,[2019-20 outperformance payment or underperformance payment in-period ODIs] outperformance_payment_or_underperformance_payment_in_period_ODI
,[2019-20 outperformance payment or underperformance payment in-period ODIs (GBPm)] outperformance_payment_or_underperformance_payment_in_period_ODI_GBPm
,[2019-20 PCL] PCL
,[2019-20 PCL met?] PCL_met
,[2019-20 performance level - actual] performance_level_actual
,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast
,[2019-20 notional outperformance payment or underperformance payment accrued at 31 March 2020 (GBPm)] Total_AMP6_outperformance_payment_or_underperformance_payment_forecast_GBPm
,[Financial_ODI_2019-20] Financial_ODI
,[OutP_payment_deadband_2019-20] OutP_payment_deadband
,[OutP_payment_cap_2019-20] OutP_payment_cap
,[UnderP_payment_collar_2019-20] UnderP_payment_collar
	  from dw_niyati.PR14_FD_outcome_New_CSV
	