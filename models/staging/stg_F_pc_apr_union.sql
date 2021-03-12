select * from {{ ref('stg_F_pc_apr_14_15_estimate') }}
union 
select * from {{ ref('stg_F_pc_apr_14_15') }}
union 
select * from {{ ref('stg_F_pc_apr_15_16') }}
union
select * from {{ ref('stg_F_pc_apr_16_17') }}
union
select * from {{ ref('stg_F_pc_apr_17_18') }}
union
select * from {{ ref('stg_F_pc_apr_18_19') }}
union
select * from {{ ref('stg_F_pc_apr_19_20_estimate') }}
union 
select * from {{ ref('stg_F_pc_apr_19_20') }}
