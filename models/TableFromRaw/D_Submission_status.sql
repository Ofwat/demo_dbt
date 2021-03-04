select {{dbt_utils.hash(dbt_utils.concat(['submission_status_name','submission_status_description']))}} submission_status_id
    ,submission_status_name
    ,submission_status_description
    from {{ ref('raw_Submission_status') }}

