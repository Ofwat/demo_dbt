select DISTINCT {{dbt_utils.hash('sub_measure_category')}} [sub_measure_category_Id], sub_measure_category
from ae_staging.Sub_measures_2019_CSV_View
where Null != sub_measure_category

/*
with submeasure as (
    select * from {{ ref('Sub_measures_2019_CSV_View') }}
),

final as (
	SELECT  DISTINCT {{dbt_utils.hash(['sub_measure_category'])}} [sub_measure_category_Id], sub_measure_category
    FROM submeasure
)

select * from final
*/