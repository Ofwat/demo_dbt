with source as (
select * from {{ ref('raw_ODI_form') }}
),

renamed as (

    select
        odi_form

    from source

)

select * from renamed
