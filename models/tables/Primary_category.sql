with PR14 as (

    select * from {{ ref('PR14_FD_outcome_New_CSV') }}

),

final as (
	
SELECT  HASHBYTES('SHA2_256', concat([Performance commitment],'-',[Primary Category])) [PC_id], [PC ref. (company)],[PR14 Annex 4 order],[Performance commitment],[Primary Category],[PC unit],[PC unit description],[Decimal places]
FROM (SELECT [PC ref. (company)],[PR14 Annex 4 order],[Performance commitment],[Primary Category],[PC unit],[PC unit description],[Decimal places] FROM PR14) m



)

select * from final

