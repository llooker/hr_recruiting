view: posting_department_location {
  sql_table_name: `looker-private-demo.hr_recruiting.posting_department_mapping`;;

  dimension: department_id {
    hidden: yes
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: department_name {
    label: "Department"
    group_label: "Department"
    type: string
    sql: ${TABLE}.department_name ;;
  }

  dimension: team_id {
    hidden: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }

  dimension: team_name {
    label: "Team"
    group_label: "Department"
    type: string
    sql: ${TABLE}.team_name ;;
  }

}
