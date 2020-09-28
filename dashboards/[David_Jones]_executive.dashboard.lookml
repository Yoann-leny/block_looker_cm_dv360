- dashboard: david_jones_executive_overview
  title: "[David Jones] Executive Overview"
  layout: newspaper
  elements:
  - name: Total Impressions
    title: Total Impressions
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: single_value
      fields: [dj_impression.count_impressions, dj_impression.event_date]
      fill_fields: [dj_impression.event_date]
      filters:
        impression.event_date: 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      single_value_title: Total Impressions
      series_types: {}
      defaults_version: 1
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_master_stats.total_impressions, dj_ad_group._data_date]
      fill_fields: [dj_ad_group._data_date]
      filters:
        dj_ad_group._data_date: 7 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_impressions]
      fill_fields: [dj_facebook_ads.date_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: IMPRESSIONS
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_master_stats.total_impressions, dj_impression.count_impressions,
      impr_cross_platform, dj_facebook_ads.total_impressions]
    dynamic_fields: [{table_calculation: impr_cross_platform, label: Impr cross platform,
        expression: "coalesce(${dj_impression.count_impressions},0)\n+coalesce(${dj_master_stats.total_impressions},0)\n\
          +coalesce(${dj_facebook_ads.total_impressions},0)", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}, {
        table_calculation: total_impressions, label: Total Impressions, expression: 'sum(${impr_cross_platform})',
        value_format: '#,##0.0,, "M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    row: 2
    col: 0
    width: 4
    height: 3
  - name: EXECUTIVE OVERVIEW
    type: text
    title_text: EXECUTIVE OVERVIEW
    subtitle_text: Data from CM, DV360, Google Ads, GA360 and Facebook
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Total Media Spend
    title: Total Media Spend
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend]
      fill_fields: [dj_facebook_ads.date_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    custom_color: "#B32F37"
    show_single_value_title: true
    single_value_title: MEDIA SPEND
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, spend_cross_platform]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: spend_cross_platform, label: Spend Cross
          Platform, expression: "coalesce(${dj_impression.total_revenue_usd},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {table_calculation: media_spend,
        label: Media Spend, expression: 'sum(${spend_cross_platform})', value_format: '$#,##0.0,
          "K"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    row: 2
    col: 4
    width: 4
    height: 3
  - name: Total CPM
    title: Total CPM
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd, dj_impression.count_impressions]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd, dj_master_stats.total_impressions]
      fill_fields: [dj_ad_group._data_date]
      sorts: [dj_ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions]
      fill_fields: [dj_facebook_ads.date_start_date]
      sorts: [dj_facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: CPM
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, spend_cross_platform, dj_impression.count_impressions,
      dj_master_stats.total_impressions, dj_facebook_ads.total_impressions, media_spend,
      total_impr]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: spend_cross_platform, label: Spend Cross
          Platform, expression: "coalesce(${dj_impression.total_revenue_usd},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {table_calculation: media_spend,
        label: Media Spend, expression: 'sum(${spend_cross_platform})', value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}, {table_calculation: total_impr,
        label: Total Impr, expression: "sum(coalesce(${dj_impression.count_impressions},0)\n\
          +coalesce(${dj_master_stats.total_impressions},0)\n+coalesce(${dj_facebook_ads.total_impressions},0))",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: cpm, label: CPM, expression: "${media_spend}/${total_impr}*1000",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    row: 2
    col: 20
    width: 4
    height: 3
  - title: Total Revenue
    name: Total Revenue
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [ga_sessions.visitStart_date, totals.transactionRevenue_total]
    fill_fields: [ga_sessions.visitStart_date]
    filters: {}
    sorts: [ga_sessions.visitStart_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: total_revenue, label: total Revenue, expression: 'sum(${totals.transactionRevenue_total})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#72D16D"
    single_value_title: TOTAL REVENUE
    value_format: $#,##0, "K"
    series_types: {}
    defaults_version: 1
    hidden_fields: [totals.transactionRevenue_total]
    listen:
      Period: ga_sessions.partition_date
    row: 5
    col: 2
    width: 6
    height: 3
  - name: ROAS
    title: ROAS
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_2, label: date 2, expression: "to_date(\n\
            \  to_string(${dj_impression.event_date})\n)", value_format: !!null '', value_format_name: !!null '',
          _kind_hint: dimension, _type_hint: date}]
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend]
      fill_fields: [dj_facebook_ads.date_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    - model: ga360
      explore: dj_ga_sessions
      type: table
      fields: [ga_sessions.partition_date, totals.transactionRevenue_total]
      filters:
        ga_sessions.partition_date: 30 days ago for 30 days
      sorts: [ga_sessions.partition_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: ga_sessions.partition_date
        source_field_name: date_2
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ROAS
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, spend_cross_platform, totals.transactionRevenue_total,
      date_2]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: roas, label: ROAS, expression: "sum(${totals.transactionRevenue_total})/sum(coalesce(${dj_impression.total_revenue_usd},0)\n\
          +coalesce(${dj_master_stats.total_cost_usd},0)\n+coalesce(${dj_facebook_ads.total_spend},0))",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    - Period: ga_sessions.partition_date
    row: 5
    col: 16
    width: 6
    height: 3
  - name: Impressions vs Cost by Category
    title: Impressions vs Cost by Category
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.total_revenue_usd, dj_impression.count_impressions, match_table_campaigns.campaign_category]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.total_revenue_usd desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_campaign.campaign_category, dj_master_stats.total_cost_usd, dj_master_stats.total_impressions]
      filters:
        dj_ad_group._data_date: 30 days ago for 30 days
      sorts: [dj_master_stats.total_cost_usd desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_campaign.campaign_category
        source_field_name: match_table_campaigns.campaign_category
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.campaign_category, dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions]
      sorts: [dj_facebook_ads.total_spend desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.campaign_category
        source_field_name: match_table_campaigns.campaign_category
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: impressions, id: impressions,
            name: Impressions}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: spend_cross_platform, id: spend_cross_platform,
            name: Media Spend}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types:
      media_spend: line
      spend_cross_platform: line
    point_style: none
    series_colors:
      media_spend: "#FBB555"
      total_impr: "#3EB0D5"
      spend_cross_platform: "#B32F37"
      impressions: "#FFD95F"
    series_labels:
      total_impr: Impressions
      spend_cross_platform: Media Spend
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: CPM
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, dj_impression.count_impressions, dj_master_stats.total_impressions,
      dj_facebook_ads.total_impressions, media_spend, total_impr]
    type: looker_column
    dynamic_fields: [{table_calculation: spend_cross_platform, label: Spend Cross
          Platform, expression: "coalesce(${dj_impression.total_revenue_usd},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {table_calculation: media_spend,
        label: Media Spend, expression: 'sum(${spend_cross_platform})', value_format: !!null '',
        value_format_name: usd_0, _kind_hint: measure, _type_hint: number}, {table_calculation: total_impr,
        label: Total Impr, expression: "sum(coalesce(${dj_impression.count_impressions},0)\n\
          +coalesce(${dj_master_stats.total_impressions},0)\n+coalesce(${dj_facebook_ads.total_impressions},0))",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: impressions, label: Impressions,
        expression: "coalesce(${dj_impression.count_impressions},0)\n+coalesce(${dj_master_stats.total_impressions},0)\n\
          +coalesce(${dj_facebook_ads.total_impressions},0)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    row: 19
    col: 0
    width: 24
    height: 7
  - name: Cost vs Revenue
    title: Cost vs Revenue
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd, dj_impression.event_week]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_2, label: date 2, expression: "to_date(\n\
            \  to_string(${dj_impression.event_date})\n)", value_format: !!null '', value_format_name: !!null '',
          _kind_hint: dimension, _type_hint: date}]
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend]
      fill_fields: [dj_facebook_ads.date_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    - model: ga360
      explore: dj_ga_sessions
      type: table
      fields: [totals.transactionRevenue_total, ga_sessions.partition_date]
      filters:
        ga_sessions.partition_date: 30 days ago for 30 days
        ga_sessions.visitStart_date: 30 days ago for 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: ga_sessions.partition_date
        source_field_name: date_2
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: dj_impression.total_revenue_usd,
            id: dj_impression.total_revenue_usd, name: 'CM,DV360 Spend'}, {axisId: dj_master_stats.total_cost_usd,
            id: dj_master_stats.total_cost_usd, name: Search Spend}, {axisId: dj_facebook_ads.total_spend,
            id: dj_facebook_ads.total_spend, name: Facebook Spend}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.transactionRevenue_total,
            id: totals.transactionRevenue_total, name: Revenue}], showLabels: true,
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types:
      totals.transactionRevenue_total: line
    point_style: none
    series_colors:
      dj_impression.total_revenue_usd: "#FBB555"
      dj_facebook_ads.total_spend: "#B32F37"
      dj_master_stats.total_cost_usd: "#E57947"
      totals.transactionRevenue_total: "#72D16D"
    series_labels:
      totals.transactionRevenue_total: Revenue
      dj_facebook_ads.total_spend: Facebook Spend
      dj_master_stats.total_cost_usd: Search Spend
      dj_impression.total_revenue_usd: CM,DV360 Spend
    series_point_styles:
      dj_impression.total_revenue_usd: square
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: ROAS
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [spend_cross_platform, dj_impression.event_date, date_2]
    type: looker_column
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_facebook_ads.date_start_date
    - Period: ga_sessions.partition_date
    row: 11
    col: 0
    width: 24
    height: 8
  - title: TOP 10 Campaigns by Cost
    name: TOP 10 Campaigns by Cost
    model: david_jones_campaign_manager_dv360_v2
    explore: dj_impression
    type: looker_bar
    fields: [match_table_campaigns.campaign_name, dj_impression.total_revenue_usd]
    filters: {}
    sorts: [dj_impression.total_revenue_usd desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_impression.total_revenue_usd,
            id: dj_impression.total_revenue_usd, name: Total Revenue USD}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      dj_impression.total_revenue_usd: "#FBB555"
    defaults_version: 1
    listen:
      Period: dj_impression.event_date
    row: 26
    col: 0
    width: 8
    height: 8
  - title: TOP 10 Campaigns by Cost
    name: TOP 10 Campaigns by Cost (2)
    model: google_ads
    explore: dj_master_stats
    type: looker_bar
    fields: [dj_campaign.campaign_name, dj_master_stats.total_cost_usd]
    filters: {}
    sorts: [dj_master_stats.total_cost_usd desc]
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
    limit_displayed_rows: true
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_master_stats.total_cost_usd,
            id: dj_master_stats.total_cost_usd, name: Media Spend}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    series_colors:
      dj_master_stats.total_cost_usd: "#E57947"
    series_labels:
      dj_master_stats.total_cost_usd: Media Spend
    defaults_version: 1
    listen:
      Period: dj_ad_group._data_date
    row: 26
    col: 8
    width: 8
    height: 8
  - name: <img src="https://developersgooglecom/ads/images/logo_campaign_manager_192pxsvg"height="25">&nbsp&nbsp<img
      src="https://wwwmedianetcom/images/icon-DV360png"height="25"> CM + DV360
    type: text
    title_text: <img src="https://developers.google.com/ads/images/logo_campaign_manager_192px.svg"height="25">&nbsp&nbsp<img
      src="https://www.medianet.com/images/icon-DV360.png"height="25"> CM + DV360
    subtitle_text: ''
    row: 34
    col: 0
    width: 8
    height: 2
  - name: <img src="https://cdn2hubspotnet/hubfs/521324/logopng" height="25"> Google
      Ads
    type: text
    title_text: <img src="https://cdn2.hubspot.net/hubfs/521324/logo.png" height="25">
      Google Ads
    subtitle_text: ''
    row: 34
    col: 8
    width: 8
    height: 2
  - name: <img src="https://imageflaticoncom/icons/svg/124/124010svg"height="25">
      Facebook
    type: text
    title_text: <img src="https://image.flaticon.com/icons/svg/124/124010.svg"height="25">
      Facebook
    subtitle_text: ''
    row: 34
    col: 16
    width: 8
    height: 2
  - title: TOP 10 Campaigns by Cost
    name: TOP 10 Campaigns by Cost (3)
    model: facebook_ads
    explore: dj_facebook_ads
    type: looker_bar
    fields: [dj_facebook_ads.total_spend, dj_facebook_ads.campaign_name]
    filters: {}
    sorts: [dj_facebook_ads.total_spend desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_facebook_ads.total_spend,
            id: dj_facebook_ads.total_spend, name: Total Spend}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    series_types: {}
    series_colors:
      dj_facebook_ads.total_spend: "#B32F37"
    defaults_version: 1
    listen:
      Period: dj_facebook_ads.date_start_date
    row: 26
    col: 16
    width: 8
    height: 8
  - name: Total Media Spend (copy)
    title: Total Media Spend (copy)
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd, dj_master_stats.total_conversions]
      fill_fields: [dj_ad_group._data_date]
      sorts: [dj_ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days ago for 30 days
        dj_activity.activity_id: '9007366'
      sorts: [dj_activity.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: CPA
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, spend_cross_platform, dj_master_stats.total_conversions,
      media_spend, conversions, dj_activity.total_conversions]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: media_spend, label: Media Spend, expression: "sum(coalesce(${dj_impression.total_revenue_usd},0)\n\
          +coalesce(${dj_master_stats.total_cost_usd},0))", value_format: '$#,##0.0,
          "K"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number},
      {table_calculation: conversions, label: Conversions, expression: "sum(coalesce(${dj_activity.total_conversions},0)+\n\
          coalesce(${dj_master_stats.total_conversions},0))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: cpa, label: CPA, expression: "${media_spend}/${conversions}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    -
    row: 2
    col: 16
    width: 4
    height: 3
  - title: Untitled
    name: Untitled
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [totals.average_order_value, ga_sessions.visitStart_date]
    fill_fields: [ga_sessions.visitStart_date]
    filters:
      ga_sessions.partition_date: 30 days ago for 30 days
    sorts: [ga_sessions.visitStart_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: avg_aov, label: Avg AOV, expression: 'mean(${totals.average_order_value})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: AOV
    defaults_version: 1
    listen: {}
    row: 5
    col: 9
    width: 6
    height: 3
  - name: Conversion
    title: Conversion
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_usd]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd, dj_master_stats.total_conversions]
      fill_fields: [dj_ad_group._data_date]
      sorts: [dj_ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days ago for 30 days
        dj_activity.activity_id: '9007366'
      sorts: [dj_activity.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: CONVERSIONS
    value_format: '#,##0.0, "K"'
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.total_revenue_usd, dj_master_stats.total_cost_usd,
      dj_facebook_ads.total_spend, spend_cross_platform, dj_master_stats.total_conversions,
      media_spend, dj_activity.total_conversions, cpa]
    series_types: {}
    type: single_value
    dynamic_fields: [{table_calculation: media_spend, label: Media Spend, expression: "sum(coalesce(${dj_impression.total_revenue_usd},0)\n\
          +coalesce(${dj_master_stats.total_cost_usd},0))", value_format: '$#,##0.0,
          "K"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number},
      {table_calculation: conversions, label: Conversions, expression: "sum(coalesce(${dj_activity.total_conversions},0)+\n\
          coalesce(${dj_master_stats.total_conversions},0))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: cpa, label: CPA, expression: "${media_spend}/${conversions}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_ad_group._data_date
    - Period: dj_activity.event_date
    row: 8
    col: 12
    width: 4
    height: 3
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: single_value
      fields: [dj_activity.total_revenue, dj_activity.event_week]
      fill_fields: [dj_activity.event_week]
      filters:
        dj_activity.event_date: 8 weeks ago for 8 weeks
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
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
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue]
      fill_fields: [dj_facebook_ads.date_start_week]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_week
        source_field_name: dj_activity.event_week
    custom_color_enabled: true
    custom_color: "#72D16D"
    show_single_value_title: true
    single_value_title: Revenue
    value_format: $#,##0.00,, "M"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    type: single_value
    hidden_fields: [dj_activity.total_revenue, dj_facebook_ads.total_revenue, revenue_cross_platform]
    dynamic_fields: [{table_calculation: revenue_cross_platform, label: Revenue Cross
          Platform, expression: 'coalesce(${dj_activity.total_revenue},0)+coalesce(${dj_facebook_ads.total_revenue},0)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_revenue, label: Total Revenue,
        expression: 'sum(${revenue_cross_platform})', value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, _type_hint: number}]
    row: 2
    col: 8
    width: 4
    height: 3
  filters:
  - name: Period
    title: Period
    type: date_filter
    default_value: 30 days
    allow_multiple_values: true
    required: false
