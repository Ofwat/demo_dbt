with pr14submeasure as (
    select * from {{ ref('PR14SubMeasuresView') }}
),


final as (
      select unique_id
   	  ,'2015-16' year
	  ,'Actual' submission_status
      ,company_type
      ,company
      ,element_acronym
      ,pc_ref
      ,performance_commitment
      ,odi_type
      ,primary_category
      ,pc_unit_description
      ,[2014-15 starting level (PR14 FD)]
      ,[2015-16 PCL] pcl
      ,sub_measure_ID
      ,sub_measure
      ,sub_measure_category
      ,sub_measure_weighting
      ,unit
      ,decimal_places
      ,reference_regulatory_output_during_2010_15
      ,reference_expected_performance_by_2014_15
      ,[Reference_2015-16] reference
      ,high_regulatory_output_during_2010_15
      ,high_expected_performance_by_2014_15
      ,[High_2015-16] high
      ,low_regulatory_output_during_2010_15
      ,low_expected_performance_by_2014_15
      ,[Low_2015-16] low
      ,failure_threshold_for_AMP6
      ,[2015-16 performance level - actual] performance_level_actual
      ,[2015-16 performance level met?] performance_level_met
      ,[Estimate_2019-20 performance level ]
      ,[Estimate_2019-20 performance level met?]
      ,[Blank]
      ,[Company Name - Sub measure]
      ,direction_of_improving_performance
      ,[Comms filter]
      ,[2014-15 to 2015-16]
      ,[2015-16 to 2016-17]
      ,[2016-17 to 2017-18]
      ,[2017-18 to 2018-19]
      ,[2018-19 to 2019-20]
      ,[2014-15 to 2016-17 (AMP so far)]
      from pr14submeasure
      where Unique_ID is not NULL
)

select * from final
