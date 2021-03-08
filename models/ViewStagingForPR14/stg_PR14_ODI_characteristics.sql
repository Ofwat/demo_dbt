SELECT distinct(odi_type)
      ,odi_form
      ,'N/A' odi_timing
  FROM {{ ref('PR14FDOutcomeView') }}