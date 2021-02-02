with source as (
    
    select * from {{ ref('stg_AMP_Year') }}

),

renamed as (

    select {{dbt_utils.hash(dbt_utils.concat(['AMP_name','Price_Review']))}}  AMP_id,AMP_name,Price_Review,start_year,end_year

    from source

)

select * from renamed
