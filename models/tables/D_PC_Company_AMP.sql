with pr14 as (
    select * from {{ ref('PR14_FD_outcome_New_CSV_View') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pc as (
    select * from {{ ref('D_Performance_commitment') }}
),
dateofwat as (
    select * from {{ ref('D_Date_OFWAT') }}
),
odi_form as (
    select * from {{ ref('D_ODI_form') }}
),
odi_type as (
    select * from {{ ref('D_ODI_type') }}
),
amp as (
    select * from {{ ref('D_AMP_year') }}
),
element as (
    select * from {{ ref('D_Element') }}
),

final as (
    select {{dbt_utils.hash(dbt_utils.concat(['unique_id','pc.pc_name','pc.primary_category']))}} [D_pc_company_amp_id]
    ,pc.D_performance_commitment_id
    ,pc.pc_name
    ,company.D_water_company_id
    ,unique_id
    ,D_amp_year_id 
    ,outcome
    ,PC_ref
    ,annex
    ,direction_of_improving_performance
    ,drinking_water_quality_compliance
    ,water_quality_contacts
    ,supply_interruptions_3_hours
    ,pollution_incidents_cat_3
    ,internal_sewer_flooding
    ,scheme_specific_factors_all_or_part
    ,asset_health_resilience_all_or_part
    ,nep_all_or_part
    ,AIM
    ,no_of_sub_measures
    ,standard_odi_operand
    ,standard_odi_operand_note
    ,[UnderP_payment1_incentive rate (GBPm)]
    ,[UnderP_payment2_incentive rate (GBPm)]
    ,[UnderP_payment3_incentive rate (GBPm)]
    ,[UnderP_payment4_incentive rate (GBPm)]
    ,[OutP_payment1_incentive rate (GBPm)]
    ,[OutP_payment2_incentive rate (GBPm)]
    -- ,water_resources
    -- ,water_network_plus
    -- ,wastewater_network_plus
    -- ,Bioresources_sludge
    -- ,residential_retail
    -- ,business_retail
    -- ,direct_procurement_for_customers
    -- ,dummy_control
    from pr14 
        left join pc
        on ltrim(right(pr14.performance_commitment, len(pr14.performance_commitment) - charindex(':',pr14.performance_commitment)))=pc.pc_name
        and pr14.pc_unit=pc.pc_unit
        and pr14.pc_unit_description=pc.pc_unit_description
        and pr14.decimal_places=pc.decimal_places
        and pr14.primary_category=pc.primary_category
        left join company on pr14.company=company.water_company_acronym
        left join odi_form on PR14.odi_form=odi_form.odi_form_name
        left join odi_type on PR14.odi_type=odi_type.ODI_Type_Name
        left join element on PR14.[Element_acronym]=element.Element_acronym
        cross join amp
        where amp.amp_name = 'AMP6'
)

select * from final