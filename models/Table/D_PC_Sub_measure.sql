with F_sub_measure_apr_union as (
    select * from {{ ref('stg_Sub_measure_apr_union') }}
),
sub_measure as (
    select * from {{ ref('D_Sub_measure') }}
),
company as (
    select * from {{ ref('D_Water_company') }}
),
pc_company_amp as (
    select * from {{ ref('D_PC_company_amp') }}
),
sub_measure_category as (
    select * from {{ ref('D_Sub_measure_category') }}
),
submission as (
    select * from {{ ref('D_Submission_status') }}
),

final as (
select 
    sub_measure.D_sub_measure_id
    ,year 
    ,F_sub_measure_apr_union.submission_status
    ,pc_company_amp.unique_id
    ,company.water_company_id
    ,pc_company_amp.pc_company_amp_id
    ,sub_measure_category.sub_measure_category_id
    ,F_sub_measure_apr_union.reference
    ,F_sub_measure_apr_union.high
    ,F_sub_measure_apr_union.low
    ,F_sub_measure_apr_union.performance_level_actual
    ,F_sub_measure_apr_union.performance_level_met

FROM [F_sub_measure_apr_union] 
    inner join sub_measure on 
        {{dbt_utils.hash(dbt_utils.concat(['F_sub_measure_apr_union.unique_id','F_sub_measure_apr_union.sub_measure_ID','F_sub_measure_apr_union.company']))}} 
        = sub_measure.D_sub_measure_id
    left join company on F_sub_measure_apr_union.company = company.water_company_acronym
    left join pc_company_amp on F_sub_measure_apr_union.[unique_id] = pc_company_amp.unique_id
    left join sub_measure_category on F_sub_measure_apr_union.[sub_measure_category] = sub_measure_category.sub_measure_category
    left join  submission on F_sub_measure_apr_union.[submission_status]=replace(submission.submission_status_description,'APR','')
)

select * from final
