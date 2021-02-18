with yr as (
    select * from {{ ref('raw_Ofwat_year') }}
),

renamed as (

    select
       start_date year_start_date,end_date year_end_date
    from yr

)

select * from renamed
