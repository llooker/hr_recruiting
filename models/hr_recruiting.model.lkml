connection: "looker-private-demo"

# include all the views
include: "/views/**/*.view"

datagroup: fakeco_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: fakeco_default_datagroup

explore: application_funnel {
  label: "Recruiting Explore"

  ## applications
  join: applications {
    type: left_outer
    sql_on: ${application_funnel.candidate_id} = ${applications.candidate_id} ;;
    relationship: many_to_one
  }

  ## candidate name
  join: candidates {
    view_label: "Applications"
    type: left_outer
    sql_on: ${application_funnel.candidate_id} = ${candidates.candidate_id_hash} ;;
    relationship: many_to_one
  }

  join: users {
    view_label: "Users"
    fields: [-users.employee_id,-users.count,-users.user_id]
    type: left_outer
    sql_on: ${candidates.candidate_owner_id} = ${users.user_id} ;;
    relationship: many_to_one
  }

  join: employees {
    from: employees
    view_label: "Applications"
    fields: [employees.employee_name,employees.gender,employees.ethnicity]
    type: left_outer
    sql_on: ${users.employee_id} = ${employees.employee_id} ;;
    relationship: one_to_many
  }

  ## posting info
  join: postings {
    type: left_outer
    sql_on: ${application_funnel.posting_id} = ${postings.posting_id} ;;
    relationship: many_to_one
  }

  join: origins {
    view_label: "Applications"
    fields: [origins.origin_name]
    type: left_outer
    sql_on: ${candidates.origin} = ${origins.origin_id} ;;
    relationship: many_to_one
  }

  join: posting_locations {
    view_label: "Postings"
    fields: [posting_locations.posting_country, posting_locations.posting_location]
    type: left_outer
    sql_on: ${postings.posting_location} = ${posting_locations.posting_location_id} ;;
    relationship: many_to_one
  }

  join: posting_department {
    from: posting_department_location
    view_label: "Postings"
    fields: [posting_department.department_name, posting_department.department_id]
    type: left_outer
    sql_on: ${posting_department.department_id} = ${postings.department_id} ;;
    relationship: one_to_many
  }

  join: posting_team {
    from: posting_department_location
    view_label: "Postings"
    fields: [posting_team.team_name, posting_team.team_id]
    type: left_outer
    sql_on: ${posting_department.team_id} = ${postings.team_id} ;;
    relationship: one_to_many
  }

  join: stages {
    fields: [stages.stage_name_clean,stages.stage_name]
    type: left_outer
    sql_on: ${application_funnel.stage_id} = ${stages.stage_id} ;;
    relationship: many_to_one
  }

  join: archive_reason {
    fields: [archive_reason.application_archive_reason]
    type: left_outer
    sql_on: ${archive_reason.application_archive_reason_id} = ${application_funnel.archive_reason_id} ;;
    relationship: many_to_one
  }

}


explore: recruiting_data {
  label: "Recruiting Data"
  hidden: yes
  from: applications
  view_name: applications

  #application info
  join: stages {
    fields: [stages.stage_name]
    view_label: "Applications"
    type: left_outer
    sql_on: ${applications.stage_id} = ${stages.stage_id} ;;
    relationship: many_to_one
  }

  join: archive_reason {
    view_label: "Applications"
    fields: [archive_reason.application_archive_reason]
    type: left_outer
    sql_on: ${archive_reason.application_archive_reason_id} = ${applications.archived_reason} ;;
    relationship: many_to_one
  }

  ## candidate info
  join: candidates {
    view_label: "Applications"
    fields: [candidates.candidate_name]
    type: left_outer
    sql_on: ${applications.candidate_id} = ${candidates.candidate_id_hash} ;;
    relationship: many_to_one
  }

  join: origins {
    view_label: "Applications"
    fields: [origins.origin_name]
    type: left_outer
    sql_on: ${candidates.origin} = ${origins.origin_id} ;;
    relationship: many_to_one
  }

  ## posting info
  join: postings {
    type: left_outer
    sql_on: ${applications.posting_id} = ${postings.posting_id} ;;
    relationship: many_to_one
  }

  join: posting_locations {
    view_label: "Postings"
    fields: [posting_locations.posting_country, posting_locations.posting_location]
    type: left_outer
    sql_on: ${postings.posting_location} = ${posting_locations.posting_location_id} ;;
    relationship: many_to_one
  }

  join: posting_department {
    from: posting_department_location
    view_label: "Postings"
    fields: [posting_department.department_name, posting_department.department_id]
    type: left_outer
    sql_on: ${posting_department.department_id} = ${postings.department_id} ;;
    relationship: one_to_many
  }

  join: posting_team {
    from: posting_department_location
    view_label: "Postings"
    fields: [posting_team.team_name, posting_team.team_id]
    type: left_outer
    sql_on: ${posting_department.team_id} = ${postings.team_id} ;;
    relationship: one_to_many
  }

  ## interview and feedback
  join: interviews {
    fields: [interviews.interview_type,interviews.interviewer_name]
    type: left_outer
    sql_on: ${interviews.candidate_id} = ${candidates.candidate_id_hash} ;;
    relationship: one_to_many
  }

  join: feedback {
    view_label: "Interviews"
    type: left_outer
    sql_on: ${interviews.interview_id} = ${feedback.interview_id} ;;
    relationship: one_to_many
  }

  join: feedback_score {
    view_label: "Interviews"
    type: left_outer
    sql_on: ${feedback.feedback_score} = ${feedback_score.feedback_score} ;;
    relationship: many_to_one
  }

  ## user and employee data
  join: employee_mapping {
    fields: []
    from: mapping
    type: left_outer
    sql_on: ${applications.candidate_id} = ${employee_mapping.candidate_id} ;;
    relationship: many_to_one
  }

  join: employees {
    type: left_outer
    sql_on: ${employee_mapping.employee_id} = ${employees.employee_id} ;;
    relationship: one_to_one
  }

}

explore: salary_data {
  from: salary
  hidden: no
  view_name: salary

  join: employees {
    from: employees
    fields: [employees.employee_name,employees.reports_to,employees.department]
    type: left_outer
    sql_on: ${salary.employee_id} = ${employees.employee_id} ;;
    relationship: many_to_one
  }

  join: posting_department {
    from: posting_department_location
    view_label: "Employees"
    fields: [posting_department.department_name]
    type: left_outer
    sql_on: ${employees.department} = ${posting_department.department_id} ;;
    relationship: many_to_one
  }

  join: posting_locations {
    view_label: "Employees"
    fields: [posting_locations.posting_location]
    type: left_outer
    sql_on: ${employees.office_location} = ${posting_locations.posting_location_id} ;;
    relationship: many_to_one
  }

}

explore: salary_over_time {
  from: salary_over_time
  hidden: no
  view_name: salary_over_time

  always_filter: {
    filters: [
      salary_over_time.timeframe_selector: "YEAR"
      , salary_over_time.date: "Last 4 Years"
    ]
  }
}


explore: employee_data {
  from: employees
  hidden: yes
  view_name: employees

  join: posting_department {
    from: posting_department_location
    view_label: "Employees"
    fields: [posting_department.department_name]
    type: left_outer
    sql_on: ${posting_department.department_id} = ${employees.department} ;;
    relationship: one_to_many
  }

  join: posting_locations {
    view_label: "Employees"
    fields: [posting_locations.posting_location, posting_locations.posting_state, posting_locations.posting_country]
    type: left_outer
    sql_on: ${employees.office_location} = ${posting_locations.posting_location_id} ;;
    relationship: many_to_one
  }

  join: employee_mapping {
    fields: []
    from: mapping
    type: left_outer
    sql_on: ${employees.employee_id} = ${employee_mapping.employee_id} ;;
    relationship: one_to_one
  }

  ## candidate info
  join: candidates {
    fields: []
    type: left_outer
    sql_on: ${employee_mapping.candidate_id} = ${candidates.candidate_id_hash} ;;
    relationship: one_to_many
  }

  join: applications {
    type: left_outer
    sql_on: ${employee_mapping.candidate_id} = ${applications.candidate_id} ;;
    relationship: one_to_many
  }

  join: origins {
    view_label: "Employees"
    type: left_outer
    sql_on: ${candidates.origin} = ${origins.origin_id} ;;
    relationship: many_to_one
  }

  ## interview and feedback
  join: interviews {
    fields: [interviews.interview_type,interviews.interviewer_name]
    type: left_outer
    sql_on: ${interviews.candidate_id} = ${candidates.candidate_id_hash} ;;
    relationship: one_to_many
  }

  join: feedback {
    view_label: "Interviews"
    type: left_outer
    sql_on: ${interviews.interview_id} = ${feedback.interview_id} ;;
    relationship: one_to_many
  }

  join: feedback_score {
    view_label: "Interviews"
    type: left_outer
    sql_on: ${feedback.feedback_score} = ${feedback_score.feedback_score} ;;
    relationship: many_to_one
  }

}

explore: applications_over_time {
  from: applications_over_time
  hidden: yes
  view_name: applications
  extends: [recruiting_data]
  label: "Recruiting Explore"

  always_filter: {
    filters: [
      applications.timeframe_selector: "YEAR"
      , applications.date: "Last 3 Years"
    ]
  }
}

explore: employees_over_time {
  from: employees_over_time
  hidden: no
  view_name: employees
  extends: [employee_data]
  label: "HR Explore"

  always_filter: {
    filters: [
      employees.timeframe_selector: "YEAR"
      , employees.date: "Last 4 Years"
    ]
  }
}

# explore: interviews {
#   join: candidates {
#     type: left_outer
#     sql_on: ${interviews.candidate_id} = ${candidates.candidate_id_hash} ;;
#     relationship: many_to_one
#   }
#
#   join: applications {
#     type: left_outer
#     sql_on: ${interviews.application_id} = ${applications.application_id} ;;
#     relationship: many_to_one
#   }
#
#   join: feedback {
#     type: left_outer
#     sql_on: ${feedback.interview_id} = ${interviews.interview_id} ;;
#     relationship: many_to_one
#   }
#
#   join: stages {
#     type: left_outer
#     sql_on: ${applications.stage_id} = ${stages.stage_id} ;;
#     relationship: many_to_one
#   }
#
#   join: postings {
#     type: left_outer
#     sql_on: ${applications.posting_id} = ${postings.posting_id} ;;
#     relationship: many_to_one
#   }
# }
