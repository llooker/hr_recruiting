- dashboard: fakeco_company_dashboard
  title: FakeCo Company Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Most Recent Performance Rating
    name: Most Recent Performance Rating
    model: hr_recruiting
    explore: employees_over_time
    type: looker_bar
    fields: [posting_department.department_name, employees.most_recent_rating, employees.hc_at_eop_performance]
    pivots: [employees.most_recent_rating]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 3 years
      employees.most_recent_rating: "-NULL"
    sorts: [employees.most_recent_rating desc, employees.hc_at_eop_performance desc
        0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: percent
    limit_displayed_rows: false
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Exceeds Expectations
              - employees.headcount2, id: Exceeds Expectations - employees.headcount2,
            name: Exceeds Expectations}, {axisId: Meets Expectations - employees.headcount2,
            id: Meets Expectations - employees.headcount2, name: Meets Expectations},
          {axisId: Needs Improvement - employees.headcount2, id: Needs Improvement
              - employees.headcount2, name: Needs Improvement}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      Meets Expectations - employees.headcount2: "#9AA0A6"
      Needs Improvement - employees.hc_at_eop_performance: "#EA4335"
      Meets Expectations - employees.hc_at_eop_performance: "#E8EAED"
      Exceeds Expectations - employees.hc_at_eop_performance: "#34A853"
    defaults_version: 1
    listen:
      ? "\n    \n      Employee Origin\n    "
      : origins.origin_name
      Department: posting_department.department_name
      Employee Type: employees.is_people_manager
    row: 39
    col: 0
    width: 12
    height: 9
  - title: Average USD Salary
    name: Average USD Salary
    model: hr_recruiting
    explore: employees_over_time
    type: looker_bar
    fields: [posting_department.department_name, posting_locations.posting_location,
      employees.avg_salary_over_time]
    pivots: [posting_department.department_name]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 5 years
      posting_locations.posting_location: Austin,Bay Area,Seattle
    sorts: [posting_department.department_name, employees.avg_salary_over_time desc
        0, posting_locations.posting_location]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    trellis: pivot
    stacking: ''
    limit_displayed_rows: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: employees.avg_salary_over_time,
            id: Customer Support - employees.avg_salary_over_time, name: Customer
              Support}, {axisId: employees.avg_salary_over_time, id: G&A - employees.avg_salary_over_time,
            name: G&A}, {axisId: employees.avg_salary_over_time, id: Marketing - employees.avg_salary_over_time,
            name: Marketing}, {axisId: employees.avg_salary_over_time, id: R&D - employees.avg_salary_over_time,
            name: R&D}, {axisId: employees.avg_salary_over_time, id: Sales - employees.avg_salary_over_time,
            name: Sales}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    trellis_rows: 5
    series_types: {}
    series_colors:
      Sales - employees.avg_salary: "#9AA0A6"
      Sales - employees.avg_salary_over_time: "#9AA0A6"
      Austin - employees.avg_salary_over_time: "#4285F4"
      Bay Area - employees.avg_salary_over_time: "#EA4335"
      Seattle - employees.avg_salary_over_time: "#34A853"
    charts_across: 5
    defaults_version: 1
    listen:
      ? "\n    \n      Employee Origin\n    "
      : origins.origin_name
      Department: posting_department.department_name
      Employee Type: employees.is_people_manager
    row: 31
    col: 0
    width: 24
    height: 6
  - title: Employee Tenure
    name: Employee Tenure
    model: hr_recruiting
    explore: employees_over_time
    type: looker_column
    fields: [posting_locations.posting_location, employees.employee_tenure_bucketed,
      employees.hc_at_eop_tenure]
    pivots: [employees.employee_tenure_bucketed]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 5 years
      posting_locations.posting_location: Tokyo,London,Bay Area,Austin,Seattle
      employees.employee_tenure_bucketed: "-Below 6"
    sorts: [employees.employee_tenure_bucketed, employees.hc_at_eop_tenure desc 0]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: percent
    limit_displayed_rows: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Below 6 - 0 - employees.hc_at_eop_tenure,
            id: Below 6 - 0 - employees.hc_at_eop_tenure, name: Below 6}, {axisId: 6
              to 11 - 1 - employees.hc_at_eop_tenure, id: 6 to 11 - 1 - employees.hc_at_eop_tenure,
            name: 6 to 11}, {axisId: 12 to 17 - 2 - employees.hc_at_eop_tenure, id: 12
              to 17 - 2 - employees.hc_at_eop_tenure, name: 12 to 17}, {axisId: 18
              to 23 - 3 - employees.hc_at_eop_tenure, id: 18 to 23 - 3 - employees.hc_at_eop_tenure,
            name: 18 to 23}, {axisId: 24 to 35 - 4 - employees.hc_at_eop_tenure, id: 24
              to 35 - 4 - employees.hc_at_eop_tenure, name: 24 to 35}, {axisId: 36
              or Above - 5 - employees.hc_at_eop_tenure, id: 36 or Above - 5 - employees.hc_at_eop_tenure,
            name: 36 or Above}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Employee Tenure (Months)
    series_types: {}
    series_colors:
      Sales - employees.avg_salary: "#9AA0A6"
      36 or Above - 5 - employees.headcount2: "#4285F4"
      Below 6 - 0 - employees.headcount2: "#5F6368"
      24 to 35 - 4 - employees.headcount2: "#9AA0A6"
      24 to 35 - 4 - employees.hc_at_eop_tenure: "#4285F4"
      36 or Above - 5 - employees.hc_at_eop_tenure: "#34A853"
      6 to 11 - 1 - employees.hc_at_eop_tenure: "#9AA0A6"
    defaults_version: 1
    listen:
      ? "\n    \n      Employee Origin\n    "
      : origins.origin_name
      Department: posting_department.department_name
      Employee Type: employees.is_people_manager
    row: 39
    col: 13
    width: 11
    height: 9
  - title: Headcount Increase Over Time
    name: Headcount Increase Over Time
    model: hr_recruiting
    explore: employees_over_time
    type: looker_column
    fields: [posting_locations.posting_location, employees.displayed_timeframe, employees.hc_at_eop]
    pivots: [posting_locations.posting_location]
    filters:
      employees.timeframe_selector: QUARTER
      employees.date: 4 years
      posting_locations.posting_location: Tokyo,London,Bay Area,Austin,Seattle
    sorts: [posting_locations.posting_location 0, employees.displayed_timeframe]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Austin - employees.hc_at_eop,
            id: Austin - employees.hc_at_eop, name: Austin}, {axisId: Bay Area - employees.hc_at_eop,
            id: Bay Area - employees.hc_at_eop, name: Bay Area}, {axisId: London -
              employees.hc_at_eop, id: London - employees.hc_at_eop, name: London},
          {axisId: Seattle - employees.hc_at_eop, id: Seattle - employees.hc_at_eop,
            name: Seattle}, {axisId: Tokyo - employees.hc_at_eop, id: Tokyo - employees.hc_at_eop,
            name: Tokyo}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Employee Tenure (Months)
    series_types: {}
    series_colors:
      Sales - employees.avg_salary: "#9AA0A6"
      36 or Above - 5 - employees.headcount2: "#4285F4"
      Below 6 - 0 - employees.headcount2: "#5F6368"
      24 to 35 - 4 - employees.headcount2: "#9AA0A6"
      Tokyo - employees.hc_at_eop: "#9AA0A6"
    defaults_version: 1
    listen:
      ? "\n    \n      Employee Origin\n    "
      : origins.origin_name
      Department: posting_department.department_name
      Employee Type: employees.is_people_manager
    row: 9
    col: 0
    width: 15
    height: 8
  - title: Annualized Attrition Rate
    name: Annualized Attrition Rate
    model: hr_recruiting
    explore: employees_over_time
    type: looker_line
    fields: [employees.displayed_timeframe, employees.sophisticated_attrition_rate,
      posting_department.department_name]
    pivots: [posting_department.department_name]
    filters:
      employees.timeframe_selector: QUARTER
      employees.date: 2019/04/01 to 2020/07/01
      posting_locations.posting_location: Tokyo,London,Bay Area,Austin,Seattle
    sorts: [employees.displayed_timeframe, posting_department.department_name]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: employees.sophisticated_attrition_rate,
            id: Customer Support - employees.sophisticated_attrition_rate, name: Customer
              Support}, {axisId: employees.sophisticated_attrition_rate, id: G&A -
              employees.sophisticated_attrition_rate, name: G&A}, {axisId: employees.sophisticated_attrition_rate,
            id: Marketing - employees.sophisticated_attrition_rate, name: Marketing},
          {axisId: employees.sophisticated_attrition_rate, id: R&D - employees.sophisticated_attrition_rate,
            name: R&D}, {axisId: employees.sophisticated_attrition_rate, id: Sales
              - employees.sophisticated_attrition_rate, name: Sales}], showLabels: true,
        showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    series_types: {}
    series_colors:
      Sales - employees.avg_salary: "#9AA0A6"
      36 or Above - 5 - employees.headcount2: "#4285F4"
      Below 6 - 0 - employees.headcount2: "#5F6368"
      24 to 35 - 4 - employees.headcount2: "#9AA0A6"
      Tokyo - employees.hc_at_eop: "#9AA0A6"
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      ? "\n    \n      Employee Origin\n    "
      : origins.origin_name
      Department: posting_department.department_name
      Employee Type: employees.is_people_manager
    row: 9
    col: 15
    width: 9
    height: 8
  - name: Performance
    type: text
    title_text: Performance
    subtitle_text: ''
    body_text: ''
    row: 37
    col: 0
    width: 12
    height: 2
  - name: Salary
    type: text
    title_text: Salary
    subtitle_text: ''
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  - name: Tenure
    type: text
    title_text: Tenure
    subtitle_text: ''
    body_text: ''
    row: 37
    col: 13
    width: 11
    height: 2
  - name: Headcount
    type: text
    title_text: Headcount
    subtitle_text: ''
    body_text: ''
    row: 7
    col: 0
    width: 15
    height: 2
  - name: Attrition
    type: text
    title_text: Attrition
    subtitle_text: ''
    body_text: ''
    row: 7
    col: 15
    width: 9
    height: 2
  - title: Gender Wage Gap
    name: Gender Wage Gap
    model: hr_recruiting
    explore: employees_over_time
    type: looker_bar
    fields: [employees.gender, employees.avg_salary_over_time, posting_department.department_name]
    pivots: [employees.gender]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 3 years
      employees.currency: USD
    sorts: [employees.gender, employees.avg_salary_over_time desc 0]
    limit: 500
    dynamic_fields: [{table_calculation: representation, label: Representation, expression: "${employees.hc_at_eop}/${employees.hc_at_eop:row_total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Female - employees.hc_at_eop,
            id: Female - employees.hc_at_eop, name: Female}, {axisId: Male - employees.hc_at_eop,
            id: Male - employees.hc_at_eop, name: Male}], showLabels: false, showValues: false,
        maxValue: !!null '', minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: "$#,##0"
    series_types: {}
    series_colors:
      Female - representation: "#FBBC04"
      Male - representation: "#4285F4"
      Female - employees.hc_at_eop: "#FBBC04"
      Male - employees.hc_at_eop: "#4285F4"
      Female - employees.hc_at_eop_gender: "#FBBC04"
      Male - employees.hc_at_eop_gender: "#4285F4"
      Female - employees.avg_salary_over_time: "#FBBC04"
      Male - employees.avg_salary_over_time: "#EA4335"
      Non-Binary - employees.avg_salary_over_time: "#4285F4"
    show_dropoff: false
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    listen: {}
    row: 20
    col: 15
    width: 9
    height: 9
  - name: Diversity & Inclusion
    type: text
    title_text: Diversity & Inclusion
    subtitle_text: Gender
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 3
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=http%3A%2F%2Fwwwstickpngcom%2Fassets%2Fimages%2F584568a4746e3e42031117edpng&f=1&nofb=1"
      width="60" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.stickpng.com%2Fassets%2Fimages%2F584568a4746e3e42031117ed.png&f=1&nofb=1"
      width="60" height="60"></h1>
    subtitle_text: Organization Overview
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Headcount
    name: Headcount (2)
    model: hr_recruiting
    explore: employees_over_time
    type: single_value
    fields: [employees.displayed_timeframe, employees.hc_at_eop, employees.hires_in_period]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 2 years
    sorts: [employees.displayed_timeframe desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: New Starts in 2021
    defaults_version: 1
    hidden_fields: [employees.displayed_timeframe]
    listen: {}
    row: 3
    col: 10
    width: 5
    height: 4
  - title: 2021 Starts
    name: 2021 Starts
    model: hr_recruiting
    explore: employees_over_time
    type: single_value
    fields: [employees.hires_in_period, employees.displayed_timeframe]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 2 years
    sorts: [employees.displayed_timeframe desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    single_value_title: ''
    value_format: '"+"0'
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    listen: {}
    row: 3
    col: 0
    width: 5
    height: 4
  - title: 2021 Terms
    name: 2021 Terms
    model: hr_recruiting
    explore: employees_over_time
    type: single_value
    fields: [employees.displayed_timeframe, employees.terms_in_period]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 2 years
    sorts: [employees.displayed_timeframe desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: ''
    value_format: '"-"0'
    comparison_label: Terms in 2019
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    hidden_fields: [employees.displayed_timeframe]
    listen: {}
    row: 3
    col: 5
    width: 5
    height: 4
  - title: Annualized Attrition Rate
    name: Annualized Attrition Rate (2)
    model: hr_recruiting
    explore: employees_over_time
    type: single_value
    fields: [employees.sophisticated_attrition_rate, employees.displayed_timeframe]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 2 years
    sorts: [employees.displayed_timeframe desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: rate, label: Rate, expression: 'index(${employees.sophisticated_attrition_rate},1)/index(${employees.sophisticated_attrition_rate},2)',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B31412"
    comparison_label: Improvement on 7.33% Attrition Rate in 2019
    defaults_version: 1
    hidden_fields: [employees.displayed_timeframe]
    listen: {}
    row: 3
    col: 15
    width: 9
    height: 4
  - title: Representation
    name: Representation
    model: hr_recruiting
    explore: employees_over_time
    type: looker_column
    fields: [employees.displayed_timeframe, employees.hc_at_eop, employees.gender]
    pivots: [employees.gender]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 4 years
      employees.gender: "-NULL"
      posting_locations.posting_location: ''
      employees.most_recent_rating: ''
      posting_department.department_name: ''
    sorts: [employees.displayed_timeframe, employees.gender]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_2, label: Calculation 2, expression: 'pivot_offset(${employees.hc_at_eop},0)/(pivot_index(${employees.hc_at_eop},1)+(pivot_index(${employees.hc_at_eop},2))+(pivot_index(${employees.hc_at_eop},3)))',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: left
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: calculation_2, id: Asian+
              - calculation_2, name: Asian+}, {axisId: calculation_2, id: Black+ -
              calculation_2, name: Black+}, {axisId: calculation_2, id: Hispanic or
              Latinx+ - calculation_2, name: Hispanic or Latinx+}, {axisId: calculation_2,
            id: Native American+ - calculation_2, name: Native American+}, {axisId: calculation_2,
            id: White+ - calculation_2, name: White+}], showLabels: false, showValues: false,
        maxValue: !!null '', minValue: !!null '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: log}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: ''
    font_size: '12'
    label_value_format: 0.0%
    trellis_rows: 3
    series_types: {}
    series_colors:
      White+ - employees.hires_in_period: "#9AA0A6"
      White+ - employees.hc_at_eop: "#9AA0A6"
      Female - calculation_2: "#EA4335"
      Male - calculation_2: "#4285F4"
      Non-Binary - calculation_2: "#FBBC04"
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    charts_across: 4
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [employees.hc_at_eop]
    listen: {}
    row: 20
    col: 0
    width: 6
    height: 9
  - title: Attrition by Representation
    name: Attrition by Representation
    model: hr_recruiting
    explore: employees_over_time
    type: looker_line
    fields: [employees.displayed_timeframe, employees.sophisticated_attrition_rate,
      employees.gender]
    pivots: [employees.gender]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 4 years
      employees.displayed_timeframe: ''
      employees.gender: "-NULL"
      posting_locations.posting_location: ''
      employees.most_recent_rating: ''
      posting_department.department_name: ''
    sorts: [employees.displayed_timeframe, employees.gender]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: pivot
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    y_axes: [{label: '', orientation: left, series: [{axisId: Asian+ - employees.sophisticated_attrition_rate,
            id: Asian+ - employees.sophisticated_attrition_rate, name: Asian+}, {
            axisId: Black+ - employees.sophisticated_attrition_rate, id: Black+ -
              employees.sophisticated_attrition_rate, name: Black+}, {axisId: Hispanic
              or Latinx+ - employees.sophisticated_attrition_rate, id: Hispanic or
              Latinx+ - employees.sophisticated_attrition_rate, name: Hispanic or
              Latinx+}, {axisId: Native American+ - employees.sophisticated_attrition_rate,
            id: Native American+ - employees.sophisticated_attrition_rate, name: Native
              American+}, {axisId: White+ - employees.sophisticated_attrition_rate,
            id: White+ - employees.sophisticated_attrition_rate, name: White+}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    trellis_rows: 5
    series_types: {}
    series_colors:
      White+ - employees.terms_in_period: "#9AA0A6"
      Non-Binary - employees.sophisticated_attrition_rate: "#FBBC04"
    series_labels: {}
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: []
    hidden_points_if_no: []
    bar_range_max:
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    range_max:
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 20
    col: 6
    width: 9
    height: 9
  filters:
  - name: "\n    \n      Employee Origin\n    "
    title: "\n    \n      Employee Origin\n    "
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: origins.origin_name
  - name: Department
    title: Department
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: posting_department.department_name
  - name: Employee Type
    title: Employee Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: employees.is_people_manager
