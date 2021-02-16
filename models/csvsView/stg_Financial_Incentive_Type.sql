with source as (
select * from {{ ref('raw_Financial_Incentive_Type') }}
),

renamed as (
    select
       [Financial_Incentive_type]
      ,[Financial_Incentive_type_desc]
    from source
)

select * from renamed
