with odi as (
select * from {{ ref('raw_ODI_form') }}
),

renamed as (

    select
        odi_form_name

    from odi

)

select * from renamed
