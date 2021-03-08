- dashboard: fakeco_inc__employee_dashboard
  title: FakeCo Inc. Employee Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Employee Tenure
    name: Employee Tenure
    model: hr_recruiting
    explore: employee_data
    type: looker_column
    fields: [employees.employee_tenure_bucketed, posting_locations.posting_location,
      employees.headcount2]
    pivots: [employees.employee_tenure_bucketed]
    fill_fields: [employees.employee_tenure_bucketed]
    filters:
      employees.user_status: Active
    sorts: [employees.employee_tenure_bucketed, posting_locations.posting_location]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Austin - employees.count,
            id: Austin - employees.count, name: Austin}, {axisId: Bay Area - employees.count,
            id: Bay Area - employees.count, name: Bay Area}, {axisId: London - employees.count,
            id: London - employees.count, name: London}, {axisId: Seattle - employees.count,
            id: Seattle - employees.count, name: Seattle}, {axisId: Tokyo - employees.count,
            id: Tokyo - employees.count, name: Tokyo}], showLabels: true, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Employee Tenure (Months)
    hide_legend: false
    font_size: ''
    series_types: {}
    series_colors:
      Austin - employees.count: "#1A73E8"
      Bay Area - employees.count: "#D93025"
      London - employees.count: "#F9AB00"
      Seattle - employees.count: "#1E8E3E"
      Tokyo - employees.count: "#B2A898"
      Below 6 - 0 - employees.count: "#4285F4"
      6 to 11 - 1 - employees.count: "#EA4335"
      12 to 17 - 2 - employees.count: "#FBBC04"
      18 to 23 - 3 - employees.count: "#34A853"
      24 to 35 - 4 - employees.count: "#B2A898"
      36 or Above - 5 - employees.count: "#7F7977"
      Below 6 - 0 - employees.headcount2: "#4285F4"
      6 to 11 - 1 - employees.headcount2: "#EA4335"
      12 to 17 - 2 - employees.headcount2: "#FBBC04"
      18 to 23 - 3 - employees.headcount2: "#34A853"
      24 to 35 - 4 - employees.headcount2: "#B2A898"
      36 or Above - 5 - employees.headcount2: "#7F7977"
    charts_across: 2
    defaults_version: 1
    show_null_points: true
    value_labels: legend
    label_type: labPer
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    note_state: collapsed
    note_display: hover
    note_text: By Location
    listen:
      Department Name: posting_department_mapping.department_name
      Most Recent Rating: employees.most_recent_performance_review
      Location: posting_locations.posting_location
    row: 2
    col: 17
    width: 7
    height: 9
  - title: Headcount Increase Over Time
    name: Headcount Increase Over Time
    model: hr_recruiting
    explore: employee_data
    type: looker_column
    fields: [employees.headcount, employees.start_quarter, posting_locations.posting_location]
    pivots: [posting_locations.posting_location]
    fill_fields: [employees.start_quarter]
    sorts: [employees.start_quarter, posting_locations.posting_location]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    y_axes: [{label: '', orientation: left, series: [{axisId: employees.headcount,
            id: employees.headcount, name: Headcount Running Total}], showLabels: false,
        showValues: false, maxValue: 750, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      employees.headcount: "#1E8E3E"
      Bay Area - employees.headcount: "#4285F4"
      London - employees.headcount: "#FBBC04"
      Seattle - employees.headcount: "#EA4335"
      Tokyo - employees.headcount: "#34A853"
      Austin - employees.headcount: "#B2A898"
    label_color: ["#1E8E3E"]
    show_null_points: true
    interpolation: monotone
    up_color: "#64518A"
    down_color: "#8D7FB9"
    total_color: "#EA8A2F"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: By Office
    listen:
      Department Name: posting_department_mapping.department_name
      Most Recent Rating: employees.most_recent_performance_review
      Location: posting_locations.posting_location
    row: 13
    col: 0
    width: 16
    height: 8
  - title: Most Recent Performance Rating
    name: Most Recent Performance Rating
    model: hr_recruiting
    explore: employee_data
    type: looker_bar
    fields: [employees.most_recent_performance_review, employees.headcount2, posting_department_mapping.department_name]
    pivots: [employees.most_recent_performance_review]
    sorts: [employees.headcount2 desc 0, posting_department_mapping.department_name, employees.most_recent_performance_review
        desc]
    limit: 500
    row_total: right
    dynamic_fields: [{table_calculation: average_headcount, label: Average Headcount,
        expression: "(sum(${employees.headcount2})/count(${employees.headcount2}))",
        value_format: !!null '', value_format_name: decimal_0, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {table_calculation: percent_rating,
        label: Percent Rating, expression: "${employees.headcount2}/${employees.headcount2:row_total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Needs Improvement -
              employees.headcount2, id: Needs Improvement - employees.headcount2,
            name: Needs Improvement}, {axisId: Meets Expectations - employees.headcount2,
            id: Meets Expectations - employees.headcount2, name: Meets Expectations},
          {axisId: Exceeds Expectations - employees.headcount2, id: Exceeds Expectations
              - employees.headcount2, name: Exceeds Expectations}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      Needs Improvement - employees.headcount2: "#EA4335"
      Meets Expectations - employees.headcount2: "#B2A898"
      Exceeds Expectations - employees.headcount2: "#4285F4"
    series_labels:
      employees.headcount2: Headcount
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      employees.headcount2:
        is_active: true
        palette:
          palette_id: ca806ee0-336d-47c1-aaa1-bc9a646f196a
          collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2
      percent_rating:
        is_active: true
        palette:
          palette_id: ca806ee0-336d-47c1-aaa1-bc9a646f196a
          collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#64518A",
        font_color: !!null '', color_application: {collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2,
          palette_id: be399730-da66-495b-83ce-202fb30b3c67}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    custom_color: "#4285F4"
    show_single_value_title: true
    single_value_title: Average Span of Control
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields: [percent_rating]
    show_null_points: true
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: hover
    note_text: By Department
    listen:
      Department Name: posting_department_mapping.department_name
      Most Recent Rating: employees.most_recent_performance_review
      Location: posting_locations.posting_location
    row: 2
    col: 0
    width: 8
    height: 9
  - title: Average USD Salary
    name: Average USD Salary
    model: hr_recruiting
    explore: employee_data
    type: looker_column
    fields: [employees.avg_salary, posting_department_mapping.department_name, posting_locations.posting_location]
    pivots: [posting_department_mapping.department_name]
    filters:
      employees.currency: USD
    sorts: [employees.avg_salary desc 0, posting_locations.posting_location, posting_department_mapping.department_name]
    limit: 500
    dynamic_fields: [{table_calculation: percent_rating, label: Percent Rating, expression: "${employees.headcount2}/${employees.headcount2:row_total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: true
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Needs Improvement -
              employees.headcount2, id: Needs Improvement - employees.headcount2,
            name: Needs Improvement}, {axisId: Meets Expectations - employees.headcount2,
            id: Meets Expectations - employees.headcount2, name: Meets Expectations},
          {axisId: Exceeds Expectations - employees.headcount2, id: Exceeds Expectations
              - employees.headcount2, name: Exceeds Expectations}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: []
    font_size: '12'
    series_types: {}
    series_colors:
      Needs Improvement - employees.headcount2: "#EA4335"
      Meets Expectations - employees.headcount2: "#FBBC04"
      Exceeds Expectations - employees.headcount2: "#4285F4"
      Customer Support - employees.avg_salary: "#4285F4"
      G&A - employees.avg_salary: "#EA4335"
      Marketing - employees.avg_salary: "#FBBC04"
      R&D - employees.avg_salary: "#34A853"
      Sales - employees.avg_salary: "#B2A898"
    series_labels:
      employees.headcount2: Headcount
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      employees.headcount2:
        is_active: true
        palette:
          palette_id: ca806ee0-336d-47c1-aaa1-bc9a646f196a
          collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2
      percent_rating:
        is_active: true
        palette:
          palette_id: ca806ee0-336d-47c1-aaa1-bc9a646f196a
          collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#64518A",
        font_color: !!null '', color_application: {collection_id: f32bb91f-4034-496c-8f14-3dbd2b5d9fc2,
          palette_id: be399730-da66-495b-83ce-202fb30b3c67}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    custom_color: "#4285F4"
    show_single_value_title: true
    single_value_title: Average Span of Control
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    value_labels: legend
    label_type: labPer
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    hide_totals: false
    hide_row_totals: false
    note_state: collapsed
    note_display: hover
    note_text: By Location
    listen:
      Department Name: posting_department_mapping.department_name
      Most Recent Rating: employees.most_recent_performance_review
      Location: posting_locations.posting_location
    row: 2
    col: 9
    width: 7
    height: 9
  - name: Performance
    type: text
    title_text: Performance
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 8
    height: 2
  - name: Salary
    type: text
    title_text: Salary
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 9
    width: 8
    height: 2
  - name: Headcount
    type: text
    title_text: Headcount
    subtitle_text: ''
    body_text: ''
    row: 11
    col: 0
    width: 16
    height: 2
  - name: Tenure
    type: text
    title_text: Tenure
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 17
    width: 7
    height: 2
  - title: Attrition Over Time
    name: Attrition Over Time
    model: hr_recruiting
    explore: employees_over_time
    type: looker_line
    fields: [employees.displayed_timeframe, employees.sophisticated_attrition_rate,
      posting_department_mapping.department_name]
    pivots: [posting_department_mapping.department_name]
    filters:
      employees.timeframe_selector: QUARTER
      employees.date: 4 quarters ago for 4 quarters
    sorts: [employees.displayed_timeframe, posting_department_mapping.department_name]
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
    series_types: {}
    series_colors:
      Below 6 - 0 - employees.hc_at_eop: "#FDD663"
      6 to 11 - 1 - employees.hc_at_eop: "#34AB53"
      12 to 17 - 2 - employees.hc_at_eop: "#EA4335"
      18 to 23 - 3 - employees.hc_at_eop: "#4285F4"
      24 to 35 - 4 - employees.hc_at_eop: "#0D652D"
      36 or Above - 5 - employees.hc_at_eop: "#E37400"
      Customer Support - employees.sophisticated_attrition_rate: "#1967D2"
      G&A - employees.sophisticated_attrition_rate: "#D93025"
      Marketing - employees.sophisticated_attrition_rate: "#FBBC04"
      R&D - employees.sophisticated_attrition_rate: "#1E8E3E"
      Sales - employees.sophisticated_attrition_rate: "#A8DAB5"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: By Department
    listen:
      Department Name: posting_department_mapping.department_name
      Most Recent Rating: employees.most_recent_performance_review
      Location: posting_locations.posting_location
    row: 13
    col: 17
    width: 7
    height: 8
  - name: Attrition
    type: text
    title_text: Attrition
    subtitle_text: ''
    body_text: ''
    row: 11
    col: 17
    width: 7
    height: 2
  filters:
  # - name: Department Name
  #   title: Department Name
  #   type: field_filter
  #   default_value: ''
  #   allow_multiple_values: true
  #   required: false
  #   ui_config:
  #     type: checkboxes
  #     display: popover
  #   model: hr_recruiting
  #   explore: employee_data
  #   listens_to_filters: []
  #   field: posting_department_mapping.department_name
  # - name: Most Recent Rating
  #   title: Most Recent Rating
  #   type: field_filter
  #   default_value: ''
  #   allow_multiple_values: true
  #   required: false
  #   ui_config:
  #     type: checkboxes
  #     display: popover
  #   model: hr_recruiting
  #   explore: employee_data
  #   listens_to_filters: []
  #   field: employees.most_recent_performance_review
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: hr_recruiting
    explore: employee_data
    listens_to_filters: []
    field: posting_locations.posting_location
