- dashboard: recruiting_kpi_dashboard
  title: Recruiting KPI Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Conversion
    name: Conversion
    model: hr_recruiting
    explore: application_funnel
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [application_funnel.applicant_to_phone_screen, application_funnel.phone_screen_to_onsite,
      application_funnel.onsite_to_offer, application_funnel.offer_to_hired]
    filters: {}
    sorts: [application_funnel.applicant_to_phone_screen desc]
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
    show_view_names: false
    font_size_main: '16'
    orientation: auto
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_override_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: above
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_override_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: above
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_override_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: above
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_override_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: above
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    chart_type: Pie
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '26'
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    note_state: expanded
    note_display: above
    note_text: Average Conversion Rates Across Key Stages
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 3
    col: 0
    width: 6
    height: 12
  - title: Speed
    name: Speed
    model: hr_recruiting
    explore: application_funnel
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [application_funnel.days_applicant_to_phone_screen, application_funnel.days_phone_screen_to_onsite,
      application_funnel.days_onsite_to_offer, application_funnel.days_offer_hired]
    filters: {}
    limit: 500
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
    show_view_names: false
    font_size_main: '16'
    orientation: auto
    style_application_funnel.days_applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.days_applicant_to_phone_screen: true
    title_override_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_placement_application_funnel.days_applicant_to_phone_screen: above
    value_format_application_funnel.days_applicant_to_phone_screen: ''
    style_application_funnel.days_phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.days_phone_screen_to_onsite: true
    title_override_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_placement_application_funnel.days_phone_screen_to_onsite: above
    value_format_application_funnel.days_phone_screen_to_onsite: ''
    show_comparison_application_funnel.days_phone_screen_to_onsite: false
    style_application_funnel.days_onsite_to_offer: "#FBBC04"
    show_title_application_funnel.days_onsite_to_offer: true
    title_override_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_placement_application_funnel.days_onsite_to_offer: above
    value_format_application_funnel.days_onsite_to_offer: ''
    show_comparison_application_funnel.days_onsite_to_offer: false
    style_application_funnel.days_offer_hired: "#34A853"
    show_title_application_funnel.days_offer_hired: true
    title_override_application_funnel.days_offer_hired: Days Offer to Hired
    title_placement_application_funnel.days_offer_hired: above
    value_format_application_funnel.days_offer_hired: ''
    show_comparison_application_funnel.days_offer_hired: false
    title_overrride_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_overrride_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_overrride_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_overrride_application_funnel.days_offer_hired: Days Offer to Hired
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: below
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: below
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: below
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: below
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    chart_type: Pie
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: '26'
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    note_state: expanded
    note_display: above
    note_text: Average Pipeline Speed Across Key Stages
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 3
    col: 12
    width: 6
    height: 12
  - title: Department (Speed)
    name: Department (Speed)
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [application_funnel.days_applicant_to_phone_screen, application_funnel.days_phone_screen_to_onsite,
      application_funnel.days_onsite_to_offer, application_funnel.days_offer_hired,
      posting_department.department_name]
    sorts: [posting_department.department_name]
    limit: 500
    dynamic_fields: [{table_calculation: total_days, label: Total Days, expression: "${application_funnel.days_applicant_to_phone_screen}+${application_funnel.days_phone_screen_to_onsite}+${application_funnel.days_onsite_to_offer}+${application_funnel.days_offer_hired}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
      application_funnel.days_applicant_to_phone_screen: Days New Applicant to Screen
      application_funnel.days_phone_screen_to_onsite: Days Screen to On-Site
      application_funnel.days_onsite_to_offer: Days On-Site to Offer
      application_funnel.days_offer_hired: Days Offer to Hired
    series_cell_visualizations:
      application_funnel.days_applicant_to_phone_screen:
        is_active: true
      application_funnel.days_phone_screen_to_onsite:
        is_active: true
      application_funnel.days_onsite_to_offer:
        is_active: true
      application_funnel.days_offer_hired:
        is_active: true
      total_days:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: 01f4e25a-bf41-033b-2d2b-13270d30d93e, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#86ed96", offset: 50},
              {color: "#14a82a", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      total_days:
        name: decimal_1
        format_string: "#,##0.0"
        label: Decimals (1)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: total_days, id: total_days,
            name: Total Days}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '20'
    series_types: {}
    chart_type: Bar
    font_size_main: ''
    style_employees.employee_name: "#3A4245"
    show_title_employees.employee_name: true
    title_overrride_employees.employee_name: Recruiter
    title_placement_employees.employee_name: below
    value_format_employees.employee_name: ''
    style_application_funnel.days_applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.days_applicant_to_phone_screen: true
    title_overrride_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_placement_application_funnel.days_applicant_to_phone_screen: below
    value_format_application_funnel.days_applicant_to_phone_screen: ''
    show_comparison_application_funnel.days_applicant_to_phone_screen: false
    style_application_funnel.days_phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.days_phone_screen_to_onsite: true
    title_overrride_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_placement_application_funnel.days_phone_screen_to_onsite: below
    value_format_application_funnel.days_phone_screen_to_onsite: ''
    show_comparison_application_funnel.days_phone_screen_to_onsite: false
    style_application_funnel.days_onsite_to_offer: "#FBBC04"
    show_title_application_funnel.days_onsite_to_offer: true
    title_overrride_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_placement_application_funnel.days_onsite_to_offer: below
    value_format_application_funnel.days_onsite_to_offer: ''
    show_comparison_application_funnel.days_onsite_to_offer: false
    style_application_funnel.days_offer_hired: "#34A853"
    show_title_application_funnel.days_offer_hired: true
    title_overrride_application_funnel.days_offer_hired: Days Offer to Hired
    title_placement_application_funnel.days_offer_hired: below
    value_format_application_funnel.days_offer_hired: ''
    show_comparison_application_funnel.days_offer_hired: false
    comparison_style_application_funnel.days_applicant_to_phone_screen: value
    comparison_show_label_application_funnel.days_applicant_to_phone_screen: true
    comparison_label_placement_application_funnel.days_applicant_to_phone_screen: below
    hidden_fields: [application_funnel.days_applicant_to_phone_screen, application_funnel.days_phone_screen_to_onsite,
      application_funnel.days_onsite_to_offer, application_funnel.days_offer_hired]
    hidden_points_if_no: []
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: below
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: below
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: below
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: below
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    range_max: 40
    bar_range_max: 40
    note_state: collapsed
    note_display: below
    note_text: Average days in pipeline before hired
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 9
    col: 18
    width: 6
    height: 6
  - title: Department (Conversion)
    name: Department (Conversion)
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [application_funnel.applicant_to_phone_screen, application_funnel.phone_screen_to_onsite,
      application_funnel.onsite_to_offer, application_funnel.offer_to_hired, posting_department.department_name]
    sorts: [posting_department.department_name]
    limit: 500
    dynamic_fields: [{table_calculation: total_days, label: Total Days, expression: "${application_funnel.days_applicant_to_phone_screen}+${application_funnel.days_phone_screen_to_onsite}+${application_funnel.days_onsite_to_offer}+${application_funnel.days_offer_hired}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: total_conversion,
        label: Total Conversion, expression: "${application_funnel.applicant_to_phone_screen}*${application_funnel.phone_screen_to_onsite}*${application_funnel.onsite_to_offer}*${application_funnel.offer_to_hired}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}, {table_calculation: candidates_needed_to_make_1_hire,
        label: Candidates Needed to Make (1) Hire, expression: '1/${total_conversion}',
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
      application_funnel.days_applicant_to_phone_screen: Days New Applicant to Screen
      application_funnel.days_phone_screen_to_onsite: Days Screen to On-Site
      application_funnel.days_onsite_to_offer: Days On-Site to Offer
      application_funnel.days_offer_hired: Days Offer to Hired
      candidates_needed_to_make_1_hire: Candidates Per Hire
    series_column_widths:
      employees.employee_name: 178
      posting_department.department_name: 157
    series_cell_visualizations:
      application_funnel.days_applicant_to_phone_screen:
        is_active: true
      application_funnel.days_phone_screen_to_onsite:
        is_active: true
      application_funnel.days_onsite_to_offer:
        is_active: true
      application_funnel.days_offer_hired:
        is_active: true
      total_days:
        is_active: true
      total_conversion:
        is_active: true
      applicants_needed_to_make_1_hire:
        is_active: true
      candidates_needed_to_make_1_hire:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: c9bc99ee-6f70-0b65-9004-be6d12e345db, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f57771", offset: 50},
              {color: "#d12814", offset: 100}]}, options: {steps: 5}}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      total_days:
        name: decimal_0
        format_string: "#,##0"
        label: Decimals (0)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: candidates_needed_to_make_1_hire,
            id: candidates_needed_to_make_1_hire, name: Candidates Needed to Make
              (1) Hire}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '20'
    series_types: {}
    chart_type: Bar
    font_size_main: ''
    style_employees.employee_name: "#3A4245"
    show_title_employees.employee_name: true
    title_overrride_employees.employee_name: Recruiter
    title_placement_employees.employee_name: below
    value_format_employees.employee_name: ''
    style_application_funnel.days_applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.days_applicant_to_phone_screen: true
    title_overrride_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_placement_application_funnel.days_applicant_to_phone_screen: below
    value_format_application_funnel.days_applicant_to_phone_screen: ''
    show_comparison_application_funnel.days_applicant_to_phone_screen: false
    style_application_funnel.days_phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.days_phone_screen_to_onsite: true
    title_overrride_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_placement_application_funnel.days_phone_screen_to_onsite: below
    value_format_application_funnel.days_phone_screen_to_onsite: ''
    show_comparison_application_funnel.days_phone_screen_to_onsite: false
    style_application_funnel.days_onsite_to_offer: "#FBBC04"
    show_title_application_funnel.days_onsite_to_offer: true
    title_overrride_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_placement_application_funnel.days_onsite_to_offer: below
    value_format_application_funnel.days_onsite_to_offer: ''
    show_comparison_application_funnel.days_onsite_to_offer: false
    style_application_funnel.days_offer_hired: "#34A853"
    show_title_application_funnel.days_offer_hired: true
    title_overrride_application_funnel.days_offer_hired: Days Offer to Hired
    title_placement_application_funnel.days_offer_hired: below
    value_format_application_funnel.days_offer_hired: ''
    show_comparison_application_funnel.days_offer_hired: false
    comparison_style_application_funnel.days_applicant_to_phone_screen: value
    comparison_show_label_application_funnel.days_applicant_to_phone_screen: true
    comparison_label_placement_application_funnel.days_applicant_to_phone_screen: below
    hidden_fields: [application_funnel.applicant_to_phone_screen, application_funnel.phone_screen_to_onsite,
      application_funnel.onsite_to_offer, application_funnel.offer_to_hired, total_conversion]
    hidden_points_if_no: []
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: below
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: below
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: below
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: below
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    range_max: 40
    bar_range_max: 40
    note_state: expanded
    note_display: below
    note_text: Average number of candidates needed to make 1 hire
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 9
    col: 6
    width: 6
    height: 6
  - title: Location (Conversion)
    name: Location (Conversion)
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [application_funnel.applicant_to_phone_screen, application_funnel.phone_screen_to_onsite,
      application_funnel.onsite_to_offer, application_funnel.offer_to_hired, posting_locations.posting_location]
    sorts: [posting_locations.posting_location]
    limit: 500
    dynamic_fields: [{table_calculation: total_days, label: Total Days, expression: "${application_funnel.days_applicant_to_phone_screen}+${application_funnel.days_phone_screen_to_onsite}+${application_funnel.days_onsite_to_offer}+${application_funnel.days_offer_hired}",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: total_conversion,
        label: Total Conversion, expression: "${application_funnel.applicant_to_phone_screen}*${application_funnel.phone_screen_to_onsite}*${application_funnel.onsite_to_offer}*${application_funnel.offer_to_hired}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}, {table_calculation: candidates_needed_to_make_1_hire,
        label: Candidates Needed to Make (1) Hire, expression: '1/${total_conversion}',
        value_format: !!null '', value_format_name: decimal_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
      application_funnel.days_applicant_to_phone_screen: Days New Applicant to Screen
      application_funnel.days_phone_screen_to_onsite: Days Screen to On-Site
      application_funnel.days_onsite_to_offer: Days On-Site to Offer
      application_funnel.days_offer_hired: Days Offer to Hired
      candidates_needed_to_make_1_hire: Candidates Per Hire
    series_column_widths:
      employees.employee_name: 178
      posting_department.department_name: 157
      posting_locations.posting_location: 141
    series_cell_visualizations:
      application_funnel.days_applicant_to_phone_screen:
        is_active: true
      application_funnel.days_phone_screen_to_onsite:
        is_active: true
      application_funnel.days_onsite_to_offer:
        is_active: true
      application_funnel.days_offer_hired:
        is_active: true
      total_days:
        is_active: true
      total_conversion:
        is_active: true
      applicants_needed_to_make_1_hire:
        is_active: true
      candidates_needed_to_make_1_hire:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: d130633f-0e34-3886-7189-3f5d7c0e9007, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#f57771", offset: 50},
              {color: "#d12814", offset: 100}]}, options: {steps: 10, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      total_days:
        name: decimal_0
        format_string: "#,##0"
        label: Decimals (0)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: candidates_needed_to_make_1_hire,
            id: candidates_needed_to_make_1_hire, name: Candidates Needed to Make
              (1) Hire}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '20'
    series_types: {}
    chart_type: Bar
    font_size_main: ''
    style_employees.employee_name: "#3A4245"
    show_title_employees.employee_name: true
    title_overrride_employees.employee_name: Recruiter
    title_placement_employees.employee_name: below
    value_format_employees.employee_name: ''
    style_application_funnel.days_applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.days_applicant_to_phone_screen: true
    title_overrride_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_placement_application_funnel.days_applicant_to_phone_screen: below
    value_format_application_funnel.days_applicant_to_phone_screen: ''
    show_comparison_application_funnel.days_applicant_to_phone_screen: false
    style_application_funnel.days_phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.days_phone_screen_to_onsite: true
    title_overrride_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_placement_application_funnel.days_phone_screen_to_onsite: below
    value_format_application_funnel.days_phone_screen_to_onsite: ''
    show_comparison_application_funnel.days_phone_screen_to_onsite: false
    style_application_funnel.days_onsite_to_offer: "#FBBC04"
    show_title_application_funnel.days_onsite_to_offer: true
    title_overrride_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_placement_application_funnel.days_onsite_to_offer: below
    value_format_application_funnel.days_onsite_to_offer: ''
    show_comparison_application_funnel.days_onsite_to_offer: false
    style_application_funnel.days_offer_hired: "#34A853"
    show_title_application_funnel.days_offer_hired: true
    title_overrride_application_funnel.days_offer_hired: Days Offer to Hired
    title_placement_application_funnel.days_offer_hired: below
    value_format_application_funnel.days_offer_hired: ''
    show_comparison_application_funnel.days_offer_hired: false
    comparison_style_application_funnel.days_applicant_to_phone_screen: value
    comparison_show_label_application_funnel.days_applicant_to_phone_screen: true
    comparison_label_placement_application_funnel.days_applicant_to_phone_screen: below
    hidden_fields: [application_funnel.applicant_to_phone_screen, application_funnel.phone_screen_to_onsite,
      application_funnel.onsite_to_offer, application_funnel.offer_to_hired, total_conversion]
    hidden_points_if_no: []
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: below
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: below
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: below
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: below
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    range_max: 40
    bar_range_max: 40
    note_state: expanded
    note_display: below
    note_text: Average number of candidates needed to make 1 hire
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 3
    col: 6
    width: 6
    height: 6
  - title: Location (Speed)
    name: Location (Speed)
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [application_funnel.days_applicant_to_phone_screen, application_funnel.days_phone_screen_to_onsite,
      application_funnel.days_onsite_to_offer, application_funnel.days_offer_hired,
      posting_locations.posting_location]
    sorts: [posting_locations.posting_location]
    limit: 500
    dynamic_fields: [{table_calculation: total_days, label: Total Days, expression: "${application_funnel.days_applicant_to_phone_screen}+${application_funnel.days_phone_screen_to_onsite}+${application_funnel.days_onsite_to_offer}+${application_funnel.days_offer_hired}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applicant_to_phone_screen: New Applicant to Screen
      application_funnel.phone_screen_to_onsite: Screen to On-Site
      application_funnel.onsite_to_offer: On-Site to Offer
      application_funnel.offer_to_hired: Offer to Hired
      application_funnel.days_applicant_to_phone_screen: Days New Applicant to Screen
      application_funnel.days_phone_screen_to_onsite: Days Screen to On-Site
      application_funnel.days_onsite_to_offer: Days On-Site to Offer
      application_funnel.days_offer_hired: Days Offer to Hired
    series_cell_visualizations:
      application_funnel.days_applicant_to_phone_screen:
        is_active: true
      application_funnel.days_phone_screen_to_onsite:
        is_active: true
      application_funnel.days_onsite_to_offer:
        is_active: true
      application_funnel.days_offer_hired:
        is_active: true
      total_days:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: c32cac24-ef21-ec03-2dd7-1003985e50b5, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#86ed96", offset: 50},
              {color: "#14a82a", offset: 100}]}, options: {steps: 5, reverse: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_value_format:
      total_days:
        name: decimal_1
        format_string: "#,##0.0"
        label: Decimals (1)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: total_days, id: total_days,
            name: Total Days}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '20'
    series_types: {}
    chart_type: Bar
    font_size_main: ''
    style_employees.employee_name: "#3A4245"
    show_title_employees.employee_name: true
    title_overrride_employees.employee_name: Recruiter
    title_placement_employees.employee_name: below
    value_format_employees.employee_name: ''
    style_application_funnel.days_applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.days_applicant_to_phone_screen: true
    title_overrride_application_funnel.days_applicant_to_phone_screen: Days New Applicant
      to Screen
    title_placement_application_funnel.days_applicant_to_phone_screen: below
    value_format_application_funnel.days_applicant_to_phone_screen: ''
    show_comparison_application_funnel.days_applicant_to_phone_screen: false
    style_application_funnel.days_phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.days_phone_screen_to_onsite: true
    title_overrride_application_funnel.days_phone_screen_to_onsite: Days Screen to
      On-Site
    title_placement_application_funnel.days_phone_screen_to_onsite: below
    value_format_application_funnel.days_phone_screen_to_onsite: ''
    show_comparison_application_funnel.days_phone_screen_to_onsite: false
    style_application_funnel.days_onsite_to_offer: "#FBBC04"
    show_title_application_funnel.days_onsite_to_offer: true
    title_overrride_application_funnel.days_onsite_to_offer: Days On-Site to Offer
    title_placement_application_funnel.days_onsite_to_offer: below
    value_format_application_funnel.days_onsite_to_offer: ''
    show_comparison_application_funnel.days_onsite_to_offer: false
    style_application_funnel.days_offer_hired: "#34A853"
    show_title_application_funnel.days_offer_hired: true
    title_overrride_application_funnel.days_offer_hired: Days Offer to Hired
    title_placement_application_funnel.days_offer_hired: below
    value_format_application_funnel.days_offer_hired: ''
    show_comparison_application_funnel.days_offer_hired: false
    comparison_style_application_funnel.days_applicant_to_phone_screen: value
    comparison_show_label_application_funnel.days_applicant_to_phone_screen: true
    comparison_label_placement_application_funnel.days_applicant_to_phone_screen: below
    hidden_fields: [application_funnel.days_applicant_to_phone_screen, application_funnel.days_phone_screen_to_onsite,
      application_funnel.days_onsite_to_offer, application_funnel.days_offer_hired]
    hidden_points_if_no: []
    style_application_funnel.applicant_to_phone_screen: "#4285F4"
    show_title_application_funnel.applicant_to_phone_screen: true
    title_overrride_application_funnel.applicant_to_phone_screen: New Applicant to
      Screen
    title_placement_application_funnel.applicant_to_phone_screen: below
    value_format_application_funnel.applicant_to_phone_screen: ''
    style_application_funnel.phone_screen_to_onsite: "#EA4335"
    show_title_application_funnel.phone_screen_to_onsite: true
    title_overrride_application_funnel.phone_screen_to_onsite: Screen to On-Site
    title_placement_application_funnel.phone_screen_to_onsite: below
    value_format_application_funnel.phone_screen_to_onsite: ''
    show_comparison_application_funnel.phone_screen_to_onsite: false
    style_application_funnel.onsite_to_offer: "#FBBC04"
    show_title_application_funnel.onsite_to_offer: true
    title_overrride_application_funnel.onsite_to_offer: On-Site to Offer
    title_placement_application_funnel.onsite_to_offer: below
    value_format_application_funnel.onsite_to_offer: ''
    show_comparison_application_funnel.onsite_to_offer: false
    style_application_funnel.offer_to_hired: "#34A853"
    show_title_application_funnel.offer_to_hired: true
    title_overrride_application_funnel.offer_to_hired: Offer to Hired
    title_placement_application_funnel.offer_to_hired: below
    value_format_application_funnel.offer_to_hired: ''
    show_comparison_application_funnel.offer_to_hired: false
    comparison_style_application_funnel.phone_screen_to_onsite: value
    comparison_show_label_application_funnel.phone_screen_to_onsite: true
    comparison_label_placement_application_funnel.phone_screen_to_onsite: below
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    range_max: 40
    bar_range_max: 40
    note_state: collapsed
    note_display: below
    note_text: Average days in pipeline before hired
    listen:
      Event Date: application_funnel.event_date
      Origin: origins.origin_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 3
    col: 18
    width: 6
    height: 6
  - title: Interviewer Gave "Strong Hire" Rating
    name: Interviewer Gave "Strong Hire" Rating
    model: hr_recruiting
    explore: employees_over_time
    type: looker_grid
    fields: [employees.avg_quota_attainment, interviews.interviewer_name, feedback_score.feedback_verdict]
    pivots: [feedback_score.feedback_verdict]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 3 years
      employees.avg_quota_attainment: NOT NULL
      feedback_score.feedback_verdict: Strong Hire
    sorts: [employees.avg_quota_attainment desc 0, feedback_score.feedback_verdict]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      employees.avg_quota_attainment: Avg. Quota Attainment of Hires
      feedback_score.feedback_verdict_clean: Feedback Score
    series_column_widths:
      interviews.interviewer_name: 188
    series_cell_visualizations:
      feedback.avg_feedback_score:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: 36927bfc-a5ee-c5d2-feda-3edb56d7a01b, label: Custom, type: continuous,
            stops: [{color: "#B31412", offset: 0}, {color: "#EA4335", offset: 25},
              {color: "#f1e8ff", offset: 50}, {color: "#4285F4", offset: 75}, {color: "#185ABC",
                offset: 100}]}, options: {steps: 5, constraints: {mid: {type: median}}}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 0fe71084-3143-60a7-34f0-c01475bdd0e0,
            label: Custom, type: continuous, stops: [{color: "#B31412", offset: 0},
              {color: "#EA4335", offset: 25}, {color: "#f1e8ff", offset: 50}, {color: "#4285F4",
                offset: 75}, {color: "#185ABC", offset: 100}]}, options: {steps: 5,
            constraints: {mid: {type: median}}}}, bold: false, italic: false, strikethrough: false,
        fields: [employees.avg_quota_attainment]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: Average Quota Attainment of Employees that received a "Strong Hire"
      score during the interview process.
    listen:
      Interviewer Name: interviews.interviewer_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 18
    col: 0
    width: 8
    height: 10
  - title: Interviewer Gave "Hire" Rating
    name: Interviewer Gave "Hire" Rating
    model: hr_recruiting
    explore: employees_over_time
    type: looker_grid
    fields: [employees.avg_quota_attainment, interviews.interviewer_name, feedback_score.feedback_verdict]
    pivots: [feedback_score.feedback_verdict]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 3 years
      employees.avg_quota_attainment: NOT NULL
      feedback_score.feedback_verdict: Hire
    sorts: [employees.avg_quota_attainment desc 0, feedback_score.feedback_verdict]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      employees.avg_quota_attainment: Avg. Quota Attainment of Hires
      feedback_score.feedback_verdict_clean: Feedback Score
    series_column_widths:
      interviews.interviewer_name: 188
    series_cell_visualizations:
      feedback.avg_feedback_score:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: 36927bfc-a5ee-c5d2-feda-3edb56d7a01b, label: Custom, type: continuous,
            stops: [{color: "#B31412", offset: 0}, {color: "#EA4335", offset: 25},
              {color: "#f1e8ff", offset: 50}, {color: "#4285F4", offset: 75}, {color: "#185ABC",
                offset: 100}]}, options: {steps: 5, constraints: {mid: {type: median}}}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 0fe71084-3143-60a7-34f0-c01475bdd0e0,
            label: Custom, type: continuous, stops: [{color: "#B31412", offset: 0},
              {color: "#EA4335", offset: 25}, {color: "#f1e8ff", offset: 50}, {color: "#4285F4",
                offset: 75}, {color: "#185ABC", offset: 100}]}, options: {steps: 5,
            constraints: {mid: {type: median}}}}, bold: false, italic: false, strikethrough: false,
        fields: [employees.avg_quota_attainment]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: Average Quota Attainment of Employees that received a "Hire" score
      during the interview process.
    listen:
      Interviewer Name: interviews.interviewer_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 18
    col: 8
    width: 8
    height: 10
  - title: Interviewer Gave "No Hire" Rating
    name: Interviewer Gave "No Hire" Rating
    model: hr_recruiting
    explore: employees_over_time
    type: looker_grid
    fields: [employees.avg_quota_attainment, interviews.interviewer_name, feedback_score.feedback_verdict]
    pivots: [feedback_score.feedback_verdict]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 3 years
      employees.avg_quota_attainment: NOT NULL
      feedback_score.feedback_verdict: No Hire
    sorts: [employees.avg_quota_attainment desc 0, feedback_score.feedback_verdict]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      employees.avg_quota_attainment: Avg. Quota Attainment of Hires
      feedback_score.feedback_verdict_clean: Feedback Score
    series_column_widths:
      interviews.interviewer_name: 188
    series_cell_visualizations:
      feedback.avg_feedback_score:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: 36927bfc-a5ee-c5d2-feda-3edb56d7a01b, label: Custom, type: continuous,
            stops: [{color: "#B31412", offset: 0}, {color: "#EA4335", offset: 25},
              {color: "#f1e8ff", offset: 50}, {color: "#4285F4", offset: 75}, {color: "#185ABC",
                offset: 100}]}, options: {steps: 5, constraints: {mid: {type: median}},
            reverse: true}}, bold: false, italic: false, strikethrough: false, fields: [
          employees.avg_quota_attainment]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          custom: {id: 0fe71084-3143-60a7-34f0-c01475bdd0e0, label: Custom, type: continuous,
            stops: [{color: "#B31412", offset: 0}, {color: "#EA4335", offset: 25},
              {color: "#f1e8ff", offset: 50}, {color: "#4285F4", offset: 75}, {color: "#185ABC",
                offset: 100}]}, options: {steps: 5, constraints: {mid: {type: median}}}},
        bold: false, italic: false, strikethrough: false, fields: [employees.avg_quota_attainment]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: Average Quota Attainment of Employees that received a "No Hire" score
      during the interview process.
    listen:
      Interviewer Name: interviews.interviewer_name
      Location: posting_locations.posting_location
      Department: posting_department.department_name
    row: 18
    col: 16
    width: 8
    height: 10
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=https%3A%2F%2Fgetdrawingscom%2Ffree-icon-bw%2Fpipeline-icon-14png&f=1&nofb=1"
      width="60" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgetdrawings.com%2Ffree-icon-bw%2Fpipeline-icon-14.png&f=1&nofb=1"
      width="60" height="60"></h1>
    subtitle_text: Conversion
    body_text: ''
    row: 0
    col: 0
    width: 12
    height: 3
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=http%3A%2F%2Fclipartixcom%2Fwp-content%2Fuploads%2F2016%2F04%2FTrain-free-to-use-clip-art-3png&f=1&nofb=1"
      width="120" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fclipartix.com%2Fwp-content%2Fuploads%2F2016%2F04%2FTrain-free-to-use-clip-art-3.png&f=1&nofb=1"
      width="120" height="60"></h1>
    subtitle_text: Speed
    body_text: ''
    row: 0
    col: 12
    width: 12
    height: 3
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=https%3A%2F%2Fwebstockreviewnet%2Fimages%2Fconversation-clipart-office-conversation-12png&f=1&nofb=1"
      width="60" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwebstockreview.net%2Fimages%2Fconversation-clipart-office-conversation-12.png&f=1&nofb=1"
      width="60" height="60"></h1>
    subtitle_text: How good are interviewers at predicting successful employees?
    body_text: ''
    row: 15
    col: 0
    width: 24
    height: 3
  filters:
  - name: Event Date
    title: Event Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: hr_recruiting
    explore: application_funnel
    listens_to_filters: []
    field: application_funnel.event_date
  - name: Origin
    title: Origin
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: hr_recruiting
    explore: application_funnel
    listens_to_filters: []
    field: origins.origin_name
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options:
      - Austin
      - Bay Area
      - London
      - Seattle
      - Tokyo
    model: hr_recruiting
    explore: application_funnel
    listens_to_filters: [Department, Interviewer Name]
    field: posting_locations.posting_location
  - name: Department
    title: Department
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: hr_recruiting
    explore: application_funnel
    listens_to_filters: [Location, Interviewer Name]
    field: posting_department.department_name
  - name: Interviewer Name
    title: Interviewer Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: [Location, Department]
    field: interviews.interviewer_name
