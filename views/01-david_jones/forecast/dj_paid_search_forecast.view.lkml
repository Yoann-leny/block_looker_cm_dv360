view: dj_paid_search_forecast {
  sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_FORECAST_DATASET}.paid_search_forecast` ;;

  dimension: week_start_date {
    type: date
    sql: ${TABLE}.week_start_date;;
  }

  dimension: budget_target {
    type: number
    sql: ${TABLE}.budget_target ;;
  }

  dimension: sessions_target {
    type: number
    sql: ${TABLE}.Sessions_Target ;;
  }

  dimension: transactions_target {
    type: number
    sql: ${TABLE}.Transactions_Target ;;
  }

  dimension: revenue_target {
    type: number
    sql: ${TABLE}.Revenue_Target ;;
  }

}
