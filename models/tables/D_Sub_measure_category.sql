select DISTINCT {{dbt_utils.hash('sub_measure_category')}} [sub_measure_category_Id], sub_measure_category
from {{ ref('Sub_measures_2019_CSV_View') }}
where sub_measure_category IS NOT NULL
