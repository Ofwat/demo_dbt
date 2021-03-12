select DISTINCT {{dbt_utils.hash('sub_measure_category')}} [sub_measure_category_id], sub_measure_category
from {{ ref('PR14SubMeasuresView') }}
where sub_measure_category IS NOT NULL
