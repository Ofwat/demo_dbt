with source as (
select * from {{ ref('raw_AMP_Year') }}
),

renamed as (

    select
       AMP_name,Price_Review,start_year,end_year,start_date,end_date

    from source

)

select * from renamed
