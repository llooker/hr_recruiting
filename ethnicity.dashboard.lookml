- dashboard: ethnicity_dashboard
  title: Ethnicity Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: ''
    name: ''
    model: hr_recruiting
    explore: employees_over_time
    type: looker_column
    fields: [employees.ethnicity, employees.displayed_timeframe, employees.hc_at_eop]
    pivots: [employees.ethnicity]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 4 years
      employees.ethnicity: Asian+,Black+,Hispanic or Latinx+,Native American+,White+
    sorts: [employees.ethnicity 0, employees.displayed_timeframe]
    limit: 500
    dynamic_fields: [{table_calculation: representation, label: Representation, expression: "${employees.hc_at_eop}/(pivot_offset(${employees.hc_at_eop},5))",
        value_format: !!null '', value_format_name: percent_0, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {table_calculation: calculation_2,
        label: Calculation 2, expression: 'pivot_offset(${employees.hc_at_eop},0)/(pivot_index(${employees.hc_at_eop},1)+(pivot_index(${employees.hc_at_eop},2)+(pivot_index(${employees.hc_at_eop},3)+(pivot_index(${employees.hc_at_eop},4)+(pivot_index(${employees.hc_at_eop},5))))))',
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
    y_axes: [{label: '', orientation: left, series: [{axisId: Asian+ - calculation_2,
            id: Asian+ - calculation_2, name: Asian+}, {axisId: Black+ - calculation_2,
            id: Black+ - calculation_2, name: Black+}, {axisId: Hispanic or Latinx+
              - calculation_2, id: Hispanic or Latinx+ - calculation_2, name: Hispanic
              or Latinx+}, {axisId: Native American+ - calculation_2, id: Native American+
              - calculation_2, name: Native American+}, {axisId: White+ - calculation_2,
            id: White+ - calculation_2, name: White+}], showLabels: false, showValues: false,
        maxValue: !!null '', minValue: !!null '', unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: ''
    font_size: '12'
    trellis_rows: 5
    series_types: {}
    series_colors:
      White+ - employees.hires_in_period: "#9AA0A6"
      White+ - employees.hc_at_eop: "#9AA0A6"
      White+ - calculation_2: "#E8EAED"
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    charts_across: 4
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [employees.hc_at_eop]
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 8
    col: 0
    width: 17
    height: 8
  - title: ''
    name: " (2)"
    model: hr_recruiting
    explore: employees_over_time
    type: marketplace_viz_multiple_value::multiple_value-marketplace
    fields: [employees.pct_black_hc, employees.pct_hispanic_or_latinx_hc, employees.pct_native_american_hc,
      employees.pct_white_hc, employees.pct_asian_hc]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 1 years
      employees.ethnicity: "-NULL"
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    font_size_main: ''
    orientation: auto
    style_employees.pct_black_hc: "#EA4335"
    show_title_employees.pct_black_hc: true
    title_override_employees.pct_black_hc: Black+ Representation
    title_placement_employees.pct_black_hc: above
    value_format_employees.pct_black_hc: 0.0%
    style_employees.pct_hispanic_or_latinx_hc: "#FBBC04"
    show_title_employees.pct_hispanic_or_latinx_hc: true
    title_override_employees.pct_hispanic_or_latinx_hc: Hispanic or Latinx+ Representation
    title_placement_employees.pct_hispanic_or_latinx_hc: above
    value_format_employees.pct_hispanic_or_latinx_hc: 0.0%
    show_comparison_employees.pct_hispanic_or_latinx_hc: false
    style_employees.pct_native_american_hc: "#34A853"
    show_title_employees.pct_native_american_hc: true
    title_override_employees.pct_native_american_hc: Native American+ Representation
    title_placement_employees.pct_native_american_hc: above
    value_format_employees.pct_native_american_hc: 0.0%
    show_comparison_employees.pct_native_american_hc: false
    style_employees.pct_white_hc: "#9AA0A6"
    show_title_employees.pct_white_hc: true
    title_override_employees.pct_white_hc: White+ Representation
    title_placement_employees.pct_white_hc: above
    value_format_employees.pct_white_hc: 0.0%
    show_comparison_employees.pct_white_hc: false
    style_employees.pct_asian_hc: "#4285F4"
    show_title_employees.pct_asian_hc: true
    title_override_employees.pct_asian_hc: Asian+ Representation
    title_placement_employees.pct_asian_hc: above
    value_format_employees.pct_asian_hc: ''
    show_comparison_employees.pct_asian_hc: false
    style_employees.pct_asain_hc: "#4285F4"
    show_title_employees.pct_asain_hc: true
    title_override_employees.pct_asain_hc: Asian+ Representation
    title_placement_employees.pct_asain_hc: above
    value_format_employees.pct_asain_hc: 0.0%
    show_comparison_employees.pct_black_hc: false
    title_overrride_employees.pct_asain_hc: Asian+
    title_overrride_employees.pct_black_hc: Black+
    title_overrride_employees.pct_hispanic_or_latinx_hc: Hispanic or Latinx+
    title_overrride_employees.pct_native_american_hc: Native American+
    title_overrride_employees.pct_white_hc: White+
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A852", "#9AA0A6"]
    color_by: root
    show_null_points: true
    value_format_override: ''
    show_percent: true
    font_size: small
    chart_type: Pie
    style_employees.ethnicity: "#3A4245"
    show_title_employees.ethnicity: true
    title_placement_employees.ethnicity: above
    value_format_employees.ethnicity: ''
    show_comparison_representation: true
    comparison_style_representation: value
    comparison_show_label_representation: true
    comparison_label_representation: of company
    comparison_label_placement_representation: below
    comp_value_format_representation: ''
    style_representation: "#3A4245"
    show_title_representation: true
    title_placement_representation: above
    value_format_representation: ''
    pos_is_bad_representation: false
    show_value_labels: true
    charts_across: 4
    series_colors:
      White+ - employees.hires_in_period: "#9AA0A6"
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: Asian+ - employees.hc_at_eop,
            id: Asian+ - employees.hc_at_eop, name: Asian+}, {axisId: Black+ - employees.hc_at_eop,
            id: Black+ - employees.hc_at_eop, name: Black+}, {axisId: Hispanic or
              Latinx+ - employees.hc_at_eop, id: Hispanic or Latinx+ - employees.hc_at_eop,
            name: Hispanic or Latinx+}, {axisId: Native American+ - employees.hc_at_eop,
            id: Native American+ - employees.hc_at_eop, name: Native American+}, {
            axisId: White+ - employees.hc_at_eop, id: White+ - employees.hc_at_eop,
            name: White+}, {axisId: employees.ethnicity___null - employees.hc_at_eop,
            id: employees.ethnicity___null - employees.hc_at_eop, name: "∅"}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    trellis: row
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 0
    value_labels: legend
    label_type: labPer
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
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    range_max: 1
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 2
    col: 0
    width: 14
    height: 4
  - name: Change Over Time
    type: text
    title_text: Change Over Time
    subtitle_text: ''
    body_text: ''
    row: 6
    col: 0
    width: 17
    height: 2
  - name: Current Representation
    type: text
    title_text: Current Representation
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 14
    height: 2
  - name: Upcoming Events
    type: text
    title_text: Upcoming Events
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 14
    width: 10
    height: 2
  - name: Representation Target
    type: text
    title_text: Representation Target
    subtitle_text: '2021'
    body_text: ''
    row: 6
    col: 17
    width: 7
    height: 2
  - title: ''
    name: " (3)"
    model: hr_recruiting
    explore: employees_over_time
    type: looker_column
    fields: [employees.displayed_timeframe, calculation_4, employees.hc_at_eop, employees.ethnicity]
    pivots: [employees.ethnicity]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 1 years
      employees.ethnicity: "-NULL"
    sorts: [employees.hc_at_eop desc 0, employees.ethnicity]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_3, label: Calculation 3, expression: 'if(${employees.ethnicity}="Asian+",pivot_offset(${employees.hc_at_eop},0)+10,if(${employees.ethnicity}="Black+",pivot_offset(${employees.hc_at_eop},0)+18,if(${employees.ethnicity}="Hispanic
          or Latinx+",pivot_offset(${employees.hc_at_eop},0)+15,if(${employees.ethnicity}="Native
          American+",pivot_offset(${employees.hc_at_eop},0)+9,if(${employees.ethnicity}="White+",pivot_offset(${employees.hc_at_eop},0)+18,null)))))',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: calculation_5, label: Calculation
          5, expression: 'pivot_index(${calculation_3},1)+pivot_index(${calculation_3},2)+pivot_index(${calculation_3},3)+pivot_index(${calculation_3},4)+pivot_index(${calculation_3},5)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: supermeasure,
        _type_hint: number}, {dimension: calculation_4, label: Calculation 4, expression: 'extract_years(add_years(1,${employees.date}))',
        value_format: !!null '', value_format_name: id, _kind_hint: dimension, _type_hint: number},
      {table_calculation: calculation_4_2, label: Calculation 4, expression: "${calculation_3}/${calculation_5}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
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
    legend_position: right
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: Asian+ - calculation_4_2,
            id: Asian+ - calculation_4_2, name: Asian+}, {axisId: Black+ - calculation_4_2,
            id: Black+ - calculation_4_2, name: Black+}, {axisId: Hispanic or Latinx+
              - calculation_4_2, id: Hispanic or Latinx+ - calculation_4_2, name: Hispanic
              or Latinx+}, {axisId: Native American+ - calculation_4_2, id: Native
              American+ - calculation_4_2, name: Native American+}, {axisId: White+
              - calculation_4_2, id: White+ - calculation_4_2, name: White+}], showLabels: false,
        showValues: false, maxValue: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hide_legend: false
    font_size: '12'
    series_types: {}
    series_colors:
      employees.native_american_hc_at_eop: "#34A853"
      employees.black_hc_at_eop: "#EA4335"
      employees.white_hc_at_eop: "#9AA0A6"
      employees.hispanic_or_latinx_hc_at_eop: "#FBBC04"
      White+ - calculation_3: "#9AA0A6"
      White+ - calculation_4_2: "#E8EAED"
    series_labels:
      employees.asain_hc_at_eop: Asian+
      employees.native_american_hc_at_eop: Native American+
      employees.black_hc_at_eop: Black+
      employees.white_hc_at_eop: White+
      employees.hispanic_or_latinx_hc_at_eop: Hispanic or Latinx+
    show_null_points: true
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_fields: [employees.hc_at_eop, employees.displayed_timeframe, calculation_5,
      calculation_3]
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 8
    col: 17
    width: 7
    height: 8
  - title: ''
    name: " (4)"
    model: hr_recruiting
    explore: employees_over_time
    type: looker_line
    fields: [employees.ethnicity, employees.displayed_timeframe, employees.sophisticated_attrition_rate]
    pivots: [employees.ethnicity]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 4 years
      employees.ethnicity: "-NULL"
      employees.displayed_timeframe: ''
    sorts: [employees.ethnicity 0, employees.displayed_timeframe]
    limit: 500
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
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 18
    col: 0
    width: 17
    height: 8
  - name: Turnover
    type: text
    title_text: Turnover
    subtitle_text: What is the annualized attrition rate amongst groups?
    body_text: ''
    row: 16
    col: 0
    width: 17
    height: 2
  - title: Wage Gap Analysis
    name: Wage Gap Analysis
    model: hr_recruiting
    explore: employees_over_time
    type: looker_grid
    fields: [employees.ethnicity, employees.avg_salary_over_time]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 1 years
      employees.ethnicity: "-NULL"
      employees.currency: USD
    sorts: [employees.ethnicity]
    limit: 500
    dynamic_fields: [{table_calculation: white, label: White+, expression: 'index(${employees.avg_salary_over_time},5)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: wage_gap, label: Wage Gap, expression: "${employees.avg_salary_over_time}/${white}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
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
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      white: White+
      employees.avg_salary_over_time: Avg. Salary
    series_cell_visualizations:
      employees.avg_salary_over_time:
        is_active: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '1'
    header_background_color: "#FBBC04"
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
    y_axes: [{label: '', orientation: left, series: [{axisId: white, id: white, name: White+},
          {axisId: other, id: other, name: Other}], showLabels: false, showValues: false,
        maxValue: !!null '', minValue: 100000, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      White+ - employees.hires_in_period: "#9AA0A6"
      Meets Expectations - employees.hc_at_eop: "#E8EAED"
      Needs Improvement - employees.hc_at_eop: "#EA4335"
      Exceeds Expectations - employees.hc_at_eop: "#4285F4"
      other: "#E8EAED"
    label_color: ["#"]
    show_dropoff: true
    charts_across: 4
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields:
    note_state: expanded
    note_display: above
    note_text: Explore for more detail
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 18
    col: 17
    width: 7
    height: 8
  - name: Wage Gap Analysis (2)
    type: text
    title_text: Wage Gap Analysis
    subtitle_text: ''
    body_text: ''
    row: 16
    col: 17
    width: 7
    height: 2
  - title: Upcoming Events
    name: Upcoming Events (2)
    model: hr_recruiting
    explore: employees_over_time
    type: looker_grid
    fields: [employees.ethnicity]
    filters:
      employees.timeframe_selector: YEAR
      employees.date: 4 years
      employees.ethnicity: "-NULL"
    sorts: [employees.ethnicity]
    limit: 500
    dynamic_fields: [{table_calculation: event_date, label: Event Date, expression: 'if(${upcoming_events}
          = "Sistas in Sales",to_string(concat(extract_months(add_days(3,now())),"/",extract_days(add_days(3,now())),"/",extract_years(add_days(3,now())))),if(${upcoming_events}
          = "Bay Area Asian Professionals: Tour Alcatraz",to_string(concat(extract_months(add_days(12,now())),"/",extract_days(add_days(12,now())),"/",extract_years(add_days(12,now())))),if(${upcoming_events}
          = "Women in Tech",to_string(concat(extract_months(add_days(15,now())),"/",extract_days(add_days(15,now())),"/",extract_years(add_days(15,now())))),if(${upcoming_events}
          = "Bay Area Asian Professionals: Roller Skating Night",to_string(concat(extract_months(add_days(25,now())),"/",extract_days(add_days(25,now())),"/",extract_years(add_days(25,now())))),if(${upcoming_events}
          = "Latinas in Tech",to_string(concat(extract_months(add_days(42,now())),"/",extract_days(add_days(42,now())),"/",extract_years(add_days(42,now())))),${upcoming_events})))))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {table_calculation: upcoming_events, label: Upcoming
          Events, expression: 'if(${employees.ethnicity} = "Asian+","Sistas in Sales",if(${employees.ethnicity}
          = "Black+","Bay Area Asian Professionals: Tour Alcatraz",if(${employees.ethnicity}
          = "Hispanic or Latinx+","Women in Tech",if(${employees.ethnicity} = "Native
          American+","Bay Area Asian Professionals: Roller Skating Night",if(${employees.ethnicity}
          = "White+","Latinas in Tech",${employees.ethnicity})))))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string},
      {table_calculation: websites, label: Websites, expression: 'if(${upcoming_events}="Sistas
          in Sales","sistasinsales.com",if(${upcoming_events}="Bay Area Asian Professionals:
          Tour Alcatraz","meetup.com/Bay-Area-Asian-Professionals/",if(${upcoming_events}="Bay
          Area Asian Professionals: Roller Skating Night","meetup.com/Bay-Area-Asian-Professionals/",if(${upcoming_events}="Women
          in Tech","womenintechnology.org/",if(${upcoming_events}="Latinas in Tech","https://www.latinasintech.org/",null)))))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
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
    hidden_fields: [employees.ethnicity]
    series_types: {}
    listen:
      Location: posting_locations.posting_location
      Department: posting_department.department_name
      Most Recent Rating: employees.most_recent_rating
    row: 2
    col: 14
    width: 10
    height: 4
  filters:
  - name: Location
    title: Location
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: posting_locations.posting_location
  - name: Most Recent Rating
    title: Most Recent Rating
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: employees.most_recent_rating
  - name: Department
    title: Department
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: hr_recruiting
    explore: employees_over_time
    listens_to_filters: []
    field: posting_department.department_name
