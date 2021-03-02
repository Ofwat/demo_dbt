with amp as (
    select * from {{ ref('raw_AMP_year') }}
),

renamed as (

    select
       amp_name,price_review,start_year,end_year,start_date,end_date
    from amp

)

select * from renamed
