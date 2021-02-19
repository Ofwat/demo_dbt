with submission as (
    select * from {{ ref('stg_Submission_status') }}
),

renamed as (

    select {{dbt_utils.hash(dbt_utils.concat(['submission_status_name','submission_status_description']))}}Submission_status_id
    ,submission_status_name
    ,submission_status_description
    from submission

)

select * from renamed
