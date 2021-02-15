select * from {{ ref('stg_F_Sub_Measure_APR14_15')}}
Union
select * from {{ ref('stg_F_Sub_Measure_APR15_16')}}
Union
select * from {{ ref('stg_F_Sub_Measure_APR16_17')}}
Union
select * from {{ ref('stg_F_Sub_Measure_APR17_18')}}
Union
select * from {{ ref('stg_F_Sub_Measure_APR18_19')}}
Union
select * from {{ ref('stg_F_Sub_Measure_APR19_20')}}
