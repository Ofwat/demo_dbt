select
       amp_name,price_review,start_year,end_year,start_date,end_date
    from {{ ref('raw_AMP_year') }}
