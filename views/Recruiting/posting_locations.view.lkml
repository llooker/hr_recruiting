view: posting_locations {
  sql_table_name: `looker-private-demo.hr_recruiting.posting_locations`;;
  drill_fields: [posting_location_id]

  dimension: posting_location_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.posting_location_id ;;
  }

  dimension: posting_country {
    label: "Country"
    group_label: "Location"
    type: string
    sql: ${TABLE}.posting_country ;;
    drill_fields: [posting_location]
  }

  dimension: posting_location {
    label: "Location"
    group_label: "Location"
    type: string
    sql: ${TABLE}.posting_location ;;
  }

  dimension: posting_state {
    label: "State"
    group_label: "Location"
    type: string
    sql: ${TABLE}.posting_state ;;
  }

}
