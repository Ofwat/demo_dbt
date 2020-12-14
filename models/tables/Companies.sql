with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

element as (

    select * from {{ ref('Elements') }}

),

final as (
	
  -- The unique key for company is = "company+element_id"  as same company have different elements types.
  -- Example ANH is a water and sewage company and has more than 1 element type eg. Water, WasteWater, Retail HH 
  SELECT DISTINCT pr.[Company],pr.[Company type],element.[Element_id],
  HASHBYTES('SHA2_256', concat(Company,'-', pr.[Company type])) as [Company_id],
  HASHBYTES('SHA2_256', concat(pr.[Company],'-', element.[Element_id])) as [Company_element_id]
  FROM [dw].[PR14_FD_outcome_New_CSV] pr
  INNER JOIN [dw_niyati].[Elements] element ON pr.[Element (price control)]=element.[Element_name]

)

select * from final