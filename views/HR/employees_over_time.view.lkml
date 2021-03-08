include: "employees.view.lkml"
view: employees_over_time {
  extends: [employees]

  derived_table: {
    sql:

        WITH dt as (
          SELECT
            day
          FROM UNNEST(
              GENERATE_DATE_ARRAY(DATE('2012-01-01'), CURRENT_DATE(), INTERVAL 1 DAY)
              ) day
        )

      SELECT
        dt.day as date
        , e.*

      FROM ${employees.SQL_TABLE_NAME} as e , dt

      WHERE dt.day >= "2017-01-01" ;;
  }

  dimension: date {
    hidden: yes
    label: "Date Filter"
    type: date
    sql: TIMESTAMP(${TABLE}.date) ;;
  }

  filter: filter_on_date {
    label: "Date Range Selector"
    type: date
    sql: {% condition filter_on_date %} ${date} {% endcondition %} ;;
  }

  parameter: timeframe_selector {
    type: unquoted
    default_value: "Day"
    allowed_value: { label: "Day" value: "DAY" }
    allowed_value: { label: "Week" value: "WEEK" }
    allowed_value: { label: "Month" value: "MONTH" }
    allowed_value: { label: "Quarter" value: "QUARTER" }
    allowed_value: { label: "Year" value: "YEAR" }
  }

  dimension: timeframe {
    hidden: yes
    label_from_parameter: timeframe_selector
    type: string
    sql: DATE_TRUNC(${date}, {% parameter timeframe_selector %} ) ;;
  }

  dimension: displayed_timeframe {
    label_from_parameter: timeframe_selector
    label: "Timeframe"
    group_label: "Timeframe"
    sql:
          CASE
            WHEN '{% parameter timeframe_selector %}' = 'DAY' THEN CAST(${date} as STRING)
            WHEN '{% parameter timeframe_selector %}' = 'WEEK' THEN CAST(DATE_TRUNC(${date}, week) AS STRING)
            WHEN '{% parameter timeframe_selector %}' = 'MONTH' THEN CAST(DATE_TRUNC(${date}, month) AS STRING)
            WHEN '{% parameter timeframe_selector %}' = 'QUARTER' THEN CONCAT(CAST(EXTRACT(YEAR from ${date}) AS STRING), '-Q', CAST(EXTRACT(QUARTER from ${date}) AS STRING))
            WHEN '{% parameter timeframe_selector %}' = 'YEAR' THEN CAST(EXTRACT(YEAR from ${date}) AS STRING)
          END;;
  }

## Calculate the start of the previous timeframe. Uses the same function as timeframe (based on the timeframe selected, we'll date_trunc to a different date format),
## but, we'll throw in a date_sub in the middle. We're subtracting the date interval from the date_trunc to generate the previous timeframe. Doing the inverse
## for the next timeframe

  dimension: prev_timeframe {
    hidden: yes
    type: date
    datatype: timestamp
    sql: TIMESTAMP(DATE_TRUNC(
                  DATE_SUB(${date}, INTERVAL 1 {% parameter timeframe_selector %})
                  , {% parameter timeframe_selector %}
                  )) ;;
  }

  dimension: next_timeframe {
    hidden: yes
    type: date
    datatype: timestamp
    sql: TIMESTAMP(DATE_TRUNC(
                  DATE_ADD(${date}, INTERVAL 1 {% parameter timeframe_selector %})
                  , {% parameter timeframe_selector %}
                  )) ;;
  }

  dimension: employee_tenure {
    hidden: no
    label: "Employee Tenure (Months)"
    group_label: "Employee Tenure"
    sql:
      CASE
        WHEN ${start_date} <= ${next_timeframe} AND ${departure_date} <= ${next_timeframe} THEN DATE_DIFF(${departure_date}, ${start_date}, month)
        WHEN ${start_date} <= ${next_timeframe} THEN DATE_DIFF(${next_timeframe}, ${start_date}, month)
        ELSE NULL
      END ;;
  }

  measure: avg_employee_tenure {
    label: "Avg. Employee Tenure (Mo.)"
    group_label: "Employee Tenure"
    type: average
    value_format_name: decimal_2
    sql: ${employee_tenure} ;;
  }

  dimension: employee_tenure_bucketed {
    type: tier
    tiers: [6, 12, 18, 24, 36]
    style: integer
    hidden: no
    label: "Employee Tenure Bucketed (Months)"
    group_label: "Employee Tenure"
    sql: ${employee_tenure} ;;
  }

  measure: terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##

    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
  }

  # hide the starts/terms/count fields from the employees view
  measure: starts { hidden: yes }
  measure: terms { hidden: yes }
  measure: count {  hidden: yes }
  measure: headcount {  hidden: yes }

  measure: hires_lte_date {

    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
  }

  measure: hires_in_period {

    label: "Starts to Date in Period"
    group_item_label: "Starts to Date"
    group_label: "Starts"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql: CASE WHEN ${start_date} <= ${date} AND ${start_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: terms_in_period {
    label: "Terms in Period"
    group_label: "Terms"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql: CASE WHEN ${departure_date} <= ${date} AND ${departure_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: voluntary_terms_in_period {
    label: "Voluntary Terms in Period"
    group_label: "Terms"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql: CASE WHEN ${term_reason} = 'Voluntary' AND ${departure_date} <= ${date} AND ${departure_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: involuntary_terms_in_period {
    label: "Involuntary Terms in Period"
    group_label: "Terms"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql: CASE WHEN ${term_reason} = 'Voluntary' AND ${departure_date} <= ${date} AND ${departure_date} >= ${timeframe} THEN ${employee_id} END ;;
  }

  measure: early_terms {
    label: "Early Terms"
    group_label: "Terms"
    description: "Employee with departure date <= 365 days from start date"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql:
          case
            when ${departure_date} is not null
            AND date_diff(${departure_date},  ${start_date}, DAY) <= 365
              THEN ${employee_id}
          end ;;
  }

  dimension: department_name_cohort {
    type: string
    hidden: yes
    sql: CASE
          WHEN ${department} = "department0001" THEN "Sales"
          WHEN ${department} = "department0002" THEN "Marketing"
          WHEN ${department} = "department0003" THEN "Customer Support"
          WHEN ${department} = "department0004" THEN "R&D"
          WHEN ${department} = "department0005" THEN "G&A"
          ELSE NULL
          END
    ;;
  }

  measure: early_terms_in_period {
    label: "Early Terms in Period"
    group_label: "Terms"
    description: "Employee with departure date <= 365 days from start date"
    type: count_distinct
    drill_fields: [employee_name, l2, start_date, departure_date]
    sql:
          case
            when ${departure_date} is not null
            AND date_diff(${departure_date},  ${start_date}, DAY) <= 365
            AND ${departure_date} <= ${date} AND ${departure_date} >= ${timeframe}
              THEN ${employee_id}
          end ;;
  }

  measure: avg_salary_over_time {
    group_label: "Salary"
    label: "Average Salary"
    hidden: no
    type: average
    value_format_name: usd
    sql: ${current_salary} ;;
    filters: [current_salary: "NOT NULL"]
    drill_fields: [headcount_salary*]
  }

  measure: total_salary_over_time {
    group_label: "Salary"
    label: "Total Salary"
    hidden: no
    type: sum
    value_format_name: usd
    sql: ${current_salary} ;;
    filters: [current_salary: "NOT NULL"]
    drill_fields: [headcount_salary*]
  }

  measure: hc_at_eop {
    label: "Headcount to Date in Period"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
    drill_fields: [headcount*]
  }

  measure: hc_at_eop_quota {
    label: "Headcount to Date in Period (Quota Drill)"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
    drill_fields: [headcount_quota*]
  }

  measure: hc_at_eop_performance {
    label: "Headcount to Date in Period (Performance Drill)"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
    drill_fields: [headcount_performance*]
  }

  measure: hc_at_eop_salary {
    label: "Headcount to Date in Period (Salary Drill)"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
    drill_fields: [headcount_salary*]
  }

  measure: hc_at_eop_tenure {
    label: "Headcount to Date in Period (Tenure Drill)"
    group_label: "Headcount"
    type: number
    sql: ${hires_lte_date} - ${terms_lte_date} ;;
    drill_fields: [headcount_tenure*]
  }

  measure: hc_at_eop_gender {
    label: "Female Headcount to Date in Period (Gender Drill)"
    group_label: "Headcount"
    type: number
    sql: ${hc_at_eop} ;;
    drill_fields: [headcount_gender*]
  }

  ## Gender Representation Measures

  ## female

  measure: female_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Female"
    }
  }

  measure: female_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Female"
    }
  }

  measure: female_hc_at_eop {
  #  required_fields: [timeframe]
    label: "1. Female Headcount"
    description: "Female headcount to date in period."
    group_label: "Gender"
    type: number
    sql: ${female_hires_lte_date} - ${female_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_female_hc {
  #  required_fields: [timeframe]
    label: "1. Female Representation"
    group_label: "Gender"
    value_format_name: percent_1
    type: number
    sql: (${female_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## male

  measure: male_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Male"
    }
  }

  measure: male_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Male"
    }
  }

  measure: male_hc_at_eop {
  #  required_fields: [timeframe]
    label: "2. Male Headcount"
    description: "Female headcount to date in period."
    group_label: "Gender"
    type: number
    sql: ${male_hires_lte_date} - ${male_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_male_hc {
  #  required_fields: [timeframe]
    label: "2. Male Representation"
    group_label: "Gender"
    value_format_name: percent_1
    type: number
    sql: (${male_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## non-binary

  measure: non_binary_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Non-Binary"
    }
  }

  measure: non_binary_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: gender
      value: "Non-Binary"
    }
  }

  measure: non_binary_hc_at_eop {
  #  required_fields: [timeframe]
    label: "3. Non-Binary Headcount"
    description: "Non-Binary headcount to date in period."
    group_label: "Gender"
    type: number
    sql: ${non_binary_hires_lte_date} - ${non_binary_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_non_binary_hc {
  #  required_fields: [timeframe]
    label: "3. Non-Binary Representation"
    group_label: "Gender"
    value_format_name: percent_1
    type: number
    sql: (${non_binary_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## End Gender Representation Measures

  ## Ethnicity Representation Measures

  ## asain+

  measure: asian_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Asian+"
    }
  }

  measure: asian_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Asian+"
    }
  }

  measure: asain_hc_at_eop {
  #  required_fields: [timeframe]
    label: "1. Asiann+ Headcount"
    description: "Asain+ headcount to date in period."
    group_label: "Ethnicity"
    type: number
    sql: ${asian_hires_lte_date} - ${asian_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_asian_hc {
  #  required_fields: [timeframe]
    label: "1. Asian+ Representation"
    group_label: "Ethnicity"
    value_format_name: percent_1
    type: number
    sql: (${asain_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## native american+

  measure: native_american_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Native American+"
    }
  }

  measure: native_american_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Native American+"
    }
  }

  measure: native_american_hc_at_eop {
  #  required_fields: [timeframe]
    label: "2. Native American+ Headcount"
    description: "Native American+ headcount to date in period."
    group_label: "Ethnicity"
    type: number
    sql: ${native_american_hires_lte_date} - ${native_american_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_native_american_hc {
  #  required_fields: [timeframe]
    label: "2. Native American+ Representation"
    group_label: "Ethnicity"
    value_format_name: percent_1
    type: number
    sql: (${native_american_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## black+

  measure: black_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Black+"
    }
  }

  measure: black_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Black+"
    }
  }

  measure: black_hc_at_eop {
  #  required_fields: [timeframe]
    label: "3. Black+ Headcount"
    description: "Black+ headcount to date in period."
    group_label: "Ethnicity"
    type: number
    sql: ${black_hires_lte_date} - ${black_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_black_hc {
  #  required_fields: [timeframe]
    label: "3. Black+ Representation"
    group_label: "Ethnicity"
    value_format_name: percent_1
    type: number
    sql: (${black_hc_at_eop} / ${hc_at_eop}) ;;
    drill_fields: [dei_employee_info*]
  }

  ## white+

  measure: white_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "White+"
    }
  }

  measure: white_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "White+"
    }
  }

  measure: white_hc_at_eop {
  #  required_fields: [timeframe]
    label: "4. White+ Headcount"
    description: "White+ headcount to date in period."
    group_label: "Ethnicity"
    type: number
    sql: ${white_hires_lte_date} - ${white_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_white_hc {
  #  required_fields: [timeframe]
    label: "4. White+ Representation"
    group_label: "Ethnicity"
    value_format_name: percent_1
    type: number
    sql: (${white_hc_at_eop} / nullif(${hc_at_eop},0)) ;;
    drill_fields: [dei_employee_info*]
  }

  ## hispanic or latinx+

  measure: hispanic_or_latinx_hires_lte_date {
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Starts (to Date)"
    group_label: "Starts"
    type: count_distinct
    sql: CASE WHEN ${start_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Hispanic or Latinx+"
    }
  }

  measure: hispanic_or_latinx_terms_lte_date {
    ## NOTE: this is LESS THAN date. Decision being that, on an employee's last date (where date == term_date)
    ## they are still technically active. This means an employee is ACTIVE UNTIL THE DAY AFTER THEIR TERM DATE.
    ## ^^^^^^ MUY IMPORTANTE ^^^^^^
    ##
    hidden: yes
  #  required_fields: [timeframe]
    label: "Total Terms"
    group_label: "Terms"
    type: count_distinct
    sql: CASE WHEN ${departure_date} <= ${date} THEN ${employee_id} END  ;;
    filters: {
      field: ethnicity
      value: "Hispanic or Latinx+"
    }
  }

  measure: hispanic_or_latinx_hc_at_eop {
  #  required_fields: [timeframe]
    label: "5. Hispanic or Latinx+ Headcount"
    description: "Hispanic or Latinx+ headcount to date in period."
    group_label: "Ethnicity"
    type: number
    sql: ${hispanic_or_latinx_hires_lte_date} - ${hispanic_or_latinx_terms_lte_date} ;;
    drill_fields: [dei_employee_info*]
  }

  measure: pct_hispanic_or_latinx_hc {
  #  required_fields: [timeframe]
    label: "5. Hispanic or Latinx+ Representation"
    group_label: "Ethnicity"
    value_format_name: percent_1
    type: number
    sql: (${hispanic_or_latinx_hc_at_eop} / nullif(${hc_at_eop},0)) ;;
    drill_fields: [dei_employee_info*]
  }

  ## End Ethnicity Representation Measures



  ## Attrition Calcs below
  ## Note, we're moving to a more sophisticated way of annualizing the rates. Instead of just multiplying by 52 for week, 12 for month, etc, we'll
  ## be calculating how far through a given period we are. We'll then take that as our multiplier for the annualization.

  measure: attrition_rate {
    label: "Pure Attrition Rate"
    group_label: "Attrition"
    description: "# of Terms in Period / Avg. HC in Period"
    type: number
    sql:
          ${terms_in_period} / NULLIF(
          ((${hc_at_eop} - ${hires_in_period} + ${terms_in_period})+(${hc_at_eop}) )/2
          ,0) ;;
    value_format_name: percent_2
  }

  measure: voluntary_attrition_rate {
    label: "Pure Voluntary Attrition Rate"
    group_label: "Attrition"
    description: "# of Terms in Period / Avg. HC in Period"
    type: number
    sql:
          ${voluntary_terms_in_period} / NULLIF(
          ((${hc_at_eop} - ${hires_in_period} + ${terms_in_period})+(${hc_at_eop}) )/2
          ,0) ;;
    value_format_name: percent_2
  }

  measure: involuntary_attrition_rate {
    label: "Pure Involuntary Attrition Rate"
    group_label: "Attrition"
    description: "# of Terms in Period / Avg. HC in Period"
    type: number
    sql:
          ${involuntary_terms_in_period} / NULLIF(
          ((${hc_at_eop} - ${hires_in_period} + ${terms_in_period})+(${hc_at_eop}) )/2
          ,0) ;;
    value_format_name: percent_2
  }

  measure: early_attrition_rate {
    label: "Pure Early Attrition Rate"
    group_label: "Attrition"
    description: "# of Early Terms in Period / Avg. HC in Period"
    type: number
    value_format_name: percent_2
    sql: ${early_terms_in_period} /
          NULLIF(
          ((${hc_at_eop} - ${hires_in_period} + ${terms_in_period})+(${hc_at_eop}) )/2
          ,0) ;;
  }


  dimension: days_left_in_period {
    hidden: yes
    type: number
    sql:
      case
        when DATE_ADD(${timeframe}, INTERVAL 1 {% parameter timeframe_selector %}) > current_date()
          THEN date_diff(${next_timeframe}, current_date(), DAY)
        ELSE NULL
      end;;
  }

  dimension: days_in_period {
    hidden: yes
    type: number
    sql: date_diff(${next_timeframe}, ${timeframe} , DAY) ;;
  }

  measure: pct_through_period {
    hidden: yes
    type: max
    sql: case when ${days_left_in_period} is not null then 1.0*(${days_in_period} -${days_left_in_period}) / ${days_in_period} else null end ;;
  }

  measure: sophisticated_attrition_rate {
    label: "Annualized Attrition Rate"
    group_label: "Attrition"
    description: "Pure Attrition Rate / (days through period / days in period)"
    type: number
    value_format_name: percent_2
    sql:
          case
            when ${pct_through_period} is not null then (${attrition_rate} / ${pct_through_period})
            else ${attrition_rate}
          end
          *
          {% if timeframe_selector._parameter_value == 'WEEK' %}
            52
          {% elsif timeframe_selector._parameter_value == 'MONTH' %}
            12
          {% elsif timeframe_selector._parameter_value == 'QUARTER' %}
            4
          {% elsif  timeframe_selector._parameter_value == 'YEAR' %}
            1
          {% endif %};;

    drill_fields: [timeframe, l2, terms_in_period, early_terms_in_period, hc_at_eop]
  }

  measure: sophisticated_vol_attrition_rate {
    label: "Annualized Voluntary Attrition Rate"
    group_label: "Attrition"
    description: "Pure Attrition Rate / (days through period / days in period)"
    type: number
    value_format_name: percent_2
    sql:
          case
            when ${pct_through_period} is not null then (${voluntary_attrition_rate} / ${pct_through_period})
            else ${voluntary_attrition_rate}
          end
          *
          {% if timeframe_selector._parameter_value == 'WEEK' %}
            52
          {% elsif timeframe_selector._parameter_value == 'MONTH' %}
            12
          {% elsif timeframe_selector._parameter_value == 'QUARTER' %}
            4
          {% elsif  timeframe_selector._parameter_value == 'YEAR' %}
            1
          {% endif %};;

      drill_fields: [timeframe, l2, terms_in_period, early_terms_in_period, hc_at_eop]
    }

  measure: sophisticated_invvol_attrition_rate {
    label: "Annualized Involuntary Attrition Rate"
    group_label: "Attrition"
    description: "Pure Attrition Rate / (days through period / days in period)"
    type: number
    value_format_name: percent_2
    sql:
          case
            when ${pct_through_period} is not null then (${involuntary_attrition_rate} / ${pct_through_period})
            else ${involuntary_attrition_rate}
          end
          *
          {% if timeframe_selector._parameter_value == 'WEEK' %}
            52
          {% elsif timeframe_selector._parameter_value == 'MONTH' %}
            12
          {% elsif timeframe_selector._parameter_value == 'QUARTER' %}
            4
          {% elsif  timeframe_selector._parameter_value == 'YEAR' %}
            1
          {% endif %};;

      drill_fields: [timeframe, l2, terms_in_period, early_terms_in_period, hc_at_eop]
    }



set: headcount_quota {
  fields: [employee_name,quota_attainment_cohort,department_name_cohort,posting_locations.posting_location]
}

set: headcount_performance {
  fields: [employee_name,most_recent_rating,department_name_cohort,posting_locations.posting_location]
}

set: headcount_salary {
  fields: [employee_name,total_salary,department_name_cohort,posting_locations.posting_location]
}

set: headcount_tenure {
  fields: [employee_name,employee_tenure,department_name_cohort,posting_locations.posting_location]
}

set: headcount_gender {
  fields: [employee_name,gender,department_name_cohort,posting_locations.posting_location]
}

set: headcount {
  fields: [employee_name,department_name_cohort,posting_locations.posting_location]
}



}
