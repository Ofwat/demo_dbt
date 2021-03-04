select * from {{ ref('D_PR14_Performance_commitment') }}
union 
select * from {{ ref('D_PR19_Performance_commitment') }}
