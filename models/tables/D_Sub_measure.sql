with submeasure as (
    select * from {{ ref('PR14SubMeasuresView') }}
),
pccompanyamp as (
    select * from {{ ref('D_PC_company_amp') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
pc as (
    select * from {{ ref('D_Performance_commitment') }}
),

final as (
    select  
        {{dbt_utils.hash(dbt_utils.concat(['submeasure.unique_id','submeasure.sub_measure_ID','submeasure.company']))}} [D_sub_measure_id],
        submeasure.unique_id,
        submeasure.company_type,
        submeasure.company,
        submeasure.element_acronym,
        submeasure.pc_ref,
        submeasure.performance_commitment,
        submeasure.odi_type,
        submeasure.primary_category,
        submeasure.pc_unit_description,
        submeasure.sub_measure_ID,
        submeasure.sub_measure,
        submeasure.sub_measure_category,
        submeasure.sub_measure_weighting,
        submeasure.decimal_places,
        submeasure.unit,
        submeasure.reference_regulatory_output_during_2010_15,  
        submeasure.reference_expected_performance_by_2014_15,
        submeasure.high_regulatory_output_during_2010_15,
        submeasure.high_expected_performance_by_2014_15,
        submeasure.low_regulatory_output_during_2010_15,
        submeasure.low_expected_performance_by_2014_15,
        submeasure.failure_threshold_for_AMP6,
        submeasure.direction_of_improving_performance
    from submeasure 
    join pccompanyamp on pccompanyamp.unique_id = submeasure.unique_id
    join company on company.water_company_acronym = submeasure.company
    join element on element.element_acronym = submeasure.element_acronym
    where submeasure.sub_measure_ID <> '00'
)

select * from final
