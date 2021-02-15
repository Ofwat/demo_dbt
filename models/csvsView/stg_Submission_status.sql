with submission as (
select * from {{ ref('raw_Submission_status') }}
),

renamed as (
    select
       submission_status_name,submission_status_description
    from submission
)

select * from renamed
