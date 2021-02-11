with source as (

    select * from {{ ref('raw_ODI_type') }}

),

renamed as (

    select
        odi_type_name,odi_type_description
    from source

)

select * from renamed
