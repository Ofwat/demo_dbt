SELECT distinct(odi_type)
      ,odi_form
      ,odi_timing
  FROM {{ ref('PR19FDOutcomeView') }}