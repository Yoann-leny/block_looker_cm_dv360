include: "/views/**/*"

explore: dj_activity{
#   always_filter: {
#     filters: [activity.brand_name: "David Jones"]
#   }
  view_name: dj_activity
 group_label: "01-David Jones"
  label: "01.011 CM+DV360 Activities"
  view_label: "Activities"

  sql_always_where: ${activity_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;

  join: match_table_ads {
    view_label: "Ads"
    sql_on: ${dj_activity.ad_id} = ${match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${dj_activity.campaign_id} = ${match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${dj_activity.advertiser_id} = ${match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${dj_activity.ad_id} = ${match_table_ad_placement_assignments.ad_id} and ${dj_activity.placement_id} = ${match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: match_table_browsers {
    view_label: "Browsers"
    sql_on: ${dj_activity.browser_platform_id} = ${match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }
}
