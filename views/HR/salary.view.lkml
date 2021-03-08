view: salary {
  derived_table: {
    sql_trigger_value: select true ;;
    sql:
    select
      s.*
    from `looker-private-demo.hr_recruiting.salary` as s
    ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: employee_id {
    type: string
    sql: ${TABLE}.employee_id ;;
    primary_key: yes
  }

  dimension: salary {
    type: number
    hidden: yes
    sql: ${TABLE}.salary ;;
  }

  dimension_group: salary_change {
    group_label: "Salary Info"
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.salary_change_date ;;
  }



}
