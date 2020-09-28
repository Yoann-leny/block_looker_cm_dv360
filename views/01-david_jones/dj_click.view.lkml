include: "/views/**/*.view"

view: dj_click {
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_click_@{DJ_CAMPAIGN_MANAGER_ID}`;;
  extends: [date_comparison,click_dv360,structure_click]


}
