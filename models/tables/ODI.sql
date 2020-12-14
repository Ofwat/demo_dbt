with source as (
    
    select * from {{ ref('stg_ODI') }}

),

renamed as (

    select
        odi_name,odi_description

    from source

)

select * from renamed
