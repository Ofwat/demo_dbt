with pr19 as (
    select * from {{ ref('PR19FDOutcomeView') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pc as (
    select * from {{ ref('D_PR19_Performance_commitment') }}
),
dateofwat as (
    select * from {{ ref('D_Date_OFWAT') }}
),
amp as (
    select * from {{ ref('stg_AMP_year') }}
),

final as (
    select {{dbt_utils.hash(dbt_utils.concat(['unique_id','pc.pc_name','pc.primary_category']))}} pc_company_amp_id
    ,pc.performance_commitment_id
    ,pc.pc_name
    ,company.water_company_id
    ,unique_id
    ,outcome
    ,PC_ref
    ,'N/A' annex
    ,direction_of_improving_performance
    ,'N/A' drinking_water_quality_compliance
    ,'N/A' water_quality_contacts
    , 'N/A'supply_interruptions_3_hours
    , 'N/A'pollution_incidents_cat_3
    , 'N/A'internal_sewer_flooding
    ,special_cost_factor
    ,scheme_specific_factor
    ,asset_health
    ,nep
    ,AIM
    ,customers_relative_priority
    ,'N/A' no_of_sub_measures
    ,standard_odi_cal
    ,standard_odi_operand
    ,standard_odi_operand_note
    ,'N/A' [UnderP_payment1_incentive rate (GBPm)]
    ,'N/A' [UnderP_payment2_incentive rate (GBPm)]
    ,'N/A' [UnderP_payment3_incentive rate (GBPm)]
    ,'N/A' [UnderP_payment4_incentive rate (GBPm)]
    ,'N/A' [OutP_payment1_incentive rate (GBPm)]
    ,'N/A' [OutP_payment2_incentive rate (GBPm)]
    ,water_resources
    ,water_network_plus
    ,wastewater_network_plus
    ,bioresources_sludge
    ,residential_retail
    ,business_retail
    ,direct_procurement_for_customers
    ,dummy_control
    from pr19
        left join pc on pr19.pc_name=pc.pc_name
        and pr19.pc_unit=pc.pc_unit
        and pr19.pc_unit_description=pc.pc_unit_description
        and pr19.decimal_places=pc.decimal_places
        and pr19.primary_category=pc.primary_category
        left join company on pr19.company=company.water_company_acronym
        cross join amp
        where amp.amp_name = 'AMP7'
)

select * from final