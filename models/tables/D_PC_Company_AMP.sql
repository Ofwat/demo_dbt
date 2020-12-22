with PR14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV') }}
),
Company as (
    select * from {{ ref('D_Company') }}
),
PC as (
    select * from {{ ref('D_PC') }}
),
AMP as (
    select * from {{ ref('D_AMP_Year') }}
),
element as (
    select * from {{ ref('D_Elements') }}
),


final as (
 select distinct Unique_ID
	  ,'PR14' AMP_name
	  ,Company.Company_name
	  ,element.Element_acronym
      ,[Direction of improving performance] Direction_of_improving_performance
      ,[Drinking water quality compliance] Drinking_water_quality_compliance
      ,[Water quality contacts] Water_quality_contacts
      ,[Supply interruptions (>3 hours)] Supply_interruptions_3_hours
      ,[Pollution incidents (cat 3)] Pollution_incidents_cat_3
      ,[Internal sewer flooding] Internal_sewer_flooding
      ,[Scheme specific factors (all or part)] Scheme_specific_factors_all_or_part
      ,[Asset health/ resilience (all or part)] Asset_health_resilience_all_or_part
      ,[NEP (all or part)] NEP_all_or_part
      ,[AIM] AIM
      ,[No. of sub-measures] No_of_sub_measures
      ,[Standard ODI operand] Standard_ODI_operand
      ,[Standard ODI operand note] Standard_ODI_operand_note
  FROM PR14 
left join dw_niyati.D_PC PC on
 ltrim(right(PR14.[Performance_commitment], len(PR14.[Performance_commitment]) - charindex(':',PR14.[Performance_commitment])))=PC.PC_Name
	  and PR14.[PC_unit]=PC.[PC_unit]
       and PR14.[PC_unit_description]=PC.[PC_unit_description]
       and PR14.[Decimal_places]=PC.[Decimal_places]
	   left join Company on PR14.Company=Company.Company_name
	  left join element on PR14.[Element_acronym]=element.Element_acronym
    )

select * from final