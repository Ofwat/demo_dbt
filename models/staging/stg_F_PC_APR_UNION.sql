select * from [dw_staging].[stg_Fact1]
union 
select * from [dw_staging].stg_Fact2
union
select * from [dw_staging].stg_Fact3
