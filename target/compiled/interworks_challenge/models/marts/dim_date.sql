with date_dimension as (
    select * from RECRUITMENT_DB.CANDIDATE_00183.stg_dates
),
fiscal_periods as (
    

with fscl_year_dates_for_periods as (
    

-- this gets all the dates within a fiscal year
-- determined by the given year-end-month
-- ending on the saturday closest to that month's end date
with fsc_date_dimension as (
    select * from RECRUITMENT_DB.CANDIDATE_00183.stg_dates
),
year_month_end as (

    select
       d.year_number - 1 as fiscal_year_number,
       d.month_end_date
    from
        fsc_date_dimension d
    where
        d.month_of_year = 1
    group by 1,2

),
weeks as (

    select
        d.year_number,
        d.month_of_year,
        d.date_day as week_start_date,
        cast(

    dateadd(
        day,
        6,
        d.date_day
        )

 as date) as week_end_date
    from
        fsc_date_dimension d
    where
        d.day_of_week = 1

),
-- get all the weeks that start in the month the year ends
year_week_ends as (

    select
        d.year_number - 1 as fiscal_year_number,
        d.week_end_date
    from
        weeks d
    where
        d.month_of_year = 1
    group by
        1,2

),
-- then calculate which Saturday is closest to month end
weeks_at_month_end as (

    select
        d.fiscal_year_number,
        d.week_end_date,
        m.month_end_date,
        rank() over
            (partition by d.fiscal_year_number
                order by
                abs(datediff(
        day,
        d.week_end_date,
        m.month_end_date
        ))

            ) as closest_to_month_end
    from
        year_week_ends d
        join
        year_month_end m on d.fiscal_year_number = m.fiscal_year_number
),
fiscal_year_range as (

    select
        w.fiscal_year_number,
        cast(
            

    dateadd(
        day,
        1,
        lag(w.week_end_date) over(order by w.week_end_date)
        )


            as date) as fiscal_year_start_date,
        w.week_end_date as fiscal_year_end_date
    from
        weeks_at_month_end w
    where
        w.closest_to_month_end = 1

),
fiscal_year_dates as (

    select
        d.date_day,
        m.fiscal_year_number,
        m.fiscal_year_start_date,
        m.fiscal_year_end_date,
        w.week_start_date,
        w.week_end_date,
        -- we reset the weeks of the year starting with the merch year start date
        dense_rank()
            over(
                partition by m.fiscal_year_number
                order by w.week_start_date
                ) as fiscal_week_of_year
    from
        fsc_date_dimension d
        join
        fiscal_year_range m on d.date_day between m.fiscal_year_start_date and m.fiscal_year_end_date
        join
        weeks w on d.date_day between w.week_start_date and w.week_end_date

)
select * from fiscal_year_dates order by 1


),
fscl_year_w13 as (

    select
        f.*,
        -- We count the weeks in a 13 week period
        -- and separate the 4-5-4 week sequences
        mod(cast(
            (f.fiscal_week_of_year-1) as integer
            ), 13) as w13_number,
        -- Chop weeks into 13 week merch quarters
        cast(
            least(
                floor((f.fiscal_week_of_year-1)/13.0)
                , 3)
            as integer) as quarter_number
    from
        fscl_year_dates_for_periods f

),
fscl_periods as (

    select
        f.date_day,
        f.fiscal_year_number,
        f.week_start_date,
        f.week_end_date,
        f.fiscal_week_of_year,
        case
            -- we move week 53 into the 3rd period of the quarter
            when f.fiscal_week_of_year = 53 then 3
            when f.w13_number between 0 and 3 then 1
            when f.w13_number between 4 and 8 then 2
            when f.w13_number between 9 and 12 then 3
        end as period_of_quarter,
        f.quarter_number
    from
        fscl_year_w13 f

),
fscl_periods_quarters as (

    select
        f.*,
        cast((
            (f.quarter_number * 3) + f.period_of_quarter
         ) as integer) as fiscal_period_number
    from
        fscl_periods f

)
select
    date_day,
    fiscal_year_number,
    week_start_date,
    week_end_date,
    fiscal_week_of_year,
    dense_rank() over(partition by fiscal_period_number order by fiscal_week_of_year) as fiscal_week_of_period,
    fiscal_period_number,
    quarter_number+1 as fiscal_quarter_number,
    period_of_quarter as fiscal_period_of_quarter
from
    fscl_periods_quarters
order by 1,2

)
select
    d.*,
    f.fiscal_week_of_year,
    f.fiscal_week_of_period,
    f.fiscal_period_number,
    f.fiscal_quarter_number,
    f.fiscal_period_of_quarter
from
    date_dimension d
    left join
    fiscal_periods f
        on d.date_day = f.date_day