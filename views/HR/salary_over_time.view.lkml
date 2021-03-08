include: "salary.view.lkml"
view: salary_over_time {
  extends: [salary]

  derived_table: {
    sql:
      WITH dt as (
          SELECT
            day
          FROM UNNEST(
              GENERATE_DATE_ARRAY(DATE('2012-01-01'), CURRENT_DATE(), INTERVAL 1 DAY)
              ) day
        )

      SELECT
        dt.day as date
        , s.employee_id
        , salary_change_date
        , new_salary
        , next_salary_change_date
        , next_salary
        , salary_changes
        , salary_change_rank
        , e.employee_name as employee_name
        , e.departure_date as departure_date
        , e.gender as gender
        , e.ethnicity as ethnicity
        , e.is_people_manager as is_people_manager
        , e.most_recent_performance_review as most_recent_rating
        , e.start_date as start_date
        , e.department_id as department
        , s.currency as currency
        , e.office_location as office_location
        , e.user_status as user_status


      FROM dt,
      (select
        currency
        , employee_id
        , salary new_salary
        , salary_change_date
        , lead(salary_change_date, 1) over(partition by employee_id order by salary_change_date asc) next_salary_change_date
        , lead(salary, 1) over(partition by employee_id order by salary_change_date asc) next_salary
        , first_value(salary) over(partition by employee_id order by salary_change_date asc)  starting_salary
        , count(salary_change_date) over(partition by employee_id) as salary_changes
        , rank() over(partition by employee_id order by salary_change_date asc) salary_change_rank
      from `looker-private-demo.hr_recruiting.salary`) as s
      left join `looker-private-demo.hr_recruiting.employees` as e on (s.employee_id = e.employee_id)

      WHERE dt.day >= date_trunc(e.start_date, day)
      and (
        case
          when salary_changes = 1 then 1=1
          else dt.day >= s.salary_change_date
                and (dt.day < s.next_salary_change_date or (s.next_salary_change_date is null and dt.day >= s.salary_change_date) )
          and (
            case
              when date_trunc(s.salary_change_date, day) = date_trunc(s.next_salary_change_date, day)
                then 0=1
              else 1=1
            end
              )
        end
        )



      order by 2 asc, 1  ;;
  }

  dimension: date {
    hidden: yes
    label: "Date Filter"
    type: date
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  filter: filter_on_date {
    label: "Date Range Selector"
    hidden: yes
    type: date
    sql: {% condition filter_on_date %} ${date} {% endcondition %} ;;
  }

  parameter: timeframe_selector {
    type: unquoted
    default_value: "Day"
    allowed_value: { label: "Day" value: "DAY" }
    allowed_value: { label: "Week" value: "WEEK" }
    allowed_value: { label: "Month" value: "MONTH" }
    allowed_value: { label: "Quarter" value: "QUARTER" }
    allowed_value: { label: "Year" value: "YEAR" }
  }

  dimension: timeframe {
    hidden: yes
    label_from_parameter: timeframe_selector
    type: string
    sql: DATE_TRUNC(${date}, {% parameter timeframe_selector %} ) ;;
  }

  dimension: prev_timeframe {
    hidden: yes
    type: date
    datatype: timestamp
    sql: TIMESTAMP(DATE_TRUNC(
                  DATE_SUB(${date}, INTERVAL 1 {% parameter timeframe_selector %})
                  , {% parameter timeframe_selector %}
                  )) ;;
  }

  dimension: next_timeframe {
    hidden: yes
    type: date
    datatype: timestamp
    sql: TIMESTAMP(DATE_TRUNC(
                  DATE_ADD(${date}, INTERVAL 1 {% parameter timeframe_selector %})
                  , {% parameter timeframe_selector %}
                  )) ;;
  }

  measure: terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##

    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
  }

  measure: hires_lte_date {

    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
  }

  measure: hires_in_period {

    label: "Starts to Date in Period"
    group_item_label: "Starts to Date"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} AND ${start_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: terms_in_period {
    label: "Terms in Period"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} AND ${departure_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: hc_at_eop {
    label: "Headcount to Date in Period"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
  }

  dimension: raise_in_period {
    hidden: yes
    type: yesno
    sql: CASE WHEN ${next_salary_date} >= ${timeframe} THEN TRUE ELSE FALSE END ;;
  }

  dimension: employee_name {
    label: "Employee Name"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.employee_name ;;
  }

  dimension: employee_id {
    hidden: yes
    label: "Employee ID"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: departure_date {
    label: "Departure Date"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.departure_date ;;
  }

  dimension: gender {
    label: "Gender"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ethnicity {
    label: "Ethnicity"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: currency {
    label: "Currency"
    group_label: "Salary Info"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: is_people_manager {
    label: "Is People Manager?"
    group_label: "Employee Info"
    type: yesno
    sql: ${TABLE}.is_people_manager ;;
  }

  dimension: most_recent_rating {
    label: "Most Recent Performance Rating"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.most_recent_rating ;;
  }

  dimension: start_date {
    label: "Start Date"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.start_date ;;
  }

  dimension: department {
    hidden: yes
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: salary_date {
    hidden: yes
    type: date
    sql: TIMESTAMP(${TABLE}.salary_change_date) ;;
  }

  dimension: next_salary_date {
    hidden: yes
    type: date
    sql: TIMESTAMP(${TABLE}.next_salary_change_date) ;;
  }

  dimension: difference_between_salary_dates {
    type: number
    hidden: yes
    sql: date_diff(${next_salary_date},${salary_date},day) ;;
  }

  dimension: salary_changes {
    type: number
    hidden: yes
    sql: ${TABLE}.new_salary ;;
  }

  dimension: next_salary_change {
    type: number
    hidden: yes
    sql: ${TABLE}.next_salary ;;
  }

  dimension: difference_between_salary {
    type: number
    hidden: yes
    sql: case when ${next_salary_change} is not null then ${next_salary_change}-${salary_changes} else null end ;;
  }

  dimension: department_name_cohort {
    label: "Department"
    group_label: "Employee Info"
    type: string
    hidden: no
    sql: CASE
          WHEN ${department} = "department0001" THEN "Sales"
          WHEN ${department} = "department0002" THEN "Marketing"
          WHEN ${department} = "department0003" THEN "Customer Support"
          WHEN ${department} = "department0004" THEN "R&D"
          WHEN ${department} = "department0005" THEN "G&A"
          ELSE NULL
          END
    ;;
  }

  dimension: office_location {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: office_location_cohort {
    label: "Office Location"
    group_label: "Employee Info"
    type: string
    hidden: no
    sql: CASE
          WHEN ${office_location} = "location0001" THEN "Bay Area"
          WHEN ${office_location} = "location0002" THEN "London"
          WHEN ${office_location} = "location0003" THEN "Austin"
          WHEN ${office_location} = "location0004" THEN "Seattle"
          WHEN ${office_location} = "location0005" THEN "Tokyo"
          ELSE NULL
          END
    ;;
  }


  dimension: user_status {
    label: "Employee Active?"
    group_label: "Employee Info"
    type: string
    sql: ${TABLE}.user_status ;;
  }

  dimension: new_salary {
    label: "Salary"
    group_label: "Salary Info"
    type: number
    sql: ${TABLE}.new_salary ;;
  }

  dimension: displayed_timeframe {
    label_from_parameter: timeframe_selector
    label: "Timeframe"
    group_label: "Timeframe"
    sql:
          CASE
            WHEN '{% parameter timeframe_selector %}' = 'DAY' THEN CAST(${date} as STRING)
            WHEN '{% parameter timeframe_selector %}' = 'WEEK' THEN CAST(DATE_TRUNC(${date}, week) AS STRING)
            WHEN '{% parameter timeframe_selector %}' = 'MONTH' THEN CAST(DATE_TRUNC(${date}, month) AS STRING)
            WHEN '{% parameter timeframe_selector %}' = 'QUARTER' THEN CONCAT(CAST(EXTRACT(YEAR from ${date}) AS STRING), '-Q', CAST(EXTRACT(QUARTER from ${date}) AS STRING))
            WHEN '{% parameter timeframe_selector %}' = 'YEAR' THEN CAST(EXTRACT(YEAR from ${date}) AS STRING)
          END;;
  }

## Calculate the start of the previous timeframe. Uses the same function as timeframe (based on the timeframe selected, we'll date_trunc to a different date format),
## but, we'll throw in a date_sub in the middle. We're subtracting the date interval from the date_trunc to generate the previous timeframe. Doing the inverse
## for the next timeframe

  # dimension: prev_timeframe {
  #   hidden: yes
  #   type: date
  #   datatype: timestamp
  #   sql: TIMESTAMP(DATE_TRUNC(
  #                 DATE_SUB(${date}, INTERVAL 1 {% parameter timeframe_selector %})
  #                 , {% parameter timeframe_selector %}
  #                 )) ;;
  # }

  # dimension: next_timeframe {
  #   hidden: yes
  #   type: date
  #   datatype: timestamp
  #   sql: TIMESTAMP(DATE_TRUNC(
  #                 DATE_ADD(${date}, INTERVAL 1 {% parameter timeframe_selector %})
  #                 , {% parameter timeframe_selector %}
  #                 )) ;;
  # }

  measure: count {
    hidden: yes
    type: count_distinct
    sql: ${employee_id}||${salary_change_date} ;;
    drill_fields: []
  }

  measure: count_raise_in_period {
    label: "Number of Employees who got Raises"
    group_label: "Salary Info"
    type: count_distinct
    sql: case when ${raise_in_period} = true then ${employee_id} else null end ;;
  }

  measure: average_salary {
    label: "Average Salary in Period"
    group_label: "Salary Info"
    type: average
    value_format_name: usd_0
    sql: CASE WHEN ${timeframe} >= ${departure_date} THEN NULL ELSE ${new_salary} END ;;
    sql_distinct_key: ${employee_id}||${salary_change_date} ;;
    filters: [new_salary: "NOT NULL"]
  }

  measure: max_total_salary {
    label: "Max Salary in Period"
    group_label: "Salary Info"
    type: max
    value_format_name: usd_0
    hidden: no
    sql: CASE WHEN ${timeframe} >= ${departure_date} THEN NULL ELSE ${new_salary} END ;;
    sql_distinct_key: ${employee_id}||${salary_change_date} ;;
    filters: [new_salary: "NOT NULL"]
  }

  measure: min_total_salary {
    label: "Min Salary in Period"
    group_label: "Salary Info"
    type: min
    value_format_name: usd_0
    hidden: no
    sql: CASE WHEN ${timeframe} >= ${departure_date} THEN NULL ELSE ${new_salary} END ;;
    sql_distinct_key: ${employee_id}||${salary_change_date} ;;
    filters: [new_salary: "NOT NULL"]
  }

  measure: average_difference_between_salaries {
    type: median
    sql: ${difference_between_salary} ;;
    label: "Average Salary Increase"
    group_label: "Salary Info"
  }

  measure: average_difference_between_salary_change_dates {
    type: median
    sql: ${difference_between_salary_dates} ;;
    label: "Average Time to Change Salary"
    group_label: "Salary Info"
  }

 }
