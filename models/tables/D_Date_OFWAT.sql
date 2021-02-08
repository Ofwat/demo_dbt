with AMP as (
    select * from {{ ref('D_AMP_Year') }}
),

final as (
select {{dbt_utils.hash(dbt_utils.concat(['d.Date_ID']))}} [OFWAT_date_id],
d.*,AMP.AMP_ID,AMP.AMP_Name, Price_Review, AMP.start_year AMP_Start_Year, AMP.end_year AMP_End_Year,
AMP.start_date Amp_Start_Date,AMP.end_date Amp_End_Date
from [dw].[D_Date] d
join AMP 
on d.date>= AMP.start_date
and d.date<= AMP.end_date
    )

select * from final