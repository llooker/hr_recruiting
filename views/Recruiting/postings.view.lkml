view: postings {
  sql_table_name: `looker-private-demo.hr_recruiting.postings`;;
  drill_fields: [posting_id]

  dimension: posting_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.posting_id ;;
  }

  dimension: department_id {
    hidden: yes
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension: posting_location {
    hidden: yes
    type: string
    sql: ${TABLE}.posting_location_id ;;
  }

  dimension: posting_title {
    type: string
    sql: ${TABLE}.posting_title ;;
    link: {
      label: "Share Posting on LinkedIn"
      url: "https://www.linkedin.com/jobs/search/"
      icon_url: "https://www.iconfinder.com/data/icons/logotypes/32/square-linkedin-512.png"
    }
    link: {
      label: "View Posting Details"
      url: "https://www.linkedin.com/jobs/search/"
      icon_url: "https://i.pinimg.com/originals/80/2d/39/802d39e39e5718f6c3b52bcb073332e7.png"
    }
  }

  dimension: team_id {
    hidden: yes
    type: string
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [posting_id, applications.count]
  }
}
