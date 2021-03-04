select * from {{ ref('D_PR14_PC_company_amp') }}
union 
select * from {{ ref('D_PR19_PC_company_amp') }}
