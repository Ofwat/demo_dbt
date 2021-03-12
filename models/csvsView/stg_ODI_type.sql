with odi as (

    select * from {{ ref('raw_ODI_type') }}

),

renamed as (

    select
        odi_type_name,odi_type_description
    from odi

)

select * from renamed
