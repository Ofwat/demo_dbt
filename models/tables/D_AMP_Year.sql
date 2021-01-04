with source as (
    
    select * from {{ ref('stg_AMP_Year') }}

),

renamed as (

    select AMP_id,AMP_name,start_date,end_date

    from source

)

select * from renamed
