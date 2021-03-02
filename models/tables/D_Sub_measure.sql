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
    select * from {{ ref('D_PR14_Performance_commitment') }}
),

final as (
    select submeasure.unique_id,submeasure.company_type,submeasure.company
    ,submeasure.element_acronym,submeasure.pc_ref, submeasure.performance_commitment
    ,submeasure.odi_type,submeasure.primary_category,submeasure.pc_unit_description
    ,sub_measure_ID,sub_measure,sub_measure_category,Sub_measure_weighting
    ,submeasure.decimal_places,Unit from submeasure 
    join pccompanyamp on pccompanyamp.unique_id = submeasure.unique_id
    join company on company.water_company_acronym = submeasure.company
    join element on element.element_acronym = submeasure.element_acronym
    )

select * from final
