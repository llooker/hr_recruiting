view: feedback {
  sql_table_name: `looker-private-demo.hr_recruiting.feedback` ;;
  drill_fields: [feedback_id]

  dimension: feedback_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.feedback_id ;;
  }

  dimension: application_id {
    hidden: yes
    type: string
    sql: ${TABLE}.application_id ;;
  }

  dimension: candidate_id {
    type: string
    hidden: yes
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: feedback_score {
    group_label: "Feedback"
    hidden: no
    type: string
    sql: CAST(${TABLE}.feedback_score as STRING) ;;
  }

  dimension: interview_id {
    type: string
    hidden: yes
    sql: ${TABLE}.interview_id ;;
  }

  dimension: interviewer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.interviewer_id ;;
  }

  measure: feedback_count {
    type: count
    group_label: "Feedback Scores"
    drill_fields: [feedback_id, candidates.candidate_id_hash, candidates.candidate_name, interviews.interview_id, applications.application_id]
  }


  measure: avg_feedback_score {
    label: "Average Feedback Score"
    group_label: "Feedback Scores"
    value_format_name: decimal_2
    type: average
    sql: CAST(${feedback_score} as NUMERIC) ;;
    drill_fields: [interviews.interviewer_name,interviews.interview_type,feedback_score]
  }

  measure: fours_given {
    label: "Strong Hires Given"
    group_label: "Number of Scores Given"
    value_format_name: decimal_0
    type: count
    filters: [feedback_score: "4"]
  }

  measure: pct_strong_hire {
    label: "% Strong Hire Given"
    group_label: "Percentage of Scores Given"
    value_format_name: percent_1
    type: number
    sql: 1.0*${fours_given} / nullif(${feedback_count}, 0) ;;
  }

  measure: threes_given {
    label: "Hires Given"
    group_label: "Number of Scores Given"
    value_format_name: decimal_0
    type: count
    filters: [feedback_score: "3"]
  }

  measure: pct_hire {
    label: "% Hire Given"
    group_label: "Percentage of Scores Given"
    value_format_name: percent_1
    type: number
    sql: 1.0*${threes_given} / nullif(${feedback_count}, 0) ;;
  }

  measure: twos_given {
    label: "No Hires Given"
    group_label: "Number of Scores Given"
    value_format_name: decimal_0
    type: count
    filters: [feedback_score: "2"]
  }

  measure: pct_no_hire {
    label: "% No Hire Given"
    group_label: "Percentage of Scores Given"
    value_format_name: percent_1
    type: number
    sql: 1.0*${twos_given} / nullif(${feedback_count}, 0) ;;
  }

  measure: ones_given {
    label: "Strong No Hires Given"
    group_label: "Number of Scores Given"
    value_format_name: decimal_0
    type: count
    filters: [feedback_score: "1"]
  }

  measure: pct_strong_no_hire {
    label: "% Strong No Hire Given"
    group_label: "Percentage of Scores Given"
    value_format_name: percent_1
    type: number
    sql: 1.0*${ones_given} / nullif(${feedback_count}, 0) ;;
  }
}
