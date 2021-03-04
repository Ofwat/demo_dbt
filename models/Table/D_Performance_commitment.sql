SELECT [performance_commitment_id]
      ,[pc_name]
      ,[primary_category]
      ,[pc_unit]
      ,[pc_unit_description]
      ,[decimal_places]
  FROM {{ref('stg_Performance_commitment_union') }}