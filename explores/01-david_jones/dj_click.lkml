include: "/views/**/*"

explore: dj_click{
  view_name: dj_click
  group_label: "01-David Jones"

  label: "01.012 CM+DV360 Clicks"
  view_label: "Clicks"

  sql_always_where: ${click_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;

  join: dj_match_table_ads {
    view_label: "Ads"
    sql_on: ${dj_click.ad_id} = ${dj_match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${dj_click.campaign_id} = ${dj_match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${dj_click.advertiser_id} = ${dj_match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${dj_click.ad_id} = ${dj_match_table_ad_placement_assignments.ad_id}
    and ${dj_click.placement_id} = ${dj_match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_browsers {
    view_label: "Browsers"
    sql_on: ${dj_click.browser_platform_id} = ${dj_match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_paid_search {
    view_label: "Paid Search"
    sql_on: ${dj_click.ad_id} = ${dj_match_table_paid_search.ad_id}
    and ${dj_click.advertiser_id} = ${dj_match_table_paid_search.advertiser_id}
    and ${dj_click.campaign_id} = ${dj_match_table_paid_search.campaign_id}
    and ${dj_click.segment_value_1} = ${dj_match_table_paid_search.Paid_Search_Legacy_Keyword_ID};;
    relationship: many_to_one
  }
}
