view: applications {
  sql_table_name: `looker-private-demo.hr_recruiting.applications`
    ;;
  drill_fields: [application_id]

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.c ;;
  }

  dimension: application_archived {
    hidden: yes
    type: string
    sql: ${TABLE}.application_archived ;;
  }

  dimension_group: archived {
    hidden: yes
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
    sql: ${TABLE}.application_archived_at ;;
  }

  dimension_group: applied {
    hidden: no
    label: "Created"
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      raw,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.application_created;;
  }

  dimension: is_archived {
    label: "Archived?"
    group_label: "Archive Information"
    type: yesno
    sql: ${TABLE}.application_archived ;;
  }

  dimension: archived_reason {
    hidden: yes
    type: string
    sql: ${TABLE}.application_archive_reason_id ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: created_date {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_created ;;
  }

  dimension_group: last_interaction {
    type: time
    datatype: date
    hidden: yes
    label: "Last Interaction Date"
    group_label: "Applicant Information"
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      raw,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.last_interaction_at ;;
  }

  dimension: time_since_last_interaction {
    hidden: yes
    label: "Days since Last Interaction"
    description: "This measure counts the days since the last interaction with the candidate."
    type: number
    sql: DATE_DIFF( CAST('2020-03-31' AS DATE),${last_interaction_date},  day ) ;;
  }

  dimension: inactive_application {
    label: "Application Status"
    group_label: "Application Status"
    hidden: no
    description: "Is the application active or not?"
    type: string
    sql: CASE
          WHEN ${is_archived} = FALSE and ${time_since_last_interaction} >= 22 THEN "Inactive"
          WHEN ${is_archived} = FALSE and ${time_since_last_interaction} <= 21 THEN "Active"
          ELSE "Archived"
         END;;
  }

  dimension_group: offer {
    type: time
    datatype: date
    hidden: no
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      raw,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.offer_date ;;
  }

  dimension_group: onsite {
    hidden: no
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      raw,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.onsite_date ;;
  }

  dimension: posting_id {
    type: string
    hidden: yes
    sql: ${TABLE}.posting_id ;;
  }

  dimension_group: screen {
    hidden: no
    type: time
    datatype: date
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      raw,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.screen_date ;;
  }

  dimension: stage_id {
    hidden: yes
    type: string
    sql: ${TABLE}.stage_id ;;
  }

  measure: number_of_applicants {
    type: count
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [detail*
    ]
  }
}
