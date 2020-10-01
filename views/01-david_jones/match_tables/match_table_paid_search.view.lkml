view: match_table_paid_search {

  sql_table_name: (select distinct advertiser_id, ad_id, campaign_id, Paid_Search_Legacy_Keyword_ID, Paid_Search_Campaign
  from `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.match_table_paid_search_@{DJ_CAMPAIGN_MANAGER_ID}`
  where _LATEST_DATE = _DATA_DATE) ;;

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: Paid_Search_Legacy_Keyword_ID {
    type: string
    sql: ${TABLE}.Paid_Search_Legacy_Keyword_ID ;;
  }

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }

  dimension: Paid_Search_Campaign {
    type: string
    sql: ${TABLE}.Paid_Search_Campaign ;;
  }
}
