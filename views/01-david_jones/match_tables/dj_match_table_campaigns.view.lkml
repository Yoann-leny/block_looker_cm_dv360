view: dj_match_table_campaigns {
  sql_table_name: (select * from `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.match_table_campaigns_@{DJ_CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: advertiser_id {
    type: string
    hidden: yes
    sql: ${TABLE}.Advertiser_ID ;;
  }

  dimension: billing_invoice_code {
    type: string
    sql: ${TABLE}.Billing_Invoice_Code ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.Campaign ;;
  }
  dimension: campaign_name_abr {
    label: "Campaign Name"
    type: string
    sql: Case when ${campaign_name} like "BidManager%" then ${campaign_name}
    when SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] is null and SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)] is not null
    then ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(1)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(3)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(4)],"")
    else
    ifnull(SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(1)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(3)] ,"")
    || " " || ifnull(SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(4)] ,"") end ;;
  }
  dimension: campaign_category {
    type: string
    sql:  Case when ${campaign_name} like "BidManager%" then "Unknown"
    when SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] is null and SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)] is not null
    then Case
    when ${campaign_name} like "%DR%" OR ${campaign_name} like "%remarketing%" then "Programs"
    when ${campaign_name} like "%Programs%" then "Programs"
    when SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)] = "Menswear" then "Men"
    when SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)] = "Womenswear" then "Women"
   else ifnull(SPLIT(${campaign_name}, '_')[SAFE_OFFSET(2)],"") end
  else
    Case
    when ${campaign_name} like "%DR%" OR ${campaign_name} like "%remarketing%" then "Programs"
    when ${campaign_name} like "%Programs%" then "Programs"
    when SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] = "Menswear" then "Men"
    when SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)] = "Womenswear" then "Women"
   else ifnull(SPLIT(${campaign_name}, ' | ')[SAFE_OFFSET(2)],"") end end ;;
    drill_fields: [campaign_name]
  }

  dimension_group: campaign_end {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_End_Date ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: string
    sql: ${TABLE}.Campaign_ID ;;
  }

  dimension_group: campaign_start {
    type: time
    datatype: yyyymmdd
    timeframes: [date, week, month, year]
    sql: ${TABLE}.Campaign_Start_Date ;;
  }
}
