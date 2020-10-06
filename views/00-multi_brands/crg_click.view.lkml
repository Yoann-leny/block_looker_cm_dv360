include: "/views/**/*.view"

view: crg_click {
  sql_table_name: `@{CRG_PROJECT_NAME}.@{CRG_DATASET_NAME}.p_click_@{CRG_CAMPAIGN_MANAGER_ID}`;;
  extends: [date_comparison,click_dv360,structure_click]


}
