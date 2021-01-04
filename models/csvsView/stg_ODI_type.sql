with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_ODI_type') }}

),

renamed as (

    select
        odi_name,odi_description

    from source

)

select * from renamed
