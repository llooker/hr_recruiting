view: application_funnel {
  derived_table: {
    sql_trigger_value: select max(application_created) from `looker-private-demo.hr_recruiting.applications`  ;;
    sql:
    --each candidate's application date
    select
      application_created as event_date
      , 'applied' as event_type
      , c as application_id
      , candidate_id as candidate_id
      , posting_id as posting_id
      , application_archive_reason_id as archive_reason_id
      , stage_id as stage_id
      , application_created as application_created
      , screen_date as screen_date
      , onsite_date as onsite_date
      , offer_date as offer_date
      , CASE WHEN application_archive_reason_id = 'archive_reason0004' THEN application_archived_at ELSE NULL END AS hired_date
    from `looker-private-demo.hr_recruiting.applications`
    where application_created is not null

    --each candidate's screen date
    union all
    select
      screen_date as event_date
      , 'phone_screen' as event_type
      , c as application_id
      , candidate_id as candidate_id
      , posting_id as posting_id
      , application_archive_reason_id as archive_reason_id
      , stage_id as stage_id
      , application_created as application_created
      , screen_date as screen_date
      , onsite_date as onsite_date
      , offer_date as offer_date
      , CASE WHEN application_archive_reason_id = 'archive_reason0004' THEN application_archived_at ELSE NULL END AS hired_date
    from `looker-private-demo.hr_recruiting.applications`
    where screen_date is not null

    --each candidate's onsite date
    union all
    select
      onsite_date as event_date
      , 'onsite' as event_type
      , c as application_id
      , candidate_id as candidate_id
      , posting_id as posting_id
      , application_archive_reason_id as archive_reason_id
      , stage_id as stage_id
      , application_created as application_created
      , screen_date as screen_date
      , onsite_date as onsite_date
      , offer_date as offer_date
      , CASE WHEN application_archive_reason_id = 'archive_reason0004' THEN application_archived_at ELSE NULL END AS hired_date
    from `looker-private-demo.hr_recruiting.applications`
    where onsite_date is not null

    --each candidate's offer date
    union all
    select
      offer_date as event_date
      , 'offer' as event_type
      , c as application_id
      , candidate_id as candidate_id
      , posting_id as posting_id
      , application_archive_reason_id as archive_reason_id
      , stage_id as stage_id
      , application_created as application_created
      , screen_date as screen_date
      , onsite_date as onsite_date
      , offer_date as offer_date
      , CASE WHEN application_archive_reason_id = 'archive_reason0004' THEN application_archived_at ELSE NULL END AS hired_date
    from `looker-private-demo.hr_recruiting.applications`
    where offer_date is not null

    --each candidate's hired date
    union all
    select
      application_archived_at as event_date
      , 'hired' as event_type
      , c as application_id
      , candidate_id as candidate_id
      , posting_id as posting_id
      , application_archive_reason_id as archive_reason_id
      , stage_id as stage_id
      , application_created as application_created
      , screen_date as screen_date
      , onsite_date as onsite_date
      , offer_date as offer_date
      , CASE WHEN application_archive_reason_id = 'archive_reason0004' THEN application_archived_at ELSE NULL END AS hired_date
    from `looker-private-demo.hr_recruiting.applications`
    where application_archived_at is not null
      and application_archive_reason_id = 'archive_reason0004'
    ;;
  }

  dimension_group: event {
    type: time
    datatype: date
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.event_date ;;
  }

  dimension: application_created {
    type: date_raw
    sql: ${TABLE}.application_created
            ;;
  }

  dimension: screen_created {
    type: date_raw
    sql: ${TABLE}.screen_date ;;
  }

  dimension: onsite_created {
    type: date_raw
    sql: ${TABLE}.onsite_date ;;
  }

  dimension: offer_created {
    type: date_raw
    sql: ${TABLE}.offer_date
            ;;
  }

  dimension: hired_created {
    type: date_raw
    sql: ${TABLE}.hired_date
            ;;
  }

  dimension: event_type {
    hidden: yes
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_id ;;
  }

  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.application_id ;;
  }

  dimension: posting_id {
    hidden: yes
    type: string
    sql: ${TABLE}.posting_id ;;
  }

  dimension: stage_id {
    hidden: yes
    type: string
    sql: ${TABLE}.stage_id ;;
  }

  dimension: archive_reason_id {
    hidden: yes
    type: string
    sql: ${TABLE}.archive_reason_id ;;
  }

  measure: count {
    type: count
    label: "00. Total Applicants"
    group_label: "Counts"
    drill_fields: [candidate_info*]
  }

  measure: applications_in_period {
    type: count
    label: "01. Count of New Applicants"
    group_label: "Counts"
    filters: [event_type: "applied"]
    drill_fields: [candidate_info*]
  }

  measure: phone_screens_in_period {
    type: count
    label: "02. Count of Screens"
    group_label: "Counts"
    filters: [event_type: "phone_screen"]
    drill_fields: [candidate_info*]
  }

  measure: onsites_in_period {
    type: count
    label: "03. Count of On-Sites"
    group_label: "Counts"
    filters: [event_type: "onsite"]
    drill_fields: [candidate_info*]
  }

  measure: offers_in_period {
    type: count
    label: "04. Count of Offers"
    group_label: "Counts"
    filters: [event_type: "offer"]
    drill_fields: [candidate_info*]
  }

  measure: hires_in_period {
    type: count
    label: "05. Count of Hires"
    group_label: "Counts"
    filters: [event_type: "hired"]
    drill_fields: [candidate_info*]
  }

  # current stages
  measure: current_applications_in_period {
    type: count
    label: "01. Count of Current New Applicants"
    group_label: "Current Counts"
    filters: [event_type: "applied"]
    filters: [stage_id: "stage0001"]
    drill_fields: [candidate_info*]
  }

  measure: current_phone_screens_in_period {
    type: count
    label: "02. Count of Current Screens"
    group_label: "Current Counts"
    filters: [event_type: "phone_screen"]
    filters: [stage_id: "stage0002"]
    drill_fields: [candidate_info*]
  }

  measure: current_onsites_in_period {
    type: count
    label: "03. Count of Current On-Sites"
    group_label: "Current Counts"
    filters: [event_type: "onsite"]
    filters: [stage_id: "stage0003"]
    drill_fields: [candidate_info*]
  }

  measure: current_offers_in_period {
    type: count
    label: "04. Count of Current Offers"
    group_label: "Current Counts"
    filters: [event_type: "offer"]
    filters: [stage_id: "stage0004"]
    drill_fields: [candidate_info*]
  }

  # end current stages

  measure: applicant_to_phone_screen {
    type: number
    value_format_name: percent_0
    label: "01. New Applicant to Screen"
    group_label: "Conversion Rates"
    sql: ${phone_screens_in_period}/NULLIF(${applications_in_period},0) ;;
  }

  measure: phone_screen_to_onsite {
    type: number
    value_format_name: percent_0
    label: "02. Screen to On-Site"
    group_label: "Conversion Rates"
    sql: ${onsites_in_period}/NULLIF(${phone_screens_in_period},0) ;;
  }

  measure: onsite_to_offer {
    type: number
    value_format_name: percent_0
    label: "03. On-Site to Offer"
    group_label: "Conversion Rates"
    sql: ${offers_in_period}/NULLIF(${onsites_in_period},0) ;;
  }

  measure: offer_to_hired {
    type: number
    value_format_name: percent_0
    label: "04. Offer to Hired"
    group_label: "Conversion Rates"
    sql: ${hires_in_period}/NULLIF(${offers_in_period},0) ;;
  }

  measure: days_applicant_to_phone_screen {
    type: median
    value_format_name: decimal_0
    label: "01. Days From New Applicant to Screen"
    group_label: "Pipeline Speed"
    sql: DATE_DIFF(${screen_created},${application_created},DAY) ;;
  }

  measure: days_phone_screen_to_onsite {
    type: median
    value_format_name: decimal_0
    label: "02. Days From Screen to On-Site"
    group_label: "Pipeline Speed"
    sql: DATE_DIFF(${onsite_created},${screen_created},DAY) ;;
  }

  measure: days_onsite_to_offer {
    type: median
    value_format_name: decimal_0
    label: "03. Days From On-Site to Offer"
    group_label: "Pipeline Speed"
    sql: DATE_DIFF(${offer_created},${onsite_created},DAY) ;;
  }

  measure: days_offer_hired {
    type: median
    value_format_name: decimal_0
    label: "04. Days From Offer to Hired"
    group_label: "Pipeline Speed"
    sql: DATE_DIFF(${hired_created},${offer_created},DAY) ;;
  }

  set: candidate_info {
    fields: [candidates.candidate_name,stages.stage_name]
  }

}
