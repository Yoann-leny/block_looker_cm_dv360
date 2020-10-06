- dashboard: crg_digital_snapshot_v2
  title: CRG Digital Snapshot v3
  layout: newspaper
  elements:
  - name: Media Spend (Last 30 days)
    title: Media Spend (Last 30 days)
    merged_queries:
    - model: google_adwords
      explore: master_stats
      type: table
      fields: [master_stats.total_cost_usd, ad_group._data_date]
      fill_fields: [ad_group._data_date]
      filters:
        ad_group._data_date: 30 days
      sorts: [ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_analytics_block
      explore: facebook_ads
      type: table
      fields: [facebook_ads.date_start_date, facebook_ads.total_spend]
      fill_fields: [facebook_ads.date_start_date]
      filters:
        facebook_ads.date_start_date: 30 days
      sorts: [facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: facebook_ads.date_start_date
        source_field_name: ad_group._data_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Media Spend
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    hidden_fields: [master_stats.total_cost_usd, facebook_ads.total_spend, percent_change,
      total]
    series_types: {}
    sorts: [ad_group._data_date desc]
    dynamic_fields: [{table_calculation: total_sum, label: Total Sum, expression: 'sum(${total})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: total, label: Total, expression: 'coalesce(${master_stats.total_cost_usd},0)+coalesce(${facebook_ads.total_spend},0)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: percent_change, label: Percent Change, expression: "${total}/offset(${total},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: yesterday, label: Yesterday, expression: 'offset(${total},1)',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    row: 12
    col: 0
    width: 6
    height: 4
  - name: Impressions
    title: Impressions
    merged_queries:
    - model: google_adwords
      explore: master_stats
      type: table
      fields: [ad_group._data_date, master_stats.total_impressions]
      fill_fields: [ad_group._data_date]
      filters:
        ad_group._data_date: 30 days
      sorts: [ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_analytics_block
      explore: facebook_ads
      type: table
      fields: [facebook_ads.date_start_date, facebook_ads.total_impressions]
      fill_fields: [facebook_ads.date_start_date]
      sorts: [facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: facebook_ads.date_start_date
        source_field_name: ad_group._data_date
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    hidden_fields: [total, facebook_ads.total_impressions, master_stats.total_impressions,
      ad_group._data_date]
    series_types: {}
    dynamic_fields: [{table_calculation: total, label: Total, expression: "${master_stats.total_impressions}+coalesce(${facebook_ads.total_impressions},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_sum, label: Total Sum, expression: 'sum(${total})',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: goal, label: Goal, expression: '15000000',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: dimension,
        _type_hint: number}]
    row: 8
    col: 6
    width: 6
    height: 4
  - name: TOP-LINE RESULTS
    type: text
    title_text: TOP-LINE RESULTS
    row: 0
    col: 0
    width: 12
    height: 2
  - name: KEY ACTIVITIES
    type: text
    title_text: KEY ACTIVITIES
    row: 0
    col: 12
    width: 12
    height: 2
  - name: Brand Social - Messaging mix
    title: Brand Social - Messaging mix
    merged_queries:
    - model: google_adwords
      explore: master_stats
      type: table
      fields: [ad_group._data_date, master_stats.total_impressions, master_stats.total_cost_usd]
      fill_fields: [ad_group._data_date]
      filters:
        ad_group._data_date: NOT NULL
      sorts: [ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_analytics_block
      explore: facebook_ads
      type: table
      fields: [facebook_ads.date_start_date, facebook_ads.total_impressions, facebook_ads.total_spend]
      fill_fields: [facebook_ads.date_start_date]
      sorts: [facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: facebook_ads.date_start_date
        source_field_name: ad_group._data_date
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: total_impressions, id: total_impressions,
            name: Total Impressions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: total_costs, id: total_costs, name: Total Costs}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
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
    series_types:
      total_costs: line
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
    type: looker_column
    hidden_fields: [total, facebook_ads.total_impressions, master_stats.total_impressions,
      master_stats.total_cost_usd, facebook_ads.total_spend, cpm]
    dynamic_fields: [{table_calculation: total_impressions, label: Total Impressions,
        expression: "${master_stats.total_impressions}+coalesce(${facebook_ads.total_impressions},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_costs, label: Total Costs,
        expression: "${master_stats.total_cost_usd}+coalesce(${facebook_ads.total_spend},0)",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: cpm, label: CPM, expression: "${total_impressions}/${total_costs}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    row: 34
    col: 0
    width: 12
    height: 5
  - name: ROAS
    title: ROAS
    merged_queries:
    - model: google_analytics_block
      explore: ga_sessions
      type: table
      fields: [totals.transactionRevenue_total, ga_sessions.visitStart_date]
      filters:
        ga_sessions.partition_date: 30 days ago for 30 days
        totals.transactionRevenue_total: NOT NULL
      sorts: [totals.transactionRevenue_total desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_adwords
      explore: master_stats
      type: table
      fields: [ad._data_date, master_stats.total_cost_usd]
      filters:
        ad._data_date: 30 days
        master_stats.total_cost_usd: NOT NULL
      sorts: [ad._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: ad._data_date
        source_field_name: ga_sessions.visitStart_date
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: ROAS Yesterday
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 300, background_color: '',
        font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 300, background_color: '',
        font_color: "#B32F37", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [totals.transactionRevenue_total, master_stats.total_cost_usd,
      ga_sessions.visitStart_date]
    sorts: [ga_sessions.visitStart_date desc]
    dynamic_fields: [{table_calculation: roas, label: ROAS, expression: "${totals.transactionRevenue_total}/${master_stats.total_cost_usd}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    row: 8
    col: 0
    width: 6
    height: 4
  - title: Average Order Value (last 30)
    name: Average Order Value (last 30)
    model: google_analytics_block
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.visitStart_date, totals.average_order_value]
    fill_fields: [ga_sessions.visitStart_date]
    filters:
      ga_sessions.partition_date: 30 days ago for 30 days
    sorts: [ga_sessions.visitStart_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: avg, label: Avg, expression: 'mean(${totals.average_order_value})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: aov_today, label: AOV Today, expression: "${totals.average_order_value}",
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: AOV Yesterday
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [ga_sessions.visitStart_date, totals.average_order_value]
    listen: {}
    row: 18
    col: 0
    width: 6
    height: 6
  - name: CPM
    title: CPM
    merged_queries:
    - model: google_adwords
      explore: master_stats
      type: table
      fields: [ad_group._data_date, master_stats.total_impressions, master_stats.total_cost_usd]
      filters:
        ad_group._data_date: 30 days
      sorts: [ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_analytics_block
      explore: facebook_ads
      type: table
      fields: [facebook_ads.date_start_date, facebook_ads.total_impressions, facebook_ads.total_spend]
      sorts: [facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: facebook_ads.date_start_date
        source_field_name: ad_group._data_date
    type: single_value
    hidden_fields: [total, facebook_ads.total_impressions, master_stats.total_impressions,
      master_stats.total_cost_usd, facebook_ads.total_spend, total_impressions, total_costs]
    series_types: {}
    sorts: [ad_group._data_date desc]
    dynamic_fields: [{table_calculation: total_impressions, label: Total Impressions,
        expression: "${master_stats.total_impressions}+coalesce(${facebook_ads.total_impressions},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_costs, label: Total Costs,
        expression: "${master_stats.total_cost_usd}+coalesce(${facebook_ads.total_spend},0)",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: cpm, label: CPM, expression: "${total_costs}/(${total_impressions}/1000)",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    row: 4
    col: 6
    width: 6
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: <img src="https://en.instagram-brand.com/wp-content/themes/ig-branding/prj-ig-branding/assets/images/ig-logo-black.svg"height="25">&nbsp&nbsp<img
      src="https://image.flaticon.com/icons/svg/124/124010.svg"height="25"> Brand
      Social - Messaging Mix
    body_text: ''
    row: 2
    col: 12
    width: 12
    height: 2
  - title: Revenue
    name: Revenue
    model: google_analytics_block
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.visitStart_date, totals.transactionRevenue_total]
    fill_fields: [ga_sessions.visitStart_date]
    filters:
      ga_sessions.partition_date: 30 days ago for 30 days
    sorts: [ga_sessions.visitStart_date desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: running_total, label: Running Total, expression: 'running_total(${totals.transactionRevenue_total})',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: total, label: Total, expression: "${totals.transactionRevenue_total:total}\n",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    filter_expression: "(${ga_sessions.channelGrouping} = \"Social\" AND \n  (${trafficSource.medium}\
      \ = \"facebook_paid\" OR \n   ${trafficSource.medium} = \"paid\" OR\n   ${trafficSource.medium}\
      \ = \"cpc\" OR\n   ${trafficSource.medium} = \"instagram\")) OR\n${ga_sessions.channelGrouping}\
      \ = \"Affiliates\" OR\n${ga_sessions.channelGrouping} = \"Paid Search\" OR\n\
      ${ga_sessions.channelGrouping} = \"Retargeting\"\n"
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0.000,, "M"
    comparison_label: of Goal
    conditional_formatting: [{type: greater than, value: 5000000, background_color: '',
        font_color: "#72D16D", color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: [ga_sessions.visitStart_date, totals.transactionRevenue_total,
      running_total]
    listen: {}
    row: 18
    col: 6
    width: 6
    height: 6
  - title: Paid Search Costs
    name: Paid Search Costs
    model: google_adwords
    explore: master_stats
    type: looker_line
    fields: [master_stats.total_cost_usd, ad._data_date, campaign.total_amount_usd]
    fill_fields: [ad._data_date]
    sorts: [ad._data_date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: master_stats.total_cost_usd,
            id: master_stats.total_cost_usd, name: Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: campaign.total_amount_usd,
            id: campaign.total_amount_usd, name: Total Amount USD}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: Average Cost}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    note_state: collapsed
    note_display: below
    note_text: Reduced spend during tail end of MSS. $10/k per week down to 5/k per
      week
    listen: {}
    row: 34
    col: 12
    width: 12
    height: 5
  - title: Channel Breakdown (Google)
    name: Channel Breakdown (Google)
    model: google_adwords
    explore: master_stats
    type: looker_grid
    fields: [master_stats.total_cost_usd, campaign.advertising_channel_type, master_stats.average_interaction_rate,
      master_stats.total_interactions, master_stats.total_impressions, master_stats.average_cost_per_conversion,
      master_stats.average_cost_per_impression, master_stats.average_cost_per_interaction,
      master_stats.average_cost_per_click]
    filters:
      ad_group._data_date: 30 days
    sorts: [master_stats.total_cost_usd desc]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
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
    series_cell_visualizations:
      master_stats.total_cost_usd:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: master_stats.total_cost_usd,
            id: master_stats.total_cost_usd, name: Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: campaign.total_amount_usd,
            id: campaign.total_amount_usd, name: Total Amount USD}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: Average Cost}]
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 24
    height: 4
  - title: Channel Breakdown (Cross-Channel)
    name: Channel Breakdown (Cross-Channel)
    model: block_ga360
    explore: ga_sessions
    type: looker_grid
    fields: [ga_sessions.channelGrouping, trafficSource.source, trafficSource.medium,
      ga_sessions.session_count, totals.transactionRevenue_total, totals.transaction_conversion_rate,
      totals.average_revenue_per_transaction]
    sorts: [totals.transactionRevenue_total desc]
    limit: 500
    filter_expression: "(${trafficSource.source} = \"google\" OR \n${trafficSource.source}\
      \ = \"facebook\" OR \n${trafficSource.source} = \"instagram\") AND\n(${trafficSource.medium}\
      \ = \"cpc\" OR\n  ${trafficSource.medium} = \"paid\" OR\n  ${trafficSource.medium}\
      \ = \"retargeting\")"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen: {}
    row: 24
    col: 0
    width: 24
    height: 6
  - name: BRANDING
    type: text
    title_text: BRANDING
    subtitle_text: Facebook (BRAND_AWARENESS, REACH) + Google (DISPLAY)
    row: 2
    col: 0
    width: 12
    height: 2
  - name: CONVERSION
    type: text
    title_text: CONVERSION
    subtitle_text: Facebook (CONVERSIONS) + Google (SEARCH, SHOPPING)
    row: 16
    col: 0
    width: 12
    height: 2
  - name: " (2)"
    type: text
    subtitle_text: <img src="https://image.flaticon.com/icons/svg/2301/2301162.svg"
      height="25"> Paid Search
    row: 12
    col: 12
    width: 12
    height: 2
  - title: Campaign Performance
    name: Campaign Performance
    model: google_analytics_block
    explore: facebook_ads
    type: looker_column
    fields: [facebook_ads.campaign_category, facebook_ads.total_impressions, facebook_ads.total_spend]
    sorts: [facebook_ads.total_impressions desc]
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
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: facebook_ads.total_impressions,
            id: facebook_ads.total_impressions, name: Total Impressions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: facebook_ads.total_spend,
            id: facebook_ads.total_spend, name: Total Spend}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      facebook_ads.total_spend: line
    series_colors:
      facebook_ads.total_impressions: "#E57947"
      facebook_ads.total_spend: "#FBB555"
    defaults_version: 1
    row: 4
    col: 12
    width: 12
    height: 8
  - title: Category Performance
    name: Category Performance
    model: google_adwords
    explore: master_stats
    type: looker_column
    fields: [campaign.campaign_category, master_stats.total_cost_usd, master_stats.average_cost_per_conversion,
      master_stats.average_interaction_rate]
    filters:
      ad_group._data_date: 30 days
    sorts: [master_stats.total_cost_usd desc]
    limit: 10
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
    legend_position: right
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
    y_axes: [{label: '', orientation: left, series: [{axisId: master_stats.total_cost_usd,
            id: master_stats.total_cost_usd, name: Cost}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: '', orientation: right, series: [{axisId: master_stats.average_interaction_rate,
            id: master_stats.average_interaction_rate, name: Interaction Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    hide_legend: true
    series_types:
      master_stats.average_cost_per_conversion: line
      master_stats.average_interaction_rate: line
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", label: Average Cost}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [master_stats.average_cost_per_conversion]
    note_state: collapsed
    note_display: hover
    note_text: Reduced spend during tail end of MSS. $10/k per week down to 5/k per
      week
    listen: {}
    row: 14
    col: 12
    width: 12
    height: 6
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: google_adwords
      explore: master_stats
      type: looker_line
      fields: [master_stats._data_date, master_stats.total_cost_usd]
      fill_fields: [master_stats._data_date]
      filters:
        master_stats._data_date: 30 days
      sorts: [master_stats._data_date desc]
      limit: 500
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
      defaults_version: 1
    - model: google_analytics_block
      explore: facebook_ads
      type: table
      fields: [facebook_ads.date_start_date, facebook_ads.total_spend]
      fill_fields: [facebook_ads.date_start_date]
      filters:
        facebook_ads.date_start_date: 30 days
      sorts: [facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: facebook_ads.date_start_date
        source_field_name: master_stats._data_date
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [facebook_ads.total_spend, gadsfb, master_stats.total_cost_usd,
      master_stats._data_date]
    series_types: {}
    type: single_value
    sorts: [master_stats._data_date desc]
    dynamic_fields: [{table_calculation: total_spend, label: Total Spend, expression: 'sum(${gadsfb})

          ', value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        _type_hint: number}, {table_calculation: gadsfb, label: Gads+FB, expression: 'coalesce(${master_stats.total_cost_usd},0)+coalesce(${facebook_ads.total_spend},0)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number},
      {table_calculation: yesterday, label: Yesterday, expression: 'offset(${gadsfb},1)',
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    row: 4
    col: 0
    width: 6
    height: 4
