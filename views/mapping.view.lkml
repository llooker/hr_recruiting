view: mapping {
  sql_table_name: `looker-private-demo.hr_recruiting.mapping` ;;

  dimension: candidate_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: employee_id {
    hidden: yes
    type: string
    sql: ${TABLE}.employee_id ;;
  }


}
