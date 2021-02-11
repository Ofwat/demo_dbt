with amp as (
    select * from {{ ref('D_AMP_year') }}
),

final as (

    select {{dbt_utils.hash(dbt_utils.concat(['d.Date_ID']))}} D_date_ofwat_id,
    d.*,amp.d_amp_year_id,amp.amp_name,price_review,start_year,end_year,start_date,end_date
    from [dw].[D_Date] d
    join amp 
    on d.date>= amp.start_date
    and d.date<= amp.end_date

)

select * from final