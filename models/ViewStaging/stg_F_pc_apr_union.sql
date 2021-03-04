select * from {{ ref('stg_PR14_F_pc_apr_14_15_estimate')}}
union 
select * from {{ ref('stg_PR14_F_pc_apr_14_15')}}
union 
select * from {{ ref('stg_PR14_F_pc_apr_15_16')}}
union
select * from {{ ref('stg_PR14_F_pc_apr_16_17')}}
union
select * from {{ ref('stg_PR14_F_pc_apr_17_18')}}
union
select * from {{ ref('stg_PR14_F_pc_apr_18_19')}}
union
select * from {{ ref('stg_PR14_F_pc_apr_19_20_estimate')}}
union 
select * from {{ ref('stg_PR14_F_pc_apr_19_20')}}
union
select * from {{ ref('stg_PR19_F_pc_apr_20_21')}}
union
select * from {{ ref('stg_PR19_F_pc_apr_21_22')}}
union
select * from {{ ref('stg_PR19_F_pc_apr_22_23')}}
union
select * from {{ ref('stg_PR19_F_pc_apr_23_24')}}
union
select * from {{ ref('stg_PR19_F_pc_apr_24_25')}}
