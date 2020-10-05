include: "/views/**/*"

explore: dj_impression {
  view_name: dj_impression
  group_label: "01-David Jones"
  label: "01.013 CM+DV360 Impressions"
  view_label: "Impressions"

  sql_always_where: ${impression_raw} > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY)) ;;

  join: dj_match_table_ads {
    view_label: "Ads"
    sql_on: ${dj_impression.ad_id} = ${dj_match_table_ads.ad_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_campaigns {
    view_label: "Campaigns"
    sql_on: ${dj_impression.campaign_id} = ${dj_match_table_campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_advertisers {
    view_label: "Advertisers"
    sql_on: ${dj_impression.advertiser_id} = ${dj_match_table_advertisers.advertiser_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_ad_placement_assignments {
    view_label: "Ad Placements"
    sql_on: ${dj_impression.ad_id} = ${dj_match_table_ad_placement_assignments.ad_id} and ${dj_impression.placement_id} = ${dj_match_table_ad_placement_assignments.placement_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_browsers {
    view_label: "Browsers"
    sql_on: ${dj_impression.browser_platform_id} = ${dj_match_table_browsers.browser_platform_id} ;;
    relationship: many_to_one
  }

  join: dj_match_table_creatives {
    view_label: "Creatives"
    sql_on: ${dj_impression.rendering_id} = ${dj_match_table_creatives.rendering_id} ;;
    relationship: many_to_one
  }
  join: dj_match_table_operating_systems {
    view_label: "Operating System"
    sql_on: ${dj_impression.operating_system_id_key} = ${dj_match_table_operating_systems.operating_system_id_key} ;;
    relationship: many_to_one
  }

  join: user_impression_facts {
    relationship: one_to_one
    sql_on: ${dj_impression.user_id} = ${user_impression_facts.user_id} and ${dj_impression.campaign_id} = ${user_impression_facts.campaign_id} ;;
  }

}
