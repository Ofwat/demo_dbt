with amp as (
    select * from {{ ref('stg_AMP_year') }}
),

renamed as (

    select {{dbt_utils.hash(dbt_utils.concat(['amp_name','price_review']))}} D_amp_year_id,
    amp_name,price_review,start_year,end_year,start_date,end_date
    from amp

)

select * from renamed
