select * from {{ ref('stg_PR14_Performance_commitment') }}
union 
select * from {{ ref('stg_PR19_Performance_commitment') }}
