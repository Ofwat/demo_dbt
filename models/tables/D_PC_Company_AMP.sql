with PR14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV') }}
),
Company as (
    select * from {{ ref('D_Company') }}
),
PC as (
    select * from {{ ref('D_Performance_commitment') }}
),
AMP as (
    select * from {{ ref('D_AMP_Year') }}
),
element as (
    select * from {{ ref('D_Elements') }}
),
/*ODI as (
    select * from {{ ref('D_ODI') }}
),*/

final as (
 select {{dbt_utils.hash(dbt_utils.concat(['Unique_ID','PC.PC_Name','PC.Primary_Category']))}} [PC_Company_AMP_id]
      , Unique_ID
	  ,'PR14' AMP_name
	  ,Company.Company_name
	  ,element.Element_acronym
    /*  ,ODI_type
      ,ODI_form
      ,In_period_ODI
      ,Vanilla_ODI
      */
      ,Direction_of_improving_performance
      ,Drinking_water_quality_compliance
      ,Water_quality_contacts
      ,Supply_interruptions_3_hours
      ,Pollution_incidents_cat_3
      ,Internal_sewer_flooding
      ,Scheme_specific_factors_all_or_part
      ,Asset_health_resilience_all_or_part
      ,NEP_all_or_part
      ,AIM
      ,No_of_sub_measures
      ,Standard_ODI_operand
      ,Standard_ODI_operand_note
  FROM PR14 
left join dw_niyati.D_Performance_commitment PC on
 ltrim(right(PR14.[Performance_commitment], len(PR14.[Performance_commitment]) - charindex(':',PR14.[Performance_commitment])))=PC.PC_Name
	  and PR14.[PC_unit]=PC.[PC_unit]
       and PR14.[PC_unit_description]=PC.[PC_unit_description]
       and PR14.[Decimal_places]=PC.[Decimal_places]
       and PR14.[Primary_Category]=PC.[Primary_Category]
	   left join Company on PR14.Company=Company.Company_name
	  left join element on PR14.[Element_acronym]=element.Element_acronym
	 /* left join ODI on PR14.[ODI_type]=ODI.[odi_name]*/
    )

select * from final