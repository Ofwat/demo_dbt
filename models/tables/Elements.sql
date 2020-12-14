with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

final as (
	
SELECT  HASHBYTES('SHA2_256', concat(Element_acronym,'-',Element_name)) [Element_id],[Element_name],[Element_acronym]
FROM (SELECT DISTINCT [Element (price control)] Element_name, [Element (price control) acronym] Element_acronym FROM PR14) m

)

select * from final


