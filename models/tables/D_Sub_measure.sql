with submeasure as (
    select * from {{ ref('Sub_measures_2019_CSV_View') }}
),
PCCompanyAMP as (
    select * from {{ ref('D_PC_Company_AMP') }}
),
Company as (
    select * from {{ ref('D_Water_Company') }}
),
element as (
    select * from {{ ref('D_Element') }}
),
PC as (
    select * from {{ ref('D_Performance_commitment') }}
),

final as (
SELECT  
        {{dbt_utils.hash(dbt_utils.concat(['submeasure.Unique_ID','submeasure.sub_measure_ID','submeasure.Company']))}} [D_Sub_measure_id],
        submeasure.Unique_ID,
        submeasure.Company_type,
        submeasure.Company,
        submeasure.Element_acronym,
        submeasure.PC_ref,
        submeasure.Performance_commitment,
        submeasure.ODI_type,
        submeasure.Primary_Category,
        submeasure.PC_unit_description,
        submeasure.sub_measure_ID,
        submeasure.sub_measure,
        submeasure.Sub_measure_weighting,
        submeasure.Decimal_places,
        submeasure.Unit,
        submeasure.[Reference_Regulatory output during 2010-15  ] Reference_Regulatory_output_during_2010_15,  
        submeasure.[Reference_Expected performance by 2014-15  ] Reference_Expected_performance_by_2014_15,
        submeasure.[High_Regulatory output during 2010-15  ] High_Regulatory_output_during_2010_15,
        submeasure.[High_Expected performance by 2014-15  ] High_Expected_performance_by_2014_15,
        submeasure.[Low_Regulatory output during 2010-15  ] Low_Regulatory_output_during_2010_15,
        submeasure.[Low_Expected performance by 2014-15  ] Low_Expected_performance_by_2014_15,
        submeasure.[Failure threshold for AMP6] Failure_threshold_for_AMP6,
        submeasure.[Direction of improving performance] Direction_of_improving_performance
        FROM submeasure 
join PCCompanyAMP on PCCompanyAMP.Unique_ID = submeasure.Unique_ID
join Company on Company.Company_acronym = submeasure.Company
join element on element.Element_acronym = submeasure.Element_acronym
)

select * from final

-- SELECT DISTINCT(sub.[PC / sub-measure]) FROM [dw_staging].Sub_measures_2019_CSV sub where sub.[PC / sub-measure]IS NOT null
-- /* 174 rows*/

-- SELECT DISTINCT(sub.[Sub-measure category]) FROM [dw_staging].Sub_measures_2019_CSV sub where sub.[Sub-measure category] IS NOT null
--  /* 37 rows*/

-- SELECT sub.[PC / sub-measure],sub.[Sub-measure category] FROM [dw_staging].Sub_measures_2019_CSV sub where sub.[Sub-measure category] IS NOT null
-- order by sub.[Sub-measure category]
--  /* 183 rows*/

--  SELECT DISTINCT(sub.[PC / sub-measure] ),sub.[Sub-measure category] FROM [dw_staging].Sub_measures_2019_CSV sub where sub.[Sub-measure category] IS NOT null order by sub.[Sub-measure category]
--  /* It might not be valid as the same sub meausre can take place under different companies 146 rows*/
