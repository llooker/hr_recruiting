view: feedback_score {
  sql_table_name: `looker-private-demo.hr_recruiting.feedback_score` ;;

  dimension: feedback_score {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.feedback_score;;
  }

  dimension: feedback_verdict {
    group_label: "Feedback"
    type: string
    sql: ${TABLE}.feedback_verdict ;;
  }

  dimension: feedback_verdict_clean {
    label: "Feedback Verdict Labeled"
    group_label: "Feedback"
    type: string
    sql: CASE
          WHEN ${feedback_verdict} = "Strong Hire" THEN "4. Strong Hire"
          WHEN ${feedback_verdict} = "Hire" THEN "3. Hire"
          WHEN ${feedback_verdict} = "No Hire" THEN "2. No Hire"
          WHEN ${feedback_verdict} = "Strong No" THEN "1. Strong No Hire"
          ELSE NULL
          END
          ;;
  }


}
