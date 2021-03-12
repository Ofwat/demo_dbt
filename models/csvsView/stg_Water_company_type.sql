with companytype as (
    select * from {{ ref('raw_Water_company_type') }}
),

renamed as (

    select
        water_company_type, water_company_type_description
    from companytype

)

select * from renamed
