with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_Water_company_names') }}

),

renamed as (

    select
        Company_acronym,Company_name
    from source

)

select * from renamed
