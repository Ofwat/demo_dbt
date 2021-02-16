with PR14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),
Company as (
    select * from {{ ref('D_Water_Company') }}
),
PC as (
    select * from {{ ref('D_Performance_commitment') }}
),
AMP as (
    select * from {{ ref('D_AMP_Year') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
odi_form as (
    select * from {{ ref('D_ODI_Form') }}
),
odi_type as (
    select * from {{ ref('D_ODI_Type') }}
),
final as (
 select {{dbt_utils.hash(dbt_utils.concat(['Unique_ID','PC.PC_Name','PC.Primary_Category']))}} [PC_Company_AMP_id]
      , Unique_ID
	  ,AMP_ID
      ,AMP_name
	  ,Company.Water_Company_Name
      ,Company.Water_Company_id
      ,odi_form.ODI_Form_id
      ,odi_type.ODI_Type_id
	  ,element.Element_acronym
      ,Outcome
      ,PC_ref
      ,Annex
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
      ,[UnderP_payment1_incentive rate (GBPm)]
      ,[UnderP_payment2_incentive rate (GBPm)]
      ,[UnderP_payment3_incentive rate (GBPm)]
      ,[UnderP_payment4_incentive rate (GBPm)]
      ,[OutP_payment1_incentive rate (GBPm)]
      ,[OutP_payment2_incentive rate (GBPm)]
      ,[Water resources]
      ,[Water network plus]
      ,[Wastewater network plus]
      ,[Bioresources (sludge)]
      ,[Residential retail]
      ,[Business retail]
      ,[Direct procurement for customers]
  FROM PR14 
left join PC on
 ltrim(right(PR14.[Performance_commitment], len(PR14.[Performance_commitment]) - charindex(':',PR14.[Performance_commitment])))=PC.PC_Name
	  and PR14.[PC_unit]=PC.[PC_unit]
       and PR14.[PC_unit_description]=PC.[PC_unit_description]
       and PR14.[Decimal_places]=PC.[Decimal_places]
       and PR14.[Primary_Category]=PC.[Primary_Category]
       left join odi_form on PR14.odi_form=odi_form.odi_form_name
       left join odi_type on PR14.odi_type=odi_type.ODI_Type_Name
	   left join Company on PR14.Company=Company.Water_Company_Name
	   left join element on PR14.[Element_acronym]=element.Element_acronym
       cross join AMP
       where AMP.AMP_name = 'AMP6'
    )

select * from final