view: interviews {
  derived_table: {
    sql_trigger_value: select true ;;
    sql:
      select
      i.*
      , u.user_id as user_id
      , e.employee_name as employee_name
      from `looker-private-demo.hr_recruiting.interviews` as i
      left join `looker-private-demo.hr_recruiting.users` as u on (u.user_id = i.interviewer_id)
      left join `looker-private-demo.hr_recruiting.employees` as e on (e.employee_id = u.employee_id)
      ;;
  }
  drill_fields: [interview_id]

  dimension: interview_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.interview_id ;;
  }

  dimension: application_id {
    hidden: yes
    type: string
    sql: ${TABLE}.application_id ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_id ;;
  }

  dimension_group: interview {
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week
    ]
    sql: ${TABLE}.interview_timestamp ;;
  }

  dimension: interview_type {
    hidden: no
    type: string
    sql: ${TABLE}.interview_type ;;
  }

  dimension: interviewer_id {
    hidden: no
    type: string
    sql: ${TABLE}.interviewer_id ;;
  }

  dimension: interviewer_name {
    hidden: no
    label: "Interviewer Name"
    type: string
    sql: ${TABLE}.employee_name ;;
  }

}
