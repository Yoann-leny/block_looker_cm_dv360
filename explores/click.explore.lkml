include: "/views/**/*"

explore: click{
  view_name: click
  group_label: "01-David Jones"

  label: "01.012 CM+DV360 Clicks"
  view_label: "Clicks"

  sql_always_where: ${click_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;

  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${click.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${click.campaign_id} = ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${click.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${click.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${click.placement_id} = ${match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: match_table_browsers {
    view_label: "Browsers"
    sql_on: ${click.browser_platform_id} = ${match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }
}
