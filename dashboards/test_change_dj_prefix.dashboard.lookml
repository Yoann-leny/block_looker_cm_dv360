- dashboard: david_jones_executive_overview_v4
  title: "[David Jones] Executive Overview v4"
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: Total Impressions
    title: Total Impressions
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.count_impressions, dj_impression.event_date]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 7 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
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
    column_limit: 50
    dynamic_fields: [{table_calculation: impr_cross_platform, label: Impr cross platform,
        expression: "coalesce(${dj_impression.count_impressions},0)\n+coalesce(${dj_facebook_ads.total_impressions},0)",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_impressions, label: Total Impressions,
        expression: 'sum(${impr_cross_platform})', value_format: '#,##0.0,, "M"',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    row: 5
    col: 0
    width: 3
    height: 2
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
      fields: [dj_impression.event_date, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend]
      fill_fields: [dj_facebook_ads.date_start_date]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      filters:
        dj_ad_group._data_date: 30 days
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
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
    hidden_fields: [dj_master_stats.total_cost_usd, dj_facebook_ads.total_spend, spend_cross_platform,
      dj_impression.total_revenue_advertiser_currency]
    series_types: {}
    type: single_value
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: spend_cross_platform, label: Spend Cross
          Platform, expression: "coalesce(${dj_impression.total_revenue_advertiser_currency},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: media_spend, label: Media Spend,
        expression: 'sum(${spend_cross_platform})', value_format: '$#,##0.0, "K"',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_ad_group._data_date
    row: 5
    col: 6
    width: 3
    height: 2
  - name: Total CPM
    title: Total CPM
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
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
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      filters:
        dj_ad_group._data_date: 30 days
      sorts: [dj_ad_group._data_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
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
    hidden_fields: [dj_master_stats.total_cost_usd, dj_facebook_ads.total_spend, spend_cross_platform,
      dj_impression.count_impressions, dj_master_stats.total_impressions, dj_facebook_ads.total_impressions,
      media_spend, total_impr, dj_impression.total_revenue_advertiser_currency]
    series_types: {}
    type: single_value
    column_limit: 50
    dynamic_fields: [{table_calculation: spend_cross_platform, label: Spend Cross
          Platform, expression: "coalesce(${dj_impression.total_revenue_advertiser_currency},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)\n",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: media_spend, label: Media Spend,
        expression: 'sum(${spend_cross_platform})', value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, _type_hint: number}, {table_calculation: total_impr,
        label: Total Impr, expression: "sum(coalesce(${dj_impression.count_impressions},0)\n\
          +coalesce(${dj_facebook_ads.total_impressions},0))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        table_calculation: cpm, label: CPM, expression: "${media_spend}/${total_impr}*1000",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_ad_group._data_date
    row: 7
    col: 0
    width: 3
    height: 2
  - name: ROAS
    title: ROAS
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend, dj_facebook_ads.total_revenue]
      fill_fields: [dj_facebook_ads.date_start_date]
      sorts: [dj_facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
        dj_activity.event_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_impression.event_date
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      filters:
        dj_ad_group._data_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
        source_field_name: dj_impression.event_date
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
    hidden_fields: [dj_master_stats.total_cost_usd, dj_facebook_ads.total_spend, spend_cross_platform,
      totals.transactionRevenue_total, dj_facebook_ads.total_revenue, dj_activity.total_revenue,
      dj_impression.total_revenue_advertiser_currency]
    series_types: {}
    type: single_value
    column_limit: 50
    dynamic_fields: [{table_calculation: roas, label: ROAS, expression: "sum(\n  coalesce(${dj_activity.total_revenue},0)\n\
          \  +coalesce(${dj_facebook_ads.total_revenue},0)\n  )\n/\nsum(\n  coalesce(${dj_impression.total_revenue_advertiser_currency},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)\n+coalesce(${dj_master_stats.total_cost_usd},0))",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_activity.event_date
    - Period: dj_ad_group._data_date
    row: 9
    col: 12
    width: 3
    height: 2
  - name: Weekly Media Spend vs Revenue
    title: Weekly Media Spend vs Revenue
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_week, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_week]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.total_spend, dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_week
        source_field_name: dj_impression.event_week
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_week, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_week]
      filters:
        dj_activity.event_week: 4 weeks
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_week
        source_field_name: dj_impression.event_week
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_week, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_week]
      filters:
        dj_ad_group._data_date: 30 days
      sorts: [dj_ad_group._data_week desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_week
        source_field_name: dj_impression.event_week
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: media_spend, id: media_spend,
            name: Media Spend}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: revenue, id: revenue, name: Revenue}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}]
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
      revenue: line
    point_style: circle_outline
    series_colors:
      dj_impression.total_revenue_usd: "#FBB555"
      dj_facebook_ads.total_spend: "#B32F37"
      dj_master_stats.total_cost_usd: "#E57947"
      totals.transactionRevenue_total: "#72D16D"
      revenue: "#72D16D"
      media_spend: "#B32F37"
    series_labels:
      totals.transactionRevenue_total: Revenue
      dj_facebook_ads.total_spend: Facebook Spend
      dj_master_stats.total_cost_usd: Search Spend
      dj_impression.total_revenue_usd: CM,DV360 Spend
    series_point_styles:
      dj_impression.total_revenue_usd: square
    show_value_labels: true
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
    hidden_fields: [spend_cross_platform, dj_facebook_ads.total_spend, dj_facebook_ads.total_revenue,
      dj_activity.total_revenue, dj_impression.total_revenue_advertiser_currency,
      dj_master_stats.total_cost_usd]
    type: looker_column
    column_limit: 50
    dynamic_fields: [{table_calculation: media_spend, label: Media Spend, expression: "coalesce(${dj_facebook_ads.total_spend},0)\n\
          +coalesce(${dj_impression.total_revenue_advertiser_currency},0)+coalesce(${dj_master_stats.total_cost_usd},0)",
        value_format: '$#,##0.0, "K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue, label: Revenue, expression: 'coalesce(${dj_activity.total_revenue},0)+coalesce(${dj_facebook_ads.total_revenue},0)',
        value_format: '$#,##0.00,, "M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_activity.event_date
    -
    row: 11
    col: 0
    width: 24
    height: 8
  - title: TOP 10 Campaigns by Cost
    name: TOP 10 Campaigns by Cost
    model: david_jones_campaign_manager_dv360_v2
    explore: dj_impression
    type: looker_bar
    fields: [dj_match_table_campaigns.campaign_name_abr, dj_impression.total_revenue_advertiser_currency]
    sorts: [dj_impression.total_revenue_advertiser_currency desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_impression.total_revenue_usd,
            id: dj_impression.total_revenue_usd, name: total_media_spend_usd}], showLabels: false,
        showValues: true, valueFormat: '$#,##0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $#,##0.0, "K"
    series_types: {}
    series_colors:
      dj_impression.total_revenue_usd: "#FBB555"
      dj_impression.total_revenue_advertiser_currency: "#FBB555"
    defaults_version: 1
    listen:
      Period: dj_impression.event_date
    row: 31
    col: 3
    width: 7
    height: 7
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
    show_x_axis_label: false
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
    show_value_labels: true
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
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $##0.0,"K"
    series_types: {}
    series_colors:
      dj_master_stats.total_cost_usd: "#E57947"
    series_labels:
      dj_master_stats.total_cost_usd: Media Spend
    defaults_version: 1
    listen:
      Period: dj_ad_group._data_date
    row: 38
    col: 3
    width: 7
    height: 7
  - name: <img src="https://developersgooglecom/ads/images/logo_campaign_manager_192pxsvg"
      height="45">&nbsp&nbsp<img src="https://wwwmedianetcom/images/icon-DV360png"height="45">
    type: text
    title_text: <img src="https://developers.google.com/ads/images/logo_campaign_manager_192px.svg"
      height="45">&nbsp&nbsp<img src="https://www.medianet.com/images/icon-DV360.png"height="45">
    subtitle_text: CM + DV360
    body_text: "*_Paid Search excluded_"
    row: 31
    col: 0
    width: 3
    height: 7
  - name: <img src="https://cdn2hubspotnet/hubfs/521324/logopng" height="45">
    type: text
    title_text: <img src="https://cdn2.hubspot.net/hubfs/521324/logo.png" height="45">
    subtitle_text: Google Ads
    row: 38
    col: 0
    width: 3
    height: 7
  - name: <img src="https://imageflaticoncom/icons/svg/124/124010svg"height="55">
    type: text
    title_text: <img src="https://image.flaticon.com/icons/svg/124/124010.svg"height="55">
    subtitle_text: Facebook
    row: 45
    col: 0
    width: 3
    height: 7
  - title: TOP 10 Campaigns by Cost
    name: TOP 10 Campaigns by Cost (3)
    model: facebook_ads
    explore: dj_facebook_ads
    type: looker_bar
    fields: [dj_facebook_ads.total_spend, dj_facebook_ads.campaign_name_abr]
    sorts: [dj_facebook_ads.total_spend desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_facebook_ads.total_spend,
            id: dj_facebook_ads.total_spend, name: Total Spend}], showLabels: false,
        showValues: true, valueFormat: '$#,##0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    label_value_format: $#,##0.0, "K"
    series_types: {}
    series_colors:
      dj_facebook_ads.total_spend: "#B32F37"
    defaults_version: 1
    listen:
      Period: dj_facebook_ads.date_start_date
    row: 45
    col: 3
    width: 7
    height: 7
  - name: CPA
    title: CPA
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_date, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_date]
      filters:
        dj_impression.event_date: 30 days ago for 30 days
      sorts: [dj_impression.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days ago for 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_spend, dj_facebook_ads.total_conversion]
      fill_fields: [dj_facebook_ads.date_start_date]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_ad_group._data_date, dj_master_stats.total_cost_usd]
      fill_fields: [dj_ad_group._data_date]
      filters:
        dj_ad_group._data_date: 7 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_ad_group._data_date
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
    hidden_fields: [dj_master_stats.total_cost_usd, dj_facebook_ads.total_spend, spend_cross_platform,
      dj_master_stats.total_conversions, media_spend, conversions, dj_activity.total_conversions,
      dj_facebook_ads.total_conversion, dj_impression.total_revenue_advertiser_currency]
    series_types: {}
    type: single_value
    column_limit: 50
    dynamic_fields: [{table_calculation: media_spend, label: Media Spend, expression: "sum(coalesce(${dj_impression.total_revenue_advertiser_currency},0)\n\
          +coalesce(${dj_facebook_ads.total_spend},0)\n+coalesce(${dj_master_stats.total_cost_usd},0))",
        value_format: '$#,##0.0, "K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: conversions, label: Conversions,
        expression: "sum(coalesce(${dj_activity.total_conversions},0)+\ncoalesce(${dj_facebook_ads.total_conversion},0))",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: cpa, label: CPA, expression: "${media_spend}/${conversions}",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_activity.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_ad_group._data_date
    row: 9
    col: 6
    width: 3
    height: 2
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
      total: true
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days ago for 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      total: true
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
      media_spend, dj_activity.total_conversions, cpa, dj_facebook_ads.total_conversion]
    series_types: {}
    type: single_value
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: conversions, label: Conversions, expression: 'sum(coalesce(${dj_activity.total_conversions},0))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_activity.event_date
    row: 5
    col: 9
    width: 3
    height: 2
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: "#72D16D"
    show_single_value_title: true
    single_value_title: REVENUE
    value_format: '#,##0.00,, "M"'
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_activity.total_revenue, dj_facebook_ads.total_revenue]
    total: true
    dynamic_fields: [{table_calculation: total_revenue, label: Total Revenue, expression: 'sum(coalesce(${dj_activity.total_revenue},0))',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_activity.event_date
    row: 5
    col: 12
    width: 3
    height: 2
  - title: Untitled
    name: Untitled
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [ga_sessions.session_count]
    filters: {}
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
    single_value_title: SESSIONS
    value_format: '#,##0.00,, "M"'
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
    listen:
      Period: ga_sessions.partition_date
    row: 5
    col: 16
    width: 4
    height: 2
  - title: Untitled
    name: Untitled (2)
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [ga_sessions.unique_visitors]
    filters: {}
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
    single_value_title: UNIQUE VISITORS
    value_format: '#,##0.00,, "M"'
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
    listen:
      Period: ga_sessions.partition_date
    row: 5
    col: 20
    width: 4
    height: 2
  - title: Untitled
    name: Untitled (3)
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, totals.transactionRevenue_total]
    filters: {}
    sorts: [ga_sessions.partition_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: total_revenue, label: Total Revenue, expression: 'sum(${totals.transactionRevenue_total})',
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
    custom_color: "#72D16D"
    single_value_title: REVENUE
    value_format: $#,##0.00,, "M"
    series_types: {}
    defaults_version: 1
    hidden_fields: [totals.transactionRevenue_total]
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Period: ga_sessions.partition_date
    row: 7
    col: 16
    width: 4
    height: 2
  - title: GA-Conversions
    name: GA-Conversions
    model: ga360
    explore: dj_ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, totals.transactions_count]
    filters: {}
    sorts: [ga_sessions.partition_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: total_conversions, label: Total Conversions,
        expression: 'sum(${totals.transactions_count})', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: CONVERSIONS
    value_format: '#,##0.0, "K"'
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
    hidden_fields: [totals.transactions_count]
    series_types: {}
    listen:
      Period: ga_sessions.partition_date
    row: 7
    col: 20
    width: 4
    height: 2
  - name: <img src="https://developersgooglecom/ads/images/logo_campaign_manager_192pxsvg"height="30">&nbsp&nbsp<img
      src="https://wwwmedianetcom/images/icon-DV360png"height="30">
    type: text
    title_text: <img src="https://developers.google.com/ads/images/logo_campaign_manager_192px.svg"height="30">&nbsp&nbsp<img
      src="https://www.medianet.com/images/icon-DV360.png"height="30">
    subtitle_text: <img src="https://cdn2.hubspot.net/hubfs/521324/logo.png" height="30">
      <img src="https://image.flaticon.com/icons/svg/124/124010.svg"height="30">
    body_text: ''
    row: 2
    col: 8
    width: 2
    height: 3
  - name: <img src="https://uploadwikimediaorg/wikipedia/commons/4/46/Google_Analytics_Logo_2015png"
      height="35">
    type: text
    title_text: <img src="https://upload.wikimedia.org/wikipedia/commons/4/46/Google_Analytics_Logo_2015.png"
      height="35">
    subtitle_text: ''
    row: 2
    col: 20
    width: 4
    height: 3
  - name: Impressions vs Media Spend by Campaign Category
    title: Impressions vs Media Spend by Campaign Category
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: master_campaign_category
      type: table
      fields: [master_campaign_category.master_campaign_category]
      sorts: [master_campaign_category.master_campaign_category]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_match_table_campaigns.campaign_category, dj_impression.count_impressions,
        dj_impression.total_revenue_advertiser_currency]
      filters:
        dj_impression.event_date: 30 days
      sorts: [dj_impression.count_impressions desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_match_table_campaigns.campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.campaign_category, dj_facebook_ads.total_impressions,
        dj_facebook_ads.total_spend]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    - model: google_ads
      explore: dj_master_stats
      type: table
      fields: [dj_campaign.campaign_category, dj_master_stats.total_cost_usd]
      filters:
        dj_ad_group._data_date: 30 days
      sorts: [dj_master_stats.total_cost_usd desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_campaign.campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: impressions, id: impressions,
            name: Impressions}], showLabels: true, showValues: true, valueFormat: '#,##0,,"M"',
        unpinAxis: false, tickDensity: default, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: media_spend, id: media_spend, name: Media
              Spend}], showLabels: true, showValues: true, valueFormat: '$#,##0,"K"',
        unpinAxis: false, tickDensity: default, type: linear}]
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
    label_value_format: ''
    series_types:
      media_spend: line
    point_style: circle_outline
    series_colors:
      media_spend: "#B32F37"
      impressions: "#FFD95F"
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [dj_facebook_ads.total_impressions, dj_facebook_ads.total_spend,
      dj_impression.count_impressions, dj_master_stats.total_cost_usd, dj_impression.total_revenue_advertiser_currency]
    type: looker_column
    dynamic_fields: [{table_calculation: impressions, label: Impressions, expression: "coalesce(${dj_impression.count_impressions},0)\n\
          +coalesce(${dj_facebook_ads.total_impressions},0)", value_format: '#,##0.0,,
          "M"', value_format_name: !!null '', _kind_hint: measure, _type_hint: number},
      {table_calculation: media_spend, label: Media Spend, expression: "coalesce(${dj_facebook_ads.total_spend},0)\n\
          +coalesce(${dj_impression.total_revenue_advertiser_currency},0)\n+coalesce(${dj_master_stats.total_cost_usd},0)",
        value_format: "$#,##0", value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    -
    - Period: dj_impression.event_date
    - Period: dj_facebook_ads.date_start_date
    -
    row: 19
    col: 0
    width: 12
    height: 10
  - name: Total Clicks
    title: Total Clicks
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_click
      type: table
      fields: [dj_click.event_date, dj_click.count]
      fill_fields: [dj_click.event_date]
      filters:
        dj_click.event_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_date]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_click.event_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: CLICKS
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_click.count, dj_facebook_ads.total_clicks]
    dynamic_fields: [{table_calculation: clicks, label: Clicks, expression: "sum(\n\
          \  coalesce(${dj_click.count},0)\n  +coalesce(${dj_facebook_ads.total_clicks},0)\n\
          )", value_format: '#,##0.00,, "M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Period: dj_click.event_date
    - Period: dj_facebook_ads.date_start_date
    row: 5
    col: 3
    width: 3
    height: 2
  - name: New Tile (2)
    title: New Tile
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_click
      type: table
      fields: [dj_click.event_date, dj_click.count]
      fill_fields: [dj_click.event_date]
      filters:
        dj_click.event_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_clicks, dj_facebook_ads.total_conversion]
      fill_fields: [dj_facebook_ads.date_start_date]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      sorts: [dj_facebook_ads.date_start_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_click.event_date
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_click.event_date
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: CONV. RATE
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_click.count, dj_facebook_ads.total_clicks, clicks, dj_activity.total_conversions,
      dj_facebook_ads.total_conversion, conversions]
    dynamic_fields: [{table_calculation: conversions, label: Conversions, expression: "sum(\n\
          \  coalesce(${dj_facebook_ads.total_conversion},0)\n  +coalesce(${dj_activity.total_conversions},0)\n\
          )", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: clicks, label: Clicks, expression: "sum(\n\
          \  coalesce(${dj_click.count},0)\n  +coalesce(${dj_facebook_ads.total_clicks},0)\n\
          )", value_format: '#,##0.00,, "M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: conv_rate, label: Conv. Rate, expression: "${conversions}/${clicks}",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Period: dj_click.event_date
    - Period: dj_facebook_ads.date_start_date
    - Period: dj_activity.event_date
    row: 7
    col: 3
    width: 3
    height: 2
  - name: Rev vs Conv by Campaign Category
    title: Rev vs Conv by Campaign Category
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: master_campaign_category
      type: table
      fields: [master_campaign_category.master_campaign_category]
      sorts: [master_campaign_category.master_campaign_category]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_match_table_campaigns.campaign_category, dj_activity.total_revenue,
        dj_activity.total_conversions]
      filters:
        dj_activity.event_date: 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
        dj_match_table_campaigns.campaign_name: "-%DART%"
      sorts: [dj_activity.total_revenue desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_match_table_campaigns.campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.campaign_category, dj_facebook_ads.total_revenue, dj_facebook_ads.total_conversion]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.total_revenue, dj_activity.total_conversions, match_table_paid_search.paid_search_campaign_category]
      filters:
        dj_activity.activity_id: '9007366'
        dj_activity.activity_date: 30 days
        dj_activity.event_sub_type: "-NULL"
        dj_match_table_campaigns.campaign_name: "%DART%"
      sorts: [dj_activity.total_revenue desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: match_table_paid_search.paid_search_campaign_category
        source_field_name: master_campaign_category.master_campaign_category
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: revenue, id: revenue,
            name: Revenue}], showLabels: true, showValues: true, valueFormat: '$#,##0.0,,
          "M"', unpinAxis: false, tickDensity: default, type: linear}, {label: '',
        orientation: right, series: [{axisId: conversions, id: conversions, name: Conversions}],
        showLabels: true, showValues: true, valueFormat: '#,##0.0, "K"', unpinAxis: false,
        tickDensity: default, type: linear}]
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
    label_value_format: ''
    series_types:
      media_spend: line
      conversions: line
    point_style: circle_outline
    series_colors:
      media_spend: "#B32F37"
      impressions: "#FFD95F"
      revenue: "#72D16D"
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_usd,
      dj_facebook_ads.total_revenue, dj_facebook_ads.total_conversion, dj_activity.total_revenue,
      dj_activity.total_conversions, q3_dj_activity.total_revenue, q3_dj_activity.total_conversions]
    type: looker_column
    sorts: [master_campaign_category.master_campaign_category]
    dynamic_fields: [{table_calculation: revenue, label: Revenue, expression: "coalesce(${dj_activity.total_revenue},0)\n\
          +coalesce(${dj_facebook_ads.total_revenue},0)\n+coalesce(${q3_dj_activity.total_revenue},0)",
        value_format: '$#,##0.0, "K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: conversions, label: Conversions,
        expression: "coalesce(${dj_facebook_ads.total_conversion},0)\n+coalesce(${dj_activity.total_conversions},0)\n\
          +coalesce(${q3_dj_activity.total_conversions},0)", value_format: "#,##0",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    -
    - Period: dj_activity.event_date
    - Period: dj_facebook_ads.date_start_date
    -
    row: 19
    col: 12
    width: 12
    height: 10
  - name: Conversion (copy)
    title: Conversion (copy)
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
      total: true
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_conversions]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days ago for 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_activity.event_date
        source_field_name: dj_impression.event_date
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_conversion]
      fill_fields: [dj_facebook_ads.date_start_date]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      sorts: [dj_facebook_ads.date_start_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_impression.event_date
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: FB CONVERSIONS
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
      media_spend, dj_activity.total_conversions, cpa, dj_facebook_ads.total_conversion]
    series_types: {}
    type: single_value
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: conversions, label: Conversions, expression: "sum(\n\
          coalesce(${dj_facebook_ads.total_conversion},0))", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_impression.event_date
    - Period: dj_activity.event_date
    - Period: dj_facebook_ads.date_start_date
    row: 7
    col: 9
    width: 3
    height: 2
  - name: New Tile (copy)
    title: New Tile (copy)
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_date, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_date]
      filters:
        dj_activity.event_date: 30 days
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
      sorts: [dj_activity.event_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_date, dj_facebook_ads.total_revenue]
      fill_fields: [dj_facebook_ads.date_start_date]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      sorts: [dj_facebook_ads.date_start_date desc]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_facebook_ads.date_start_date
        source_field_name: dj_activity.event_date
    custom_color_enabled: true
    custom_color: "#72D16D"
    show_single_value_title: true
    single_value_title: FB REVENUE
    value_format: '#,##0.00,, "M"'
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_activity.total_revenue, dj_facebook_ads.total_revenue]
    total: true
    dynamic_fields: [{table_calculation: total_revenue, label: Total Revenue, expression: 'sum(coalesce(${dj_facebook_ads.total_revenue},0))',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_activity.event_date
    - Period: dj_facebook_ads.date_start_date
    row: 7
    col: 12
    width: 3
    height: 2
  - title: TOP 10 Campaigns by Conversions
    name: TOP 10 Campaigns by Conversions
    model: david_jones_campaign_manager_dv360_v2
    explore: dj_activity
    type: looker_bar
    fields: [dj_match_table_campaigns.campaign_name_abr, dj_activity.total_conversions,
      dj_activity.total_revenue]
    filters:
      dj_activity.activity_id: '9007366'
      dj_activity.event_sub_type: "-NULL"
      dj_match_table_campaigns.campaign_name: "-DART Search"
    sorts: [dj_activity.total_conversions desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_activity.total_conversions,
            id: dj_activity.total_conversions, name: Total Conversions}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: "#,##0"
    series_types: {}
    series_colors:
      dj_activity.total_conversions: "#FBB555"
    defaults_version: 1
    hidden_fields: [dj_activity.total_revenue]
    listen:
      Period: dj_activity.event_date
    row: 31
    col: 10
    width: 7
    height: 7
  - title: TOP 10 Campaigns by Revenue
    name: TOP 10 Campaigns by Revenue
    model: david_jones_campaign_manager_dv360_v2
    explore: dj_activity
    type: looker_bar
    fields: [dj_match_table_campaigns.campaign_name_abr, dj_activity.total_conversions,
      dj_activity.total_revenue]
    filters:
      dj_activity.activity_id: '9007366'
      dj_activity.event_sub_type: "-NULL"
      dj_match_table_campaigns.campaign_name: "-DART Search"
    sorts: [dj_activity.total_conversions desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_activity.total_revenue,
            id: dj_activity.total_revenue, name: Total Revenue}], showLabels: false,
        showValues: true, valueFormat: '$#,##0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $#,##0, "K"
    series_types: {}
    series_colors:
      dj_activity.total_revenue: "#FBB555"
    defaults_version: 1
    hidden_fields: [dj_activity.total_conversions]
    listen:
      Period: dj_activity.event_date
    row: 31
    col: 17
    width: 7
    height: 7
  - name: ''
    type: text
    title_text: ''
    body_text: |-
      **Spring Racing campaign resonated well online despite ethical climate**


      - High visibility of campaign, especially on YouTube. 51% of people who saw the ad on YouTube watched the full video. YouTube component of campaign additionally drove 9.4K store visits, while Facebook drove 3.7K store visits. However, Facebook drove the lions share of online purchases ($143K in revenue). Good to see channels working in harmony.
      - Would attribute this success to the strength of the campaign creative which focused on the party season vs. Spring Racing, illustrated through video with vibrant product which interchanged between cuts rapidly. Also reflected in most-sold products.
      - Minor mentions around horse racing ethics, but for most part comments about where featured products can be found. Opportunity for stronger presence of community management from David Jones in locating products for commenters.
      - Top revenue driving brands featured in the campaign: Bec & Bridge, Olga Berg, Mimco, Sophia Webster & Axel Arigato

      **Beat previous years Paid Search performance for VOSN**
      - Captured $640K in revenue during 2018 and $875K in revenue during 2019
      - Early release of offers during 2019 helped boost overall revenue for the week substantially
    row: 71
    col: 0
    width: 7
    height: 9
  - name: " (2)"
    type: text
    title_text: ''
    body_text: |-
      **True View for Shopping**
      What: Make products featured in campaign videos shoppable. Tested on Spring Racing campaign. Why: Help viewers easily find featured product.
      Result: While test only drove a small amount of purchases, the format drove high visibility and in- store visits. May be worth continuing to test in future.
      **Lookbook ad format**
      What: Digital catalogue run across Facebook. Tested on Christmas Trim & Entertaining campaign. Why: Digitise in-store catalogues and make them instantly shoppable.
      Result: Highest revenue increase when compared to past Home Christmas campaigns.
      **Dual-gender collections ads**
      What: Inclusion of men's product within Collections Ads targeted at women. Tested on Spring Racing. Why: Move more men’s product, as women will tend to purchase on behalf of partner.
      Result: 74% of men's products were sold through the dual gender-ads.
    row: 71
    col: 7
    width: 6
    height: 9
  - name: " (3)"
    type: text
    title_text: ''
    body_text: |-
      **Product feed health needs work**
      - Close to 40% of revenue activity is supported by product feeds
      - Product taxonomy across Google, Bing & Facebook needs cleaning up. For example, Camilla
      dresses categorised as birthday cards.
      - Opportunity to narrow Facebook remarketing product feed to only include core categories, brands
      or products. Currently remarketing on >240K products. NOTE: recommend starting broad and
      narrowing slowly
      - Columbus and David Jones about to start regular catch ups with Intelligent Reach on clean up to
      prepare for Christmas period.
      Once cleaned, opportunities include:
      - Enhanced performance across campaigns reliant on feeds
      - Dynamic Ads for Broad Audiences on Facebook (drive newness and prospecting via automation)
      - Dynamic cross-sell campaigns on Facebook
      - Dynamic ad copy on search (can automatically update ad copy to highlight when sales are on)
    row: 71
    col: 13
    width: 6
    height: 9
  - name: " (4)"
    type: text
    title_text: ''
    body_text: |-
      **Trial new Facebook remarketing ad units**
      What: Collections Ads are now available for Dynamic Product Ads
      Why: Collections ad format strong driver of revenue within brand marketing campaigns
      **Merchant Promotions on search**
      What: Merchant Promotions sit below text ads and are used to call out sales promotions Why: Increase visibility of tactical offers during peak sales periods where competition is high
      **Location extensions on SEM**
      What: A section below a paid search ad that directs people to their nearest store.
      Why: Enable people to easily find their nearest store when browsing and measure value of a store visit.
    row: 71
    col: 19
    width: 5
    height: 9
  - name: HIGHLIGHTS
    type: text
    title_text: HIGHLIGHTS
    row: 69
    col: 0
    width: 7
    height: 2
  - name: TESTED
    type: text
    title_text: TESTED
    row: 69
    col: 7
    width: 6
    height: 2
  - name: OPPORTUNITIES
    type: text
    title_text: OPPORTUNITIES
    row: 69
    col: 13
    width: 6
    height: 2
  - name: TO TEST
    type: text
    title_text: TO TEST
    row: 69
    col: 19
    width: 5
    height: 2
  - name: " (5)"
    type: text
    body_text: "**NOTE:** Data is not de-duped and figures are still settling. Therefore\
      \ there will be discrepancies in the total revenue and ROAS across channels."
    row: 80
    col: 0
    width: 24
    height: 2
  - name: PAID MEDIA
    type: text
    title_text: PAID MEDIA
    body_text: "****"
    row: 2
    col: 6
    width: 2
    height: 3
  - name: ALL MEDIA
    type: text
    title_text: ALL MEDIA
    row: 2
    col: 18
    width: 2
    height: 3
  - name: " (6)"
    type: text
    body_text: "[](url)"
    row: 2
    col: 0
    width: 6
    height: 3
  - name: " (7)"
    type: text
    subtitle_text: ''
    body_text: "[](url)"
    row: 2
    col: 10
    width: 5
    height: 3
  - title: TOP 10 Campaigns by Conversions
    name: TOP 10 Campaigns by Conversions (2)
    model: facebook_ads
    explore: dj_facebook_ads
    type: looker_bar
    fields: [dj_facebook_ads.campaign_name_abr, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_spend]
    sorts: [dj_facebook_ads.total_conversion desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_facebook_ads.total_spend,
            id: dj_facebook_ads.total_spend, name: Total Spend}], showLabels: false,
        showValues: true, valueFormat: '$#,##0, "K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    label_value_format: '#,##0.0, "K"'
    series_types: {}
    series_colors:
      dj_facebook_ads.total_spend: "#B32F37"
      dj_facebook_ads.total_conversion: "#B32F37"
    defaults_version: 1
    hidden_fields: [dj_facebook_ads.total_spend]
    listen:
      Period: dj_facebook_ads.date_start_date
    row: 45
    col: 10
    width: 7
    height: 7
  - title: TOP 10 Campaigns by Revenue
    name: TOP 10 Campaigns by Revenue (2)
    model: facebook_ads
    explore: dj_facebook_ads
    type: looker_bar
    fields: [dj_facebook_ads.campaign_name_abr, dj_facebook_ads.total_spend, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_revenue]
    sorts: [dj_facebook_ads.total_revenue desc]
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
    limit_displayed_rows: true
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_facebook_ads.total_revenue,
            id: dj_facebook_ads.total_revenue, name: Total Revenue}], showLabels: false,
        showValues: true, valueFormat: '$#,##0.0,, "M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hide_legend: false
    label_value_format: $#,##0.00,, "M"
    series_types: {}
    series_colors:
      dj_facebook_ads.total_spend: "#B32F37"
      dj_facebook_ads.total_conversion: "#B32F37"
      dj_facebook_ads.total_revenue: "#B32F37"
    defaults_version: 1
    hidden_fields: [dj_facebook_ads.total_spend, dj_facebook_ads.total_conversion]
    listen:
      Period: dj_facebook_ads.date_start_date
    row: 45
    col: 17
    width: 7
    height: 7
  - title: TOP 10 Campaigns by Revenue
    name: TOP 10 Campaigns by Revenue (3)
    model: google_ads
    explore: dj_master_stats
    type: looker_bar
    fields: [dj_campaign.campaign_name, dj_master_stats.total_revenue]
    filters: {}
    sorts: [dj_master_stats.total_revenue desc]
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
    limit_displayed_rows: true
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_master_stats.total_revenue,
            id: dj_master_stats.total_revenue, name: Total Revenue}], showLabels: false,
        showValues: true, valueFormat: '#,##0,,"M"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: $#,##0.0,"K"
    series_types: {}
    series_colors:
      dj_master_stats.total_cost_usd: "#E57947"
      dj_master_stats.total_revenue: "#E57947"
    series_labels:
      dj_master_stats.total_cost_usd: Media Spend
    defaults_version: 1
    listen:
      Period: dj_ad_group._data_date
    row: 38
    col: 17
    width: 7
    height: 7
  - name: New Tile (3)
    title: New Tile
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.total_revenue, dj_activity.total_conversions]
      filters:
        dj_activity.activity_id: '9007366'
        dj_activity.event_date: 30 days
        dj_activity.event_sub_type: "-NULL"
      limit: 500
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.total_revenue, dj_facebook_ads.total_conversion]
      filters:
        dj_facebook_ads.date_start_date: 30 days
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields: []
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: AOV
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_activity.total_revenue, dj_activity.total_conversions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_revenue]
    dynamic_fields: [{table_calculation: aov, label: AOV, expression: 'sum(${dj_activity.total_revenue}+${dj_facebook_ads.total_revenue})/sum(${dj_facebook_ads.total_conversion}+${dj_activity.total_conversions})',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number}]
    listen:
    - Period: dj_activity.event_date
    - Period: dj_facebook_ads.date_start_date
    row: 7
    col: 6
    width: 3
    height: 2
  - title: TOP 10 Campaigns by Conversions
    name: TOP 10 Campaigns by Conversions (3)
    model: google_ads
    explore: dj_master_stats
    type: looker_bar
    fields: [dj_campaign.campaign_name, dj_master_stats.total_conversions]
    filters: {}
    sorts: [dj_master_stats.total_conversions desc]
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
    limit_displayed_rows: true
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: dj_master_stats.total_cost_usd,
            id: dj_master_stats.total_cost_usd, name: Media Spend}], showLabels: false,
        showValues: true, valueFormat: '$#,##0,"K"', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    label_value_format: '##0.0,"K"'
    series_types: {}
    series_colors:
      dj_master_stats.total_cost_usd: "#E57947"
      dj_master_stats.total_conversions: "#E57947"
    series_labels:
      dj_master_stats.total_cost_usd: Media Spend
    defaults_version: 1
    listen:
      Period: dj_ad_group._data_date
    row: 38
    col: 10
    width: 7
    height: 7
  - name: "[DV360] Impr vs Target"
    title: "[DV360] Impr vs Target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_week, dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_week]
      filters:
        dj_impression.event_date: 4 weeks ago for 4 weeks
      sorts: [dj_impression.event_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_impression.event_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_dv360_forecast
      type: table
      fields: [dj_dv360_forecast.week_start_date, dj_dv360_forecast.budget_target,
        dj_dv360_forecast.impressions_target]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_dv360_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Impressions (Last Week)
    value_format: '#,##0.0,,"M"'
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: greater than, value: 100, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency,
      dj_dv360_forecast.budget_target, dj_dv360_forecast.impressions_target]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: impressions, label: Impressions, expression: 'sum(coalesce(${dj_impression.count_impressions},0))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: impressions_target, label: Impressions
          Target, expression: 'sum(coalesce(${dj_dv360_forecast.impressions_target},0))',
        value_format: '#,##0.0,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_impression.event_week
    -
    row: 54
    col: 4
    width: 4
    height: 5
  - name: "[DV360] Spend vs Budget"
    title: "[DV360] Spend vs Budget"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_impression
      type: table
      fields: [dj_impression.event_week, dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency]
      fill_fields: [dj_impression.event_week]
      filters:
        dj_impression.event_date: 1 weeks ago for 1 weeks
      sorts: [dj_impression.event_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_impression.event_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_dv360_forecast
      type: table
      fields: [dj_dv360_forecast.week_start_date, dj_dv360_forecast.budget_target,
        dj_dv360_forecast.impressions_target]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_dv360_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Media Spend (Last Week)
    value_format: ''
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: greater than, value: 100, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency,
      dj_dv360_forecast.budget_target, dj_dv360_forecast.impressions_target]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: media_spend, label: Media Spend, expression: 'sum(coalesce(${dj_impression.total_revenue_advertiser_currency},0))',
        value_format: '$#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: budget, label: Budget, expression: 'sum(coalesce(${dj_dv360_forecast.budget_target},0))',
        value_format: '$#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_impression.event_week
    -
    row: 54
    col: 12
    width: 4
    height: 5
  - name: "[DV360] Clicks vs Target"
    title: "[DV360] Clicks vs Target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_click
      type: table
      fields: [dj_click.click_week, dj_click.count]
      fill_fields: [dj_click.click_week]
      filters:
        dj_click.click_date: 1 weeks ago for 1 weeks
        dj_match_table_campaigns.campaign_name: "-%DART%"
      sorts: [dj_click.click_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_click.click_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_dv360_forecast
      type: table
      fields: [dj_dv360_forecast.week_start_date, dj_dv360_forecast.clicks_target,
        dj_dv360_forecast.revenue_target, dj_dv360_forecast.transactions_target]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_dv360_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Clicks (Last Week)
    value_format: ''
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: greater than, value: 100, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency,
      dj_click.count, dj_dv360_forecast.clicks_target, dj_dv360_forecast.revenue_target,
      dj_dv360_forecast.transactions_target, dj_activity.total_revenue, dj_activity.total_conversions,
      transactions]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: clicks, label: Clicks, expression: 'sum(coalesce(${dj_click.count},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: clicks_target, label: Clicks Target,
        expression: 'sum(coalesce(${dj_dv360_forecast.clicks_target},0))', value_format: '#,##0.0,"K"',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Forecast Period: dj_click.event_week
    -
    row: 54
    col: 8
    width: 4
    height: 5
  - name: "[DV360]Transact vs target"
    title: "[DV360]Transact vs target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.total_revenue, dj_activity.total_conversions, dj_activity.activity_week]
      fill_fields: [dj_activity.activity_week]
      filters:
        dj_activity.activity_week: 1 weeks ago for 1 weeks
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
        dj_match_table_campaigns.campaign_name: "-%DART%"
      sorts: [dj_activity.activity_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_activity.activity_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_dv360_forecast
      type: table
      fields: [dj_dv360_forecast.week_start_date, dj_dv360_forecast.clicks_target,
        dj_dv360_forecast.revenue_target, dj_dv360_forecast.transactions_target]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_dv360_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Transactions (Last Week)
    value_format: ''
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: greater than, value: 100, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency,
      dj_click.count, dj_dv360_forecast.clicks_target, dj_dv360_forecast.revenue_target,
      dj_dv360_forecast.transactions_target, dj_activity.total_revenue, dj_activity.total_conversions]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: transactions, label: Transactions, expression: 'sum(coalesce(${dj_activity.total_conversions},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: transactions_target, label: Transactions
          Target, expression: 'sum(coalesce(${dj_dv360_forecast.transactions_target},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_activity.event_week
    -
    row: 54
    col: 16
    width: 4
    height: 5
  - name: "[DV360] Revenue vs target"
    title: "[DV360] Revenue vs target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.activity_week, dj_activity.total_revenue, dj_activity.total_conversions]
      fill_fields: [dj_activity.activity_week]
      filters:
        dj_activity.activity_week: 1 weeks ago for 1 weeks
        dj_activity.activity_id: '9007366'
        dj_activity.event_sub_type: "-NULL"
        dj_match_table_campaigns.campaign_name: "-%DART%"
      sorts: [dj_activity.activity_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_activity.activity_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
      join_fields: []
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_dv360_forecast
      type: table
      fields: [dj_dv360_forecast.week_start_date, dj_dv360_forecast.clicks_target,
        dj_dv360_forecast.revenue_target, dj_dv360_forecast.transactions_target]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_dv360_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Revenue (Last Week)
    value_format: ''
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting: [{type: greater than, value: 100, background_color: "#72D16D",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [dj_impression.count_impressions, dj_impression.total_revenue_advertiser_currency,
      dj_click.count, dj_dv360_forecast.clicks_target, dj_dv360_forecast.revenue_target,
      dj_dv360_forecast.transactions_target, dj_activity.total_revenue, dj_activity.total_conversions]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: revenue, label: Revenue, expression: 'sum(coalesce(${dj_activity.total_revenue},0))',
        value_format: "$#,##0", value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue_target, label: Revenue Target,
        expression: 'sum(coalesce(${dj_dv360_forecast.revenue_target},0))', value_format: "$#,##0",
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Forecast Period: dj_activity.event_week
    -
    row: 54
    col: 20
    width: 4
    height: 5
  - name: "[Paid Social] Impressions vs Target"
    title: "[Paid Social] Impressions vs Target"
    merged_queries:
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue, dj_facebook_ads.total_spend,
        dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks ago for 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_facebook_ads.date_start_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_paid_social_forecast
      type: looker_column
      fields: [dj_paid_social_forecast.budget_target, dj_paid_social_forecast.clicks_target,
        dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
        dj_paid_social_forecast.transactions_target, dj_paid_social_forecast.week_start_date]
      sorts: [dj_paid_social_forecast.budget_target desc, dj_paid_social_forecast.week_start_date]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      show_null_points: true
      interpolation: linear
      join_fields:
      - field_name: dj_paid_social_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Impressions (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_paid_social_forecast.clicks_target, dj_paid_social_forecast.budget_target,
      dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
      dj_paid_social_forecast.transactions_target, dj_facebook_ads.total_revenue,
      dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_clicks, date_merge, dj_facebook_ads.date_start_week]
    dynamic_fields: [{table_calculation: impressions_target, label: Impressions Target,
        expression: 'sum(coalesce(${dj_paid_social_forecast.impressions_target},0))',
        value_format: '#,##0,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: impressions, label: Impressions,
        expression: 'sum(coalesce(${dj_facebook_ads.total_impressions},0))', value_format: '#,##0,,"M"',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Forecast Period: dj_facebook_ads.date_start_week
    -
    row: 59
    col: 4
    width: 4
    height: 5
  - name: "[Paid Social] Spend vs Budget"
    title: "[Paid Social] Spend vs Budget"
    merged_queries:
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue, dj_facebook_ads.total_spend,
        dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks ago for 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_facebook_ads.date_start_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_paid_social_forecast
      type: looker_column
      fields: [dj_paid_social_forecast.budget_target, dj_paid_social_forecast.clicks_target,
        dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
        dj_paid_social_forecast.transactions_target, dj_paid_social_forecast.week_start_date]
      sorts: [dj_paid_social_forecast.budget_target desc, dj_paid_social_forecast.week_start_date]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      show_null_points: true
      interpolation: linear
      join_fields:
      - field_name: dj_paid_social_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Media Spend (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_paid_social_forecast.clicks_target, dj_paid_social_forecast.budget_target,
      dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
      dj_paid_social_forecast.transactions_target, dj_facebook_ads.total_revenue,
      dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_clicks, date_merge, dj_facebook_ads.date_start_week]
    dynamic_fields: [{table_calculation: spend, label: Spend, expression: 'sum(coalesce(${dj_facebook_ads.total_spend},0))',
        value_format: '$#,##0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: budget, label: Budget, expression: 'sum(coalesce(${dj_paid_social_forecast.budget_target},0))',
        value_format: '$#,##0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_facebook_ads.date_start_week
    -
    row: 59
    col: 12
    width: 4
    height: 5
  - name: "[Paid Social] Clicks vs Target"
    title: "[Paid Social] Clicks vs Target"
    merged_queries:
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue, dj_facebook_ads.total_spend,
        dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks ago for 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_facebook_ads.date_start_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_paid_social_forecast
      type: looker_column
      fields: [dj_paid_social_forecast.budget_target, dj_paid_social_forecast.clicks_target,
        dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
        dj_paid_social_forecast.transactions_target, dj_paid_social_forecast.week_start_date]
      sorts: [dj_paid_social_forecast.budget_target desc, dj_paid_social_forecast.week_start_date]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      show_null_points: true
      interpolation: linear
      join_fields:
      - field_name: dj_paid_social_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Clicks (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_paid_social_forecast.clicks_target, dj_paid_social_forecast.budget_target,
      dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
      dj_paid_social_forecast.transactions_target, dj_facebook_ads.total_revenue,
      dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_clicks, date_merge, dj_facebook_ads.date_start_week]
    dynamic_fields: [{table_calculation: clicks, label: Clicks, expression: 'sum(coalesce(${dj_facebook_ads.total_clicks},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: clicks_target, label: Clicks Target,
        expression: 'sum(coalesce(${dj_paid_social_forecast.clicks_target},0))', value_format: '#,##0.0,"K"',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    listen:
    - Forecast Period: dj_facebook_ads.date_start_week
    -
    row: 59
    col: 8
    width: 4
    height: 5
  - name: "[Paid Social] Transac vs Target"
    title: "[Paid Social] Transac vs Target"
    merged_queries:
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue, dj_facebook_ads.total_spend,
        dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks ago for 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_facebook_ads.date_start_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_paid_social_forecast
      type: looker_column
      fields: [dj_paid_social_forecast.budget_target, dj_paid_social_forecast.clicks_target,
        dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
        dj_paid_social_forecast.transactions_target, dj_paid_social_forecast.week_start_date]
      sorts: [dj_paid_social_forecast.budget_target desc, dj_paid_social_forecast.week_start_date]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      show_null_points: true
      interpolation: linear
      join_fields:
      - field_name: dj_paid_social_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Transactions (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_paid_social_forecast.clicks_target, dj_paid_social_forecast.budget_target,
      dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
      dj_paid_social_forecast.transactions_target, dj_facebook_ads.total_revenue,
      dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_clicks, date_merge, dj_facebook_ads.date_start_week]
    dynamic_fields: [{table_calculation: conversions, label: Conversions, expression: 'sum(coalesce(${dj_facebook_ads.total_conversion},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: conversions_target, label: Conversions
          Target, expression: 'sum(coalesce(${dj_paid_social_forecast.transactions_target},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_facebook_ads.date_start_week
    -
    row: 59
    col: 16
    width: 4
    height: 5
  - name: "[Paid Social] Revenue vs Target"
    title: "[Paid Social] Revenue vs Target"
    merged_queries:
    - model: facebook_ads
      explore: dj_facebook_ads
      type: table
      fields: [dj_facebook_ads.date_start_week, dj_facebook_ads.total_revenue, dj_facebook_ads.total_spend,
        dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion, dj_facebook_ads.total_clicks]
      fill_fields: [dj_facebook_ads.date_start_week]
      filters:
        dj_facebook_ads.date_start_week: 4 weeks ago for 4 weeks
      sorts: [dj_facebook_ads.date_start_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_facebook_ads.date_start_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: facebook_ads
      explore: dj_paid_social_forecast
      type: looker_column
      fields: [dj_paid_social_forecast.budget_target, dj_paid_social_forecast.clicks_target,
        dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
        dj_paid_social_forecast.transactions_target, dj_paid_social_forecast.week_start_date]
      sorts: [dj_paid_social_forecast.budget_target desc, dj_paid_social_forecast.week_start_date]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      show_null_points: true
      interpolation: linear
      join_fields:
      - field_name: dj_paid_social_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Revenue (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_paid_social_forecast.clicks_target, dj_paid_social_forecast.budget_target,
      dj_paid_social_forecast.impressions_target, dj_paid_social_forecast.revenue_target,
      dj_paid_social_forecast.transactions_target, dj_facebook_ads.total_revenue,
      dj_facebook_ads.total_spend, dj_facebook_ads.total_impressions, dj_facebook_ads.total_conversion,
      dj_facebook_ads.total_clicks, date_merge, dj_facebook_ads.date_start_week]
    dynamic_fields: [{table_calculation: revenue, label: Revenue, expression: 'sum(coalesce(${dj_facebook_ads.total_revenue},0))',
        value_format: '$#,##0.00,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue_target, label: Revenue Target,
        expression: 'sum(coalesce(${dj_paid_social_forecast.revenue_target},0))',
        value_format: '$#,##0.00,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_facebook_ads.date_start_week
    -
    row: 59
    col: 20
    width: 4
    height: 5
  - name: "[Paid Search] Transac vs Target"
    title: "[Paid Search] Transac vs Target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_week, dj_activity.total_conversions, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_week]
      filters:
        dj_activity.event_sub_type: "-NULL"
        dj_activity.event_week: 4 weeks ago for 4 weeks
        dj_activity.activity_id: '9007366'
        dj_match_table_campaigns.campaign_name: "%DART%"
      sorts: [dj_activity.event_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_activity.event_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_paid_search_forecast
      type: table
      fields: [dj_paid_search_forecast.week_start_date, dj_paid_search_forecast.revenue_target,
        dj_paid_search_forecast.transactions_target, dj_paid_search_forecast.budget_target]
      sorts: [dj_paid_search_forecast.week_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_paid_search_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Transactions (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_activity.total_conversions, dj_activity.total_revenue, dj_paid_search_forecast.revenue_target,
      dj_paid_search_forecast.transactions_target, dj_paid_search_forecast.budget_target]
    dynamic_fields: [{table_calculation: transactions, label: Transactions, expression: 'sum(coalesce(${dj_activity.total_conversions},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: transactions_target, label: Transactions
          Target, expression: 'sum(coalesce(${dj_paid_search_forecast.transactions_target},0))',
        value_format: '#,##0.0,"K"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_activity.event_week
    -
    row: 64
    col: 16
    width: 4
    height: 5
  - name: "[Paid Search] Revenue vs Target"
    title: "[Paid Search] Revenue vs Target"
    merged_queries:
    - model: david_jones_campaign_manager_dv360_v2
      explore: dj_activity
      type: table
      fields: [dj_activity.event_week, dj_activity.total_conversions, dj_activity.total_revenue]
      fill_fields: [dj_activity.event_week]
      filters:
        dj_activity.event_sub_type: "-NULL"
        dj_activity.event_week: 4 weeks ago for 4 weeks
        dj_activity.activity_id: '9007366'
        dj_match_table_campaigns.campaign_name: "%DART%"
      sorts: [dj_activity.event_week desc]
      limit: 500
      dynamic_fields: [{table_calculation: date_merge, label: date_merge, expression: 'to_string(${dj_activity.event_week})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
          _type_hint: string}]
      query_timezone: America/Los_Angeles
    - model: google_ads
      explore: dj_paid_search_forecast
      type: table
      fields: [dj_paid_search_forecast.week_start_date, dj_paid_search_forecast.revenue_target,
        dj_paid_search_forecast.transactions_target, dj_paid_search_forecast.budget_target]
      sorts: [dj_paid_search_forecast.week_start_date]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: dj_paid_search_forecast.week_start_date
        source_field_name: date_merge
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Revenue (Last Week)
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [dj_activity.total_conversions, dj_activity.total_revenue, dj_paid_search_forecast.revenue_target,
      dj_paid_search_forecast.transactions_target, dj_paid_search_forecast.budget_target]
    dynamic_fields: [{table_calculation: revenue, label: Revenue, expression: 'sum(coalesce(${dj_activity.total_revenue},0))',
        value_format: '$#,##0.0,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: revenue_target, label: Revenue Target,
        expression: 'sum(coalesce(${dj_paid_search_forecast.revenue_target},0))',
        value_format: '$#,##0.0,,"M"', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Forecast Period: dj_activity.event_week
    -
    row: 64
    col: 20
    width: 4
    height: 5
  - name: <img src="https://wwwmedianetcom/images/icon-DV360png"height="50">
    type: text
    title_text: <img src="https://www.medianet.com/images/icon-DV360.png"height="50">
    subtitle_text: DV360
    row: 54
    col: 0
    width: 4
    height: 5
  - name: <img src="https://wwwmedianetcom/images/icon-SA360png" height="50">
    type: text
    title_text: <img src="https://www.medianet.com/images/icon-SA360.png" height="50">
    subtitle_text: Paid Search
    row: 64
    col: 0
    width: 4
    height: 5
  - name: <img src="https://imageflaticoncom/icons/svg/124/124010svg"height="50">
    type: text
    title_text: <img src="https://image.flaticon.com/icons/svg/124/124010.svg"height="50">
    subtitle_text: Facebook
    row: 59
    col: 0
    width: 4
    height: 5
  - name: " (8)"
    type: text
    body_text: "[](url)"
    row: 64
    col: 4
    width: 12
    height: 5
  - name: <img src="https://wwwpinclipartcom/picdir/big/381-3813478_forecast-1-to-3-yrs-analytics-icon-pngpng"height="25">
      Forecast
    type: text
    title_text: <img src="https://www.pinclipart.com/picdir/big/381-3813478_forecast-1-to-3-yrs-analytics-icon-png.png"height="25">
      Forecast
    subtitle_text: ''
    body_text: ''
    row: 52
    col: 0
    width: 24
    height: 2
  - name: <img src="https://wwwlearngeekco/wp-content/uploads/2015/07/ICON-Top_10png"
      height="60"> TOP 10 CAMPAIGNS
    type: text
    title_text: <img src="https://www.learngeek.co/wp-content/uploads/2015/07/ICON-Top_10.png"
      height="60"> TOP 10 CAMPAIGNS
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  filters:
  - name: Period
    title: Period
    type: date_filter
    default_value: 30 days ago for 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: Forecast Period
    title: Forecast Period
    type: date_filter
    default_value: 1 weeks ago for 1 weeks
    allow_multiple_values: true
    required: false
