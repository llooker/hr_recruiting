include: "applications.view.lkml"
view: applications_over_time {
extends: [applications]
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
        , a.*

      FROM ${applications.SQL_TABLE_NAME} as a , dt

      WHERE dt.day >= "2017-01-01" AND a.application_created = dt.day;;
  }

  dimension: date {
    hidden: no
    label: "Date Filter"
    group_label: "Dates"
    type: date
    sql: TIMESTAMP(${TABLE}.date) ;;
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
    group_label: "Dates"
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

}
