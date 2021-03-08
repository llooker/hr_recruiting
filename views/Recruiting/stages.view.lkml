view: stages {
  sql_table_name: `looker-private-demo.hr_recruiting.stages`;;
  drill_fields: [stage_id]

  dimension: stage_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.stage_id ;;
  }

  dimension: stage_name {
    label: "Stage Name"
    type: string
    hidden: no
    group_label: "Stages"
    sql: ${TABLE}.stage_name ;;
  }

  dimension: stage_name_clean {
    type: string
    label: "Stage Name (Ordered)"
    group_label: "Stages"
    sql: CASE
          WHEN ${stage_name} = "New Applicant" THEN "01. New Applicant"
          WHEN ${stage_name} = "Phone Screen" THEN "02. Screen"
          WHEN ${stage_name} = "On-Site Interview" THEN "03. On-Site Interview"
          WHEN ${stage_name} = "Offer" THEN "04. Offer"
          ELSE NULL END
          ;;
  }

}
