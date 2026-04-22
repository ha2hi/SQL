-- https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true
/*
Enter your query here.
*/
with project_group as (
    select 
        task_id,
        start_date,
        end_date,
        case 
            when lag(end_date) over(order by start_date) = start_date then 0
                else 1 end as new_projects
    from projects),
grouped_projects as (select
    start_date,
    end_date,
    sum(new_projects) over(order by start_date) as project_id
FROM
    project_group)
SELECT
    MIN(Start_Date) AS project_start,
    MAX(End_Date) AS project_end
FROM grouped_projects
GROUP BY project_id
order by datediff(MAX(end_date), MIN(start_date)), MIN(start_date)
