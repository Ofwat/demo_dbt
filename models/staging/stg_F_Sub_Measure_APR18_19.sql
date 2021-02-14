SELECT [Unique_ID]
   	  ,'2018-19' Year
      ,[Company_type]
      ,[Company]
      ,[Element_acronym]
      ,[PC_ref]
      ,[Performance_commitment]
      ,[ODI_type]
      ,[Primary_Category]
      ,[PC_unit_description]
      ,[2014-15 starting level (PR14 FD)]
      ,[2018-19 PCL] PCL
      ,[sub_measure_ID]
      ,[sub_measure]
      ,[sub_measure_category]
      ,[Sub_measure_weighting]
      ,[Unit]
      ,[Decimal_places]
      ,[Reference_Regulatory output during 2010-15  ]
      ,[Reference_Expected performance by 2014-15  ]
      ,[Reference_2018-19] Reference
      ,[High_Regulatory output during 2010-15  ]
      ,[High_Expected performance by 2014-15  ]
      ,[High_2018-19] High
      ,[Low_Regulatory output during 2010-15  ]
      ,[Low_Expected performance by 2014-15  ]
      ,[Low_2018-19] Low
      ,[Failure threshold for AMP6]
      ,[2018-19 performance level - actual] performance_level_actual
      ,[2018-19 performance level met?] performance_level_met
      ,[Estimate_2019-20 performance level ]
      ,[Estimate_2019-20 performance level met?]
      ,[Blank]
      ,[Company Name - Sub measure]
      ,[Direction of improving performance]
      ,[Comms filter]
      ,[2014-15 to 2015-16]
      ,[2015-16 to 2016-17]
      ,[2016-17 to 2017-18]
      ,[2017-18 to 2018-19]
      ,[2018-19 to 2019-20]
      ,[2014-15 to 2016-17 (AMP so far)]
  FROM [Sub_measures_2019_CSV_View]
  WHERE Unique_ID IS NOT NULL
  