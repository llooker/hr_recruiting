view: candidates {
  sql_table_name: `looker-private-demo.hr_recruiting.candidates` ;;
  drill_fields: [candidate_id_hash]

  dimension: candidate_id_hash {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_id_hashed ;;
  }

  dimension: candidate_created_at {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_created_at ;;
  }

  dimension: candidate_name {
    type: string
    label: "Candidate Name"
    group_label: "Applicant Information"
    sql: ${TABLE}.candidate_name ;;
    action: {
      label: "Schedule Interview With Candidate"
      url: "https://hooks.zapier.com/hooks/catch/5936697/o68bx5q/"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Google_Calendar_icon.svg/1051px-Google_Calendar_icon.svg.png"
    }
    link: {
      label: "Candidate Profile"
      url: "go/ghire"
      icon_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fssl.gstatic.com%2Fimages%2Fbranding%2Fproduct%2F2x%2Fgoogle_hire_512dp.png&f=1&nofb=1"
    }
    action: {
      label: "Send Slack"
      url: "https://hooks.zapier.com/hooks/catch/5936697/o68bx5q/"
      icon_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fcdn.freebiesupply.com%2Flogos%2Flarge%2F2x%2Fslack-logo-icon.png&f=1&nofb=1"
#       param: {
#         name: "Candidate Name"
#         value: "{{candidate_name}}"
#       }
#       user_attribute_param: {
#         name: "Sender Name"
#         user_attribute: name
#       }
#       form_param: {
#         name: "Message"
#         type: textarea
#         label: "Leave a note."
#         required: yes
#       }
    }
    action: {
      label: "Advance Stage"
      url: "https://hooks.zapier.com/hooks/catch/5936697/o68bx5q/"
      icon_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fssl.gstatic.com%2Fimages%2Fbranding%2Fproduct%2F2x%2Fgoogle_hire_512dp.png&f=1&nofb=1"
      form_param: {
        type: string
        name: "Candidate Name"
        default: "{{candidate_name}}"
      }
      form_param: {
        name: "Stage"
        type: select
        option: {
          name: "Screen"
        }
        option: {
          name: "On-Site Interview"
        }
        option: {
          name: "Offer"
        }
        required: yes
      }
    }
  }

  dimension: candidate_owner_id {
    hidden: yes
    type: string
    sql: ${TABLE}.candidate_owner_id__user_id_ ;;
  }

  dimension: origin {
    hidden: yes
    type: string
    sql: ${TABLE}.origin_id ;;
  }



}
