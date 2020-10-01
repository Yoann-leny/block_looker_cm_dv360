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

  dimension: paid_search_campaign {
    type: string
    sql: ${TABLE}.Paid_Search_Campaign ;;
  }

  dimension: paid_search_campaign_category {
    type: string
    sql: Case
          when ${paid_search_campaign} like "%DR%" OR ${paid_search_campaign} like "%remarketing%" then "Programs"
          when ${paid_search_campaign} like "%Programs%" then "Programs"
         when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] like "%Mixed%" then "Brands"
         when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] like "%Electrical%" then "Home & Electrical"
         when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] like "%Home%" then "Home & Electrical"
    when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] like "%Shoes%" then "Shoes & Accessories"
          when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] = "Menswear" then "Men"
          when SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)] = "Womenswear" then "Women"
         else ifnull(SPLIT(${paid_search_campaign}, ' - ')[SAFE_OFFSET(2)],"Unknown") end  ;;
  }
}
