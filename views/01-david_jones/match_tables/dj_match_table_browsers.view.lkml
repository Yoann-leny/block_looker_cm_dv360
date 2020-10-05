view: dj_match_table_browsers {
  sql_table_name: (select * from `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.match_table_browsers_@{DJ_CAMPAIGN_MANAGER_ID}` where _LATEST_DATE = _DATA_DATE) ;;

  dimension: browser_platform {
    type: string
    sql: ${TABLE}.Browser_Platform ;;
  }

  dimension: browser_platform_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.Browser_Platform_ID ;;
  }
}
