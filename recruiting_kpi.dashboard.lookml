- dashboard: recruiting_pipeline_dashboard
  title: Recruiting Pipeline Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  elements:
  - title: Active Pipeline by Posting
    name: Active Pipeline by Posting
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [posting_department.department_name, postings.posting_title, application_funnel.applications_in_period,
      application_funnel.phone_screens_in_period, application_funnel.onsites_in_period,
      application_funnel.offers_in_period]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active
    sorts: [posting_department.department_name]
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
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    series_text_format:
      application_funnel.onsites_in_period: {}
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, custom: {
            id: 30a3d28e-cc58-9214-8eec-52e4a3ba75c2, label: Custom, type: continuous,
            stops: [{color: "#ffffff", offset: 0}, {color: "#FBBC04", offset: 50},
              {color: "#ff9974", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: maximum}}, mirror: false,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [application_funnel.applications_in_period]}, {type: along a scale...,
        value: !!null '', background_color: "#4285F4", font_color: !!null '', color_application: {
          collection_id: google, custom: {id: 971f0ce9-a4c0-2240-b98e-bb14c63251b6,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#FBBC04", offset: 50}, {color: "#ff9974", offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: minimum}, mid: {type: middle}, max: {
                type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [application_funnel.phone_screens_in_period]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: d9928f42-f57c-b72d-928f-377c4c1b0e57,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#FBBC04", offset: 50}, {color: "#ff9974", offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: minimum}, mid: {type: middle}, max: {
                type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [application_funnel.onsites_in_period]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 44d4b0b8-65f7-9cb6-ac48-fb1a1f6137ad,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#FBBC04", offset: 50}, {color: "#ff9974", offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: minimum}, mid: {type: middle}, max: {
                type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [application_funnel.offers_in_period]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, custom: {id: 9ec53099-9907-012d-4b93-f698f188f046,
            label: Custom, type: continuous, stops: [{color: "#ffffff", offset: 0},
              {color: "#FBBC04", offset: 50}, {color: "#ff9974", offset: 100}]}, options: {
            steps: 5, constraints: {min: {type: minimum}, mid: {type: middle}, max: {
                type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#34A853"
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    listen:
      Origin: origins.origin_name
    row: 16
    col: 0
    width: 24
    height: 5
  - title: New Applicants
    name: New Applicants
    model: hr_recruiting
    explore: application_funnel
    type: single_value
    fields: [application_funnel.applications_in_period, applications.inactive_application]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active,Inactive
    sorts: [application_funnel.applications_in_period desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: total_new_applicants, label: Total New Applicants,
        expression: "${application_funnel.applications_in_period:total}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4285F4"
    comparison_label: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [application_funnel.applications_in_period]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Active Applications == Not archived AND recently interacted with a
      recruiter
    listen:
      Origin: origins.origin_name
    row: 2
    col: 7
    width: 5
    height: 5
  - title: Screens
    name: Screens
    model: hr_recruiting
    explore: application_funnel
    type: single_value
    fields: [applications.inactive_application, application_funnel.phone_screens_in_period]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active,Inactive
    sorts: [application_funnel.phone_screens_in_period desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: total_new_applicants, label: Total New Applicants,
        expression: "${application_funnel.phone_screens_in_period:total}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    comparison_label: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Active Applications == Not archived AND recently interacted with a
      recruiter
    listen:
      Origin: origins.origin_name
    row: 2
    col: 12
    width: 4
    height: 5
  - title: On-Site
    name: On-Site
    model: hr_recruiting
    explore: application_funnel
    type: single_value
    fields: [applications.inactive_application, application_funnel.onsites_in_period]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active,Inactive
    sorts: [application_funnel.onsites_in_period desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: total_new_applicants, label: Total New Applicants,
        expression: "${application_funnel.onsites_in_period}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    comparison_label: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Active Applications == Not archived AND recently interacted with a
      recruiter
    listen:
      Origin: origins.origin_name
    row: 2
    col: 16
    width: 4
    height: 5
  - title: Offers
    name: Offers
    model: hr_recruiting
    explore: application_funnel
    type: single_value
    fields: [applications.inactive_application, application_funnel.offers_in_period]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active,Inactive
    sorts: [application_funnel.offers_in_period desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: total_new_applicants, label: Total New Applicants,
        expression: "${application_funnel.offers_in_period:total}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    comparison_label: ''
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Active Applications == Not archived AND recently interacted with a
      recruiter
    listen:
      Origin: origins.origin_name
    row: 2
    col: 20
    width: 4
    height: 5
  - title: Active Pipeline
    name: Active Pipeline
    model: hr_recruiting
    explore: application_funnel
    type: marketplace_viz_sunburst::sunburst-marketplace
    fields: [stages.stage_name_clean, application_funnel.count]
    filters:
      application_funnel.event_date: 1 years
      applications.inactive_application: Active
    sorts: [application_funnel.count desc, stages.stage_name_clean]
    limit: 500
    dynamic_fields: [{table_calculation: total_new_applicants, label: Total New Applicants,
        expression: "${application_funnel.offers_in_period:total}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: America/Los_Angeles
    hidden_fields: []
    hidden_points_if_no: []
    series_labels:
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      application_funnel.hires_in_period: Hires
    show_view_names: false
    color_range: ["#4285F4", "#EA4335", "#FBBC04", "#34A852", "#5F6368"]
    color_by: root
    show_null_points: true
    value_format_override: ''
    show_percent: true
    chart_type: Line
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    series_colors:
      application_funnel.hires_in_period: "#34A853"
    font_size_main: ''
    style_stages.stage_name_clean: "#3A4245"
    show_title_stages.stage_name_clean: true
    title_placement_stages.stage_name_clean: above
    value_format_stages.stage_name_clean: ''
    show_comparison_application_funnel.count: false
    comparison_style_application_funnel.count: value
    comparison_show_label_application_funnel.count: true
    comparison_label_placement_application_funnel.count: below
    style_application_funnel.count: "#3A4245"
    show_title_application_funnel.count: true
    title_placement_application_funnel.count: above
    value_format_application_funnel.count: ''
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: columns
    labelPosition: hidden
    percentType: total
    percentPosition: hidden
    valuePosition: inline
    labelColorEnabled: true
    labelColor: "#FFF"
    custom_color_enabled: true
    custom_color: "#34A853"
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}, {type: along
          a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
              max: {type: maximum}}, mirror: false, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: []}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      posting_department.department_name: 164
      postings.posting_title: 374
    series_cell_visualizations:
      application_funnel.count:
        is_active: true
      application_funnel.applications_in_period:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.applications_in_period,
            id: application_funnel.applications_in_period, name: 01. Count of New
              Applicants}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    interpolation: monotone
    defaults_version: 0
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
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
    bar_range_max: 5000
    note_state: collapsed
    note_display: hover
    note_text: Active Applications == Not archived AND recently interacted with a
      recruiter
    listen:
      Origin: origins.origin_name
    row: 0
    col: 0
    width: 7
    height: 7
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=https%3A%2F%2Fstaticthenounprojectcom%2Fpng%2F216568-200png&f=1&nofb=1"
      width="60" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.thenounproject.com%2Fpng%2F216568-200.png&f=1&nofb=1"
      width="60" height="60"></h1>
    subtitle_text: Recruiting Pipeline
    body_text: ''
    row: 0
    col: 7
    width: 17
    height: 2
  - title: Active Pipeline by Location
    name: Active Pipeline by Location
    model: hr_recruiting
    explore: application_funnel
    type: looker_column
    fields: [posting_locations.posting_location, stages.stage_name_clean, application_funnel.count]
    pivots: [stages.stage_name_clean]
    filters:
      applications.inactive_application: Active
    sorts: [application_funnel.count desc 0, stages.stage_name_clean]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.count,
            id: 01. New Applicant - application_funnel.count, name: 01. New Applicant},
          {axisId: application_funnel.count, id: 02. Screen - application_funnel.count,
            name: 02. Screen}, {axisId: application_funnel.count, id: 03. On-Site
              Interview - application_funnel.count, name: 03. On-Site Interview},
          {axisId: application_funnel.count, id: 04. Offer - application_funnel.count,
            name: 04. Offer}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      01. New Applicant - application_funnel.count: New Applicant
      02. Screen - application_funnel.count: Screen
      03. On-Site Interview - application_funnel.count: On-Site Interview
      04. Offer - application_funnel.count: Offer
    defaults_version: 1
    listen:
      Origin: origins.origin_name
    row: 21
    col: 0
    width: 12
    height: 7
  - title: Active Pipeline by Department
    name: Active Pipeline by Department
    model: hr_recruiting
    explore: application_funnel
    type: looker_column
    fields: [stages.stage_name_clean, application_funnel.count, posting_department.department_name]
    pivots: [stages.stage_name_clean]
    filters:
      applications.inactive_application: Active
    sorts: [application_funnel.count desc 0, stages.stage_name_clean]
    limit: 500
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
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.count,
            id: 01. New Applicant - application_funnel.count, name: 01. New Applicant},
          {axisId: application_funnel.count, id: 02. Screen - application_funnel.count,
            name: 02. Screen}, {axisId: application_funnel.count, id: 03. On-Site
              Interview - application_funnel.count, name: 03. On-Site Interview},
          {axisId: application_funnel.count, id: 04. Offer - application_funnel.count,
            name: 04. Offer}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_labels:
      01. New Applicant - application_funnel.count: New Applicant
      02. Screen - application_funnel.count: Screen
      03. On-Site Interview - application_funnel.count: On-Site Interview
      04. Offer - application_funnel.count: Offer
    defaults_version: 1
    listen:
      Origin: origins.origin_name
    row: 21
    col: 12
    width: 12
    height: 7
  - title: Recruiter Pipelines
    name: Recruiter Pipelines
    model: hr_recruiting
    explore: application_funnel
    type: looker_grid
    fields: [employees.employee_name, application_funnel.applications_in_period, application_funnel.phone_screens_in_period,
      application_funnel.onsites_in_period, application_funnel.offers_in_period]
    filters:
      applications.inactive_application: Active
    sorts: [application_funnel.applications_in_period desc]
    limit: 500
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
      01. New Applicant - application_funnel.count: New Applicant
      02. Screen - application_funnel.count: Screen
      03. On-Site Interview - application_funnel.count: On-Site Interview
      04. Offer - application_funnel.count: Offer
      application_funnel.applications_in_period: New Applicants
      application_funnel.phone_screens_in_period: Screens
      application_funnel.onsites_in_period: On-Sites
      application_funnel.offers_in_period: Offers
      employees.employee_name: Recruiter
    series_cell_visualizations:
      application_funnel.applications_in_period:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: [application_funnel.offers_in_period]}, {type: along a scale..., value: !!null '',
        background_color: "#4285F4", font_color: !!null '', color_application: {collection_id: google,
          palette_id: google-sequential-0}, bold: false, italic: false, strikethrough: false,
        fields: [application_funnel.applications_in_period]}, {type: along a scale...,
        value: !!null '', background_color: "#4285F4", font_color: !!null '', color_application: {
          collection_id: google, palette_id: google-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: [application_funnel.phone_screens_in_period]},
      {type: along a scale..., value: !!null '', background_color: "#4285F4", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: [application_funnel.onsites_in_period]}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: application_funnel.count,
            id: 01. New Applicant - application_funnel.count, name: 01. New Applicant},
          {axisId: application_funnel.count, id: 02. Screen - application_funnel.count,
            name: 02. Screen}, {axisId: application_funnel.count, id: 03. On-Site
              Interview - application_funnel.count, name: 03. On-Site Interview},
          {axisId: application_funnel.count, id: 04. Offer - application_funnel.count,
            name: 04. Offer}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    series_types: {}
    listen:
      Origin: origins.origin_name
    row: 7
    col: 0
    width: 24
    height: 6
  - name: <h1><img src="https://external-contentduckduckgocom/iu/?u=https%3A%2F%2Fgetdrawingscom%2Ffree-icon-bw%2Fpipeline-icon-14png&f=1&nofb=1"
      width="60" height="60"></h1>
    type: text
    title_text: <h1><img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fgetdrawings.com%2Ffree-icon-bw%2Fpipeline-icon-14.png&f=1&nofb=1"
      width="60" height="60"></h1>
    subtitle_text: Recruiting Pipeline Breakdown
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 3
  filters:
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
