view: users {
  sql_table_name: `looker-private-demo.hr_recruiting.users`;;
  drill_fields: [user_id]

  dimension: user_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: employee_id {
    type: string
    hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id, employees.employee_name, employees.employee_id]
  }
}
