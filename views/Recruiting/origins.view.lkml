view: origins {
  sql_table_name:`looker-private-demo.hr_recruiting.origin` ;;
  drill_fields: [origin_id]

  dimension: origin_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.origin_id ;;
  }

  dimension: origin_name {
    label: "Origin"
    group_label: "Origin"
    type: string
    sql: ${TABLE}.origin_name ;;
  }

}
