view: archive_reason {
  sql_table_name: `looker-private-demo.hr_recruiting.archive_reasons` ;;
  drill_fields: [application_archive_reason_id]

  dimension: application_archive_reason_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.application_archive_reason_id ;;
  }

  dimension: application_archive_reason {
    type: string
    label: "Archive Reason"
    group_label: "Archive Information"
    sql: ${TABLE}.application_archive_reason ;;
  }

}
