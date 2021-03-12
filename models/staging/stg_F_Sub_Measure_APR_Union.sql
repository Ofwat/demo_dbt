select * from {{ ref('stg_F_sub_measure_apr_14_15')}}
Union
select * from {{ ref('stg_F_sub_measure_apr_15_16')}}
Union
select * from {{ ref('stg_F_sub_measure_apr_16_17')}}
Union
select * from {{ ref('stg_F_sub_measure_apr_17_18')}}
Union
select * from {{ ref('stg_F_sub_measure_apr_18_19')}}
Union
select * from {{ ref('stg_F_sub_measure_apr_19_20')}}
