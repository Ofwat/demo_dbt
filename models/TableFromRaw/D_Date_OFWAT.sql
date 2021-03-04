with amp as (
    select * from {{ ref('raw_AMP_year') }}
),yr as (
    select * from {{ ref('raw_Ofwat_year') }}
),

final as (

    select {{dbt_utils.hash(dbt_utils.concat(['d.Date_ID']))}} Date_ofwat_id,
    d.*,case when d.Month <=substring(yr.year_end_date,2,1) and d.Day<=substring(yr.year_end_date,4,2)
	then concat(year-1,'-',substring(convert(varchar(4),year),3,2))
    else 
	concat( year,'-',substring((convert(varchar(4),year+1)),3,2))
	end  Ofwat_Year,amp.amp_name,price_review,start_year,end_year,start_date amp_start_date,end_date amp_end_date
    from [dw].[D_Date] d
    join amp 
    on d.date>= amp.start_date
    and d.date<= amp.end_date
    cross join yr

)

select * from final