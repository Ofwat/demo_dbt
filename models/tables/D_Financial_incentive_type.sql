with factunion as (
select * from {{ ref('stg_F_pc_apr_union') }}
),

renamed as (

select {{dbt_utils.hash(dbt_utils.concat(['financial_incentive_type','Incentive_Period']))}} financial_incentive_id,
financial_incentive_type,Incentive_Period
from (select distinct notional_outperformance_payment_or_underperformance_payment_accrued financial_incentive_type,'Notional Period' Incentive_Period
from factunion
union 
select distinct outperformance_payment_or_underperformance_payment_in_period_ODI financial_incentive_type, 'IN Period ODI' Incentive_Period
from factunion) p

)

select * from renamed