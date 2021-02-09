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
SELECT  sub_measure_ID, sub_measure, sub_measure_category, Company, submeasure.Element_acronym, PC.PC_Name,Sub_measure_weighting, Unit, submeasure.Decimal_places FROM submeasure 
join PCCompanyAMP on PCCompanyAMP.Unique_ID = submeasure.Unique_ID
join Company on Company.Company_acronym = submeasure.Company
join element on element.Element_acronym = submeasure.Element_acronym
join PC on PC.PC_Name = ltrim(right(submeasure.[Performance_commitment], len(submeasure.[Performance_commitment]) - charindex(':',submeasure.[Performance_commitment])))
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
