include: "/views/**/*.view"

#view: activity_dj {
 # extension: required
#  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_activity_@{DJ_CAMPAIGN_MANAGER_ID}` ;;
# `@{CRG_PROJECT_NAME}.@{CRG_DATASET_NAME}.p_activity_@{CRG_CAMPAIGN_MANAGER_ID}`
#}

view: dj_activity {

  #sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_activity_@{DJ_CAMPAIGN_MANAGER_ID}` ;;
  sql_table_name:`@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_activity_@{DJ_CAMPAIGN_MANAGER_ID}` ;;
  # {% if brand_name._parameter_value == 'DJ' %}
  #     `@{DJ_PROJECT_NAME}.@{DJ_DATASET_NAME}.p_activity_@{DJ_CAMPAIGN_MANAGER_ID}`
  #   {% elsif brand_name._parameter_value == 'CR' %}
  #     `@{CRG_PROJECT_NAME}.@{CRG_DATASET_NAME}.p_activity_@{CRG_CAMPAIGN_MANAGER_ID}`
  #   {% else %}
  #     no
  #   {% endif %} ;;
  extends: [date_comparison,activity_dv360,structure_activity]

  # parameter: brand_name {
  #   type: unquoted
  #   allowed_value: {
  #     label: "David Jones"
  #     value: "DJ"
  #   }
  #   allowed_value: {
  #     label: "Country Road"
  #     value: "CR"
  #   }
  # }



}
