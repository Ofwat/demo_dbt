    select  {{dbt_utils.hash(dbt_utils.concat(['amp_name']))}} amp_id,
    [amp_name]
      ,[price_review]
      ,[start_year]
      ,[end_year]
      ,[start_date]
      ,[end_date]
      ,[price_base]
 from {{ ref('raw_AMP_year') }}
