# include: "/views/**/*"

# explore: dj_impression_funnel {
#   view_name: dj_impression_funnel
#   hidden: yes
#   group_label: "01-David Jones"
#   label: "01.014 CM+DV360 Impression Funnel"

#   sql_always_where: TIMESTAMP(${first_ad_impression_date}) > TIMESTAMP(DATE_ADD(CURRENT_DATE, INTERVAL -60 DAY))  ;;

#   join: dj_match_table_campaigns {
#     view_label: "Campaigns"
#     sql_on: ${dj_impression_funnel.campaign_id} =  ${dj_match_table_campaigns.campaign_id} ;;
#     relationship: many_to_one
#   }

#   join: dj_match_table_ads {
#     view_label: "Ads"
#     sql_on: ${dj_impression_funnel.ad_id} = ${dj_match_table_ads.ad_id} ;;
#     relationship: many_to_one
#   }

#   join: dj_match_table_advertisers {
#     view_label: "Advertisers"
#     sql_on: ${dj_impression_funnel.advertiser_id} = ${dj_match_table_advertisers.advertiser_id} ;;
#     relationship: many_to_one
#   }

#   join: user_campaign_facts {
#     view_label: "Users"
#     sql_on: ${dj_impression_funnel.campaign_id} = ${user_campaign_facts.campaign_id} AND ${dj_impression_funnel.user_id} = ${user_campaign_facts.user_id} ;;
#     relationship: many_to_one
#   }

# }
