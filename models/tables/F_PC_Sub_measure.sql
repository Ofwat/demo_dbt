with F_Sub_Measure_APR_Union as (
    select * from {{ ref('stg_F_Sub_Measure_APR_Union') }}
),
Sub_measure as (
    select * from {{ ref('D_Sub_measure') }}
),
Company as (
    select * from {{ ref('D_Water_Company') }}
),
PC_Company_AMP as (
    select * from {{ ref('D_PC_Company_AMP') }}
),
Sub_measure_category as (
    select * from {{ ref('D_Sub_measure_category') }}
),
Submission as (
    select * from {{ ref('D_Submission_status') }}
),

final as (
select 
Sub_measure.[D_Sub_measure_id]
,Year 
,F_Sub_Measure_APR_Union.[Submission_Status]
,PC_Company_AMP.[Unique_ID]
,Company.[Water_Company_ID] 
,PC_Company_AMP.[PC_Company_AMP_ID]
,Sub_measure_category.[sub_measure_category_ID]
,F_Sub_Measure_APR_Union.PCL
,F_Sub_Measure_APR_Union.Reference
,F_Sub_Measure_APR_Union.High
,F_Sub_Measure_APR_Union.Low
,F_Sub_Measure_APR_Union.performance_level_actual
,F_Sub_Measure_APR_Union.performance_level_met

FROM [F_Sub_Measure_APR_Union] 
    left join Sub_measure on {{dbt_utils.hash(dbt_utils.concat(['F_Sub_Measure_APR_Union.Unique_ID','F_Sub_Measure_APR_Union.sub_measure_ID','F_Sub_Measure_APR_Union.Company']))}} = Sub_measure.D_Sub_measure_id
    left join Company  on F_Sub_Measure_APR_Union.Company = Company.Company_acronym
    left join PC_Company_AMP on F_Sub_Measure_APR_Union.[Unique_ID] = PC_Company_AMP.Unique_ID
    left join Sub_measure_category on F_Sub_Measure_APR_Union.[sub_measure_category] = Sub_measure_category.sub_measure_category
    left join  Submission on F_Sub_Measure_APR_Union.[Submission_Status]=replace(Submission.submission_status_description,'APR','')
)

select * from final
