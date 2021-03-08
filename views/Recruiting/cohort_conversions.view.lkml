# include: "application_funnel.view.lkml"
#
# view: cohort_conversions {
#   extends: [application_funnel]
#
#   filter: cohort_dates {
#     type: date
#     datatype: date
#
#   }
#
#   parameter: cohort_stage {
#     type: unquoted
#
#     allowed_value: {
#       label: "New Applicant"
#       value: "application_created"
#     }
#
#     allowed_value: {
#       label: "Phone Screens"
#       value: "screen_date"
#     }
#
#     allowed_value: {
#       label: "On-Site"
#       value: "onsite_date"
#     }
#
#     allowed_value: {
#       label: "Offer"
#       value: "offer_date"
#     }
#
#
#   }
#
#   parameter: end_stage {
#     type: unquoted
#
#     allowed_value: {
#       label: "Phone Screens"
#       value: "screen_date"
#     }
#
#     allowed_value: {
#       label: "On-Site"
#       value: "onsite_date"
#     }
#
#     allowed_value: {
#       label: "Offer"
#       value: "offer_date"
#     }
#
#     allowed_value: {
#       label: "Hired"
#       value: "hire_date"
#     }
#
#   }
#
#   dimension: grouping_variable_dim {
#     label_from_parameter: grouping_variable
#     type: string
#     sql: {% parameter grouping_variable %} ;;
#   }
#
#   dimension: cohort_stage_to_filter_on {
#     hidden: yes
#     type: date
#     sql:${TABLE}.{% parameter cohort_stage %} ;;
#   }
#
#   dimension: cohort_end_stage {
#     type: date
#     hidden: yes
#     sql:${TABLE}.{% parameter end_stage %} ;;
#   }
#
#
#   dimension: dynamic_cohort_date {
#     label_from_parameter: cohort_stage
#     type: yesno
#     hidden: yes
#     sql: {% condition cohort_dates %} ${cohort_stage_to_filter_on}{% endcondition %} ;;
#   }
#
#   dimension: in_new_applicant_cohort {
#     hidden: yes
#     type: yesno
#     sql: {% condition cohort_dates %} ${created_date} {% endcondition %} ;;
#   }
#
#   dimension: in_phone_screen_cohort {
#     hidden: yes
#     type: yesno
#     sql: {% condition cohort_dates %} ${phone_screen_date} {% endcondition %} ;;
#   }
#
#   dimension: in_onsite_cohort {
#     hidden: yes
#     type: yesno
#     sql: {% condition cohort_dates %} ${onsite_date} {% endcondition %} ;;
#   }
#
#   dimension: in_offer_cohort {
#     hidden: yes
#     type: yesno
#     sql: {% condition cohort_dates %} ${offer_date} {% endcondition %} ;;
#   }
#
#   measure: conv_rate {
#     label: "Numerator/Denominator"
#     hidden: yes
#     type: number
#     value_format_name: percent_2
#     sql: 1.0*${numerator}/nullif(${denominator}, 0) ;;
#   }
#
#   measure: denominator {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: dynamic_cohort_date
#       value: "Yes"
#     }
#   }
#
#   measure: numerator {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: dynamic_cohort_date
#       value: "Yes"
#     }
#
#     filters: {
#       field: cohort_end_stage
#       value: "-NULL"
#     }
#   }
#
#   ## cohorts for new applicant
#
#   measure: denominator_new_applicant {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_new_applicant_cohort
#       value: "Yes"
#     }
#   }
#
#   measure: numerator_screen_new_applicant {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_new_applicant_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: phone_screen_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_onsite_new_applicant {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_new_applicant_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: onsite_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_offer_new_applicant {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_new_applicant_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: offer_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_hired_new_applicant {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_new_applicant_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: hire_date
#       value: "-NULL"
#     }
#   }
#
#   measure: phone_new_applicant_to_screen_conv_rate {
#     type: number
#     label: "New Applicant to Phone Screen"
#     group_label: "Conversion Rates"
#     group_item_label: "1. New Applicant to Phone Screen"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_screen_new_applicant}/nullif(${denominator_new_applicant}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: phone_new_applicant_to_onsite_conv_rate {
#     type: number
#     label: "New Applicant to On-site"
#     group_label: "Conversion Rates"
#     group_item_label: "1. New Applicant to On-site"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_onsite_new_applicant}/nullif(${denominator_new_applicant}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: phone_new_applicant_to_offer_conv_rate {
#     type: number
#     label: "New Applicant to Offer"
#     group_label: "Conversion Rates"
#     group_item_label: "1. New Applicant to Offer"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_offer_new_applicant}/nullif(${denominator_new_applicant}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: phone_new_applicant_to_hired_conv_rate {
#     type: number
#     label: "New Applicant to Hired"
#     group_label: "Conversion Rates"
#     group_item_label: "1. New Applicant to Hired"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_hired_new_applicant}/nullif(${denominator_new_applicant}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   ## cohorts for phone screen
#
#   measure: denominator_screen {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_phone_screen_cohort
#       value: "Yes"
#     }
#   }
#
#   measure: numerator_onsite_screen {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_phone_screen_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: onsite_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_offer_screen {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_phone_screen_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: offer_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_hired_screen {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_phone_screen_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: hire_date
#       value: "-NULL"
#     }
#   }
#
#   measure: phone_screen_to_onsite_conv_rate {
#     type: number
#     label: "Phone Screen to Onsite"
#     group_label: "Conversion Rates"
#     group_item_label: "2. Phone Screen to Onsite"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_onsite_screen}/nullif(${denominator_screen}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: phone_screen_to_offer_conv_rate {
#     type: number
#     label: "Phone Screen to Offer"
#     group_label: "Conversion Rates"
#     group_item_label: "2. Phone Screen to Offer"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_offer_screen}/nullif(${denominator_screen}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: phone_screen_to_hired_conv_rate {
#     type: number
#     label: "Phone Screen to Hired"
#     group_label: "Conversion Rates"
#     group_item_label: "2. Phone Screen to Hired"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_hired_screen}/nullif(${denominator_screen}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#
# ## cohorts for onsite
#
#   measure: denominator_onsite {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_onsite_cohort
#       value: "Yes"
#     }
#   }
#
#   measure: numerator_offer_onsite {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_onsite_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: offer_date
#       value: "-NULL"
#     }
#   }
#
#   measure: numerator_hired_onsite {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_onsite_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: hire_date
#       value: "-NULL"
#     }
#   }
#
#   measure: onsite_to_offer_conv_rate {
#     type: number
#     label: "On-site to Offer"
#     group_label: "Conversion Rates"
#     group_item_label: "3. On-site to Offer"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_offer_onsite}/nullif(${denominator_onsite}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   measure: onsite_to_hired_conv_rate {
#     type: number
#     label: "On-Site to Hired"
#     group_label: "Conversion Rates"
#     group_item_label: "3. On-Site to Hired"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_hired_onsite}/nullif(${denominator_onsite}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
#   ## cohorts for offer
#
#   measure: denominator_offer {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_offer_cohort
#       value: "Yes"
#     }
#   }
#
#   measure: numerator_hired_offer {
#     type: count_distinct
#     hidden: yes
#     sql: ${candidate_id} ;;
#     filters: {
#       field: in_offer_cohort
#       value: "Yes"
#     }
#     filters: {
#       field: hire_date
#       value: "-NULL"
#     }
#   }
#
#   measure: offer_to_hired_conv_rate {
#     type: number
#     label: "Offer to Hired"
#     group_label: "Conversion Rates"
#     group_item_label: "4. Offer to Hired"
#     value_format_name: percent_1
#     sql: 1.0*${numerator_hired_offer}/nullif(${denominator_offer}, 0) ;;
#     link: {
#       label: "Conversion Rates Dashboard"
#       url: "/dashboards/155"
#       icon_url: "https://www.jonmgomes.com/wp-content/uploads/2019/10/SVG-Format-Example.png"
#     }
#   }
#
# }
