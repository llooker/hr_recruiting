view: employees {
  derived_table: {
    sql_trigger_value: select true ;;
    sql:

    select
      e.*
      , l1.employee_name as l1_name
      , l2.employee_name as l2_name
      , reports_to.employee_name as reports_to_name
    from `looker-private-demo.hr_recruiting.employees` as e
    left join `looker-private-demo.hr_recruiting.employees` as l1 on (e.l1 = l1.employee_id)
    left join `looker-private-demo.hr_recruiting.employees` as l2 on (e.l2 = l2.employee_id)
    left join `looker-private-demo.hr_recruiting.employees` as reports_to on (e.reports_to = reports_to.employee_id)
    ;;
  }
  drill_fields: [employee_name]

  dimension: employee_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: manager_name {
    label: "Manager"
    type: string
    sql: ${reports_to_name} ;;
    action: {
      label: "Email {{ value }}"
      url: "https:mailto:"
      form_param: {
        name: "title"
        type: textarea
        label: "Email Body"
        required: yes
        default: "{% if employees.employee_name._in_query %}
        Hi {{ employees.reports_to_name._value }} , do you have a few minutes this week to talk about {{ employees.employee_name._value }}?
        {% else %}
        Your message here...
        {% endif %}"
      }
    }
  }

  dimension: ethnicity {
    group_label: "DEI"
    group_item_label: "Ethnicity"
    type: string
    sql: ${TABLE}.ethnicity;;
  }

  dimension: currency {
    group_label: "Salary"
    group_item_label: "Currency"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: current_salary {
    group_label: "Salary"
    group_item_label: "Current Salary"
    type: number
    sql: CAST(${TABLE}.current_salary AS FLOAT64) ;;
  }

  dimension: department {
    hidden: yes
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: reports_to_name {
    type: string
    sql: ${TABLE}.reports_to_name ;;
  }

  dimension: team {
    hidden: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension_group: departure {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.departure_date as TIMESTAMP) ;;
  }

  dimension: is_terminated {
    hidden: yes
    type: yesno
    sql: ${departure_date} is not null ;;
  }

## if funnel, do x
  dimension: employee_name {
    group_label: "
    {% if _view._name == 'applications' %}
      Candidate Owner Name
    {% else %}
      Employee Name
    {% endif %}"
    label: "
    {% if _view._name == 'applications' %}
      Candidate Owner Name
    {% else %}
      Employee Name
    {% endif %}"
    type: string
    sql: ${TABLE}.employee_name ;;
    link: {
      label: "Workday Profile"
      url: "go/workday"
      icon_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.rYbMYWXVdaiqTiD3xSfe5wHaHa%26pid%3DApi&f=1"
    }
  }

  dimension: gender {
    group_label: "DEI"
    hidden: no
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: is_people_manager {
    group_label: "Management Chain"
    group_item_label: "Is People Manager?"
    type: string
    sql: ${TABLE}.is_people_manager ;;
  }

  dimension: job_title {
    group_label: "Job Title"
    label: "Employee Job Title"
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: l1 {
    group_label: "Management Chain"
    type: string
    sql: ${TABLE}.l1 ;;
  }

  dimension: l2 {
    group_label: "Management Chain"
    type: string
    sql: ${TABLE}.l2 ;;
  }

  dimension: most_recent_rating {
    group_label: "Performance"
    group_item_label: "Most Recent Performance Rating"
    type: string
    sql: ${TABLE}.most_recent_performance_review ;;
  }

  dimension: office_location {
    hidden: yes
    type: string
    sql: ${TABLE}.office_location ;;
  }

  dimension: quota_attainment {
    group_label: "Performance"
    group_item_label: "Most Recent Quota Attainment"
    type: number
    value_format_name: percent_0
    sql: CAST(${TABLE}.quota_attainment as NUMERIC) ;;
  }

  dimension: quota_attainment_cohort {
    group_label: "Performance"
    group_item_label: "Most Recent Quota Attainment Cohort"
    type: string
    sql: CASE
          WHEN ${quota_attainment} > 1 THEN "1. > 100%"
          WHEN ${quota_attainment} >= .75 THEN "2. 75% - 100%"
          WHEN ${quota_attainment} < .75 THEN "3. < 75%"
          ELSE NULL END
          ;;
  }

  dimension: reports_to {
    group_label: "Management Chain"
    type: string
    sql: ${TABLE}.reports_to ;;
  }

  dimension_group: start {
    type: time
    datatype: timestamp
    timeframes: [
      raw
      , date
      , week
      , month
      , quarter
      , year
      , day_of_week
    ]
    sql: CAST(${TABLE}.start_date as TIMESTAMP) ;;
  }

  dimension: employee_tenure {
    hidden: no
    label: "Employee Tenure (Months)"
    group_label: "Employee Tenure"
    sql:
      CASE
        WHEN ${departure_date} is not null
          then DATE_DIFF(${departure_date}, ${start_date}, month)
        ELSE DATE_DIFF(current_date, ${start_date}, month)
      END ;;
  }

  dimension: employee_tenure_bucketed {
    type: tier
    tiers: [6, 12, 18, 24, 36]
    style: integer
    hidden: no
    label: "Employee Tenure Bucketed (Months)"
    group_label: "Employee Tenure"
    sql: ${employee_tenure} ;;
  }

  dimension: team_id {
    hidden: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: user_status {
    group_label: "Employee Status"
    label: "Employee Status"
    type: string
    sql: ${TABLE}.user_status ;;
  }

  measure: avg_quota_attainment {
    type: average
    group_label: "Quota"
    group_item_label: "00. Avg. Attainment"
    value_format_name: percent_1
    sql: ${quota_attainment} ;;
    filters: [quota_attainment: "NOT NULL"]
    drill_fields: [dei_employee_info*]
  }

  measure: stddev_quota_attainment {
    type: number
    group_label: "Quota"
    group_item_label: "Std Dev. of Attainment"
    value_format_name: percent_1
    sql: STDEV( case when ${quota_attainment} is not null then ${quota_attainment} else null end) ;;
  }

  measure: max_quota_attainment {
    type: max
    group_label: "Quota"
    group_item_label: "Max Attainment"
    value_format_name: percent_1
    sql: ${quota_attainment} ;;
    filters: [quota_attainment: "NOT NULL"]
  }

  measure: min_quota_attainment {
    type: min
    group_label: "Quota"
    group_item_label: "Minimum Attainment"
    value_format_name: percent_1
    sql: ${quota_attainment} ;;
    filters: [quota_attainment: "NOT NULL"]
  }

  measure: avg_salary {
    group_label: "Salary"
    label: "Average Salary"
    hidden: yes
    type: average
    value_format_name: usd
    sql: ${current_salary} ;;
    filters: [current_salary: "NOT NULL"]
  }

  measure: total_salary {
    group_label: "Salary"
    label: "Total Salary"
    hidden: yes
    type: sum
    value_format_name: usd
    sql: ${current_salary} ;;
    filters: [current_salary: "NOT NULL"]
  }

  measure: count {
    hidden: yes
    label: "Employee Count"
    type: count
    drill_fields: [employee_name]
  }

  dimension: term_reason {
    label: "Termination Reason"
    group_label: "Termination Reason"
    type: string
    sql: ${TABLE}.term_reason ;;
  }

  measure: starts {
    type: count_distinct
    sql: ${employee_id};;
    filters: [  start_date: "-NULL" ]
    drill_fields: [employee_name,start_date]
  }

  measure: terms {
    type: count_distinct
    sql: ${employee_id};;
    filters: [  departure_date: "-NULL" ]
    drill_fields: [employee_name,departure_date]
  }

  measure: headcount {
    group_label: "Headcount"
    label: "Employee Headcount Running Total"
    sql: ${starts}-${terms};;
    type: running_total
    direction: "column"
    drill_fields: [employee_name]
  }

  measure: headcount2 {
    group_label: "Headcount"
    label: "Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [user_status: "Active"]
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_male {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Male Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [gender: "Male"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_male {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Male Employee Headcount"
    sql: ${headcount_male}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_female {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Female Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [gender: "Female"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_female {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Female Employee Headcount"
    sql: ${headcount_female}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_non_binary {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Non-Binary Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [gender: "Non-Binary"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_non_binary {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Non-Binary Employee Headcount"
    sql: ${headcount_non_binary}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_white {
    group_label: "DEI Headcount"
    hidden: yes
    label: "White+ Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [ethnicity: "White+"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_white {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% White+ Employee Headcount"
    sql: ${headcount_white}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_black {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Black+ Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [ethnicity: "Black+"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_black {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Black+ Employee Headcount"
    sql: ${headcount_black}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_native_american {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Native American+ Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [ethnicity: "Native American+"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_native_american {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Native American+ Employee Headcount"
    sql: ${headcount_native_american}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_hispanic_or_latinx {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Hispanic or Latinx+ Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [ethnicity: "Hispanic or Latinx+"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_hispanic_or_latinx {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Hispanic or Latinx+ Employee Headcount"
    sql: ${headcount_hispanic_or_latinx}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }

  measure: headcount_asian {
    group_label: "DEI Headcount"
    hidden: yes
    label: "Asian+ Employee Headcount"
    sql: ${employee_id} ;;
    type: count_distinct
    filters: [ethnicity: "Asian+"]
    drill_fields: [dei_employee_info*]
  }

  measure: percent_headcount_asian {
    group_label: "DEI Headcount"
    hidden: yes
    label: "% Asian+ Employee Headcount"
    sql: ${headcount_asian}/${headcount2} ;;
    type: number
    value_format_name: percent_1
    drill_fields: [dei_employee_info*]
  }


  set: dei_employee_info {
    fields: [gender,ethnicity,employee_name,manager_name]
  }

}
