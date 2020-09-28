include: "/views/**/*.view"

view: dj_impression {
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_impression_@{DJ_CAMPAIGN_MANAGER_ID}` ;;
  extends: [date_comparison,impression_dv360,structure_impression]


  }
