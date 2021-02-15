with companyname as (
    select * from {{ ref('raw_Water_company_names') }}
),

renamed as (

    select
        water_company_acronym,water_company_name
    from companyname
    
)

select * from renamed
