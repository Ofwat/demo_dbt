select [Unique ID] as unique_id
      ,[Company type] as company_type
      ,[Company] as company
      ,[Element acronym] as element_acronym
      ,[PC ref. (company)] as pc_ref
      ,[Performance commitment] as performance_commitment
      ,[PC ODI type] as odi_type
      ,[PC primary category] as primary_category
      ,[PC unit description] as pc_unit_description
      ,[2014-15 starting level (PR14 FD)]
      ,[2015-16 pcl]
      ,[2016-17 pcl]
      ,[2017-18 pcl]
      ,[2018-19 pcl]
      ,[2019-20 pcl]
      ,[PC / sub-measure ID ] as sub_measure_ID 
      ,[PC / sub-measure] as sub_measure
      ,[Sub-measure category] as sub_measure_category
      ,[Sub-measure weighting] as sub_measure_weighting
      ,[Unit] as unit
      ,[Decimal places] as decimal_places
      ,[Reference_Regulatory output during 2010-15  ] as reference_regulatory_output_during_2010_15
      ,[Reference_Expected performance by 2014-15  ] as reference_expected_performance_by_2014_15
      ,[Reference_2015-16]
      ,[Reference_2016-17]
      ,[Reference_2017-18]
      ,[Reference_2018-19]
      ,[Reference_2019-20]
      ,[High_Regulatory output during 2010-15  ] as high_regulatory_output_during_2010_15
      ,[High_Expected performance by 2014-15  ] as high_expected_performance_by_2014_15
      ,[High_2015-16]
      ,[High_2016-17]
      ,[High_2017-18]
      ,[High_2018-19]
      ,[High_2019-20]
      ,[Low_Regulatory output during 2010-15  ] as low_regulatory_output_during_2010_15
      ,[Low_Expected performance by 2014-15  ] as low_expected_performance_by_2014_15
      ,[Low_2015-16]
      ,[Low_2016-17]
      ,[Low_2017-18]
      ,[Low_2018-19]
      ,[Low_2019-20]
      ,[Failure threshold for AMP6] as failure_threshold_for_AMP6
      ,[2014-15 performance level - actual] 
      ,[2015-16 performance level - actual]
      ,[2015-16 performance level met?]
      ,[2016-17 performance level - actual]
      ,[2016-17 performance level met?]
      ,[2017-18 performance level - actual]
      ,[2017-18 performance level met?]
      ,[2018-19 performance level - actual]
      ,[2018-19 performance level met?]
      ,[2019-20 performance level - actual]
      ,[2019-20 performance level met?]
      ,[Estimate_2019-20 performance level ]
      ,[Estimate_2019-20 performance level met?]
      ,[Blank]
      ,[Company Name - Sub measure]
      ,[Direction of improving performance] as direction_of_improving_performance
      ,[Comms filter]
      ,[2014-15 to 2015-16]
      ,[2015-16 to 2016-17]
      ,[2016-17 to 2017-18]
      ,[2017-18 to 2018-19]
      ,[2018-19 to 2019-20]
      ,[2014-15 to 2016-17 (AMP so far)]
  from dw_staging.[PR14SubMeasures]
  