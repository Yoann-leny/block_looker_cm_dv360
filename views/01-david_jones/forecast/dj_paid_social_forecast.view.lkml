view: dj_paid_social_forecast {

    sql_table_name: select *
      from `@{DJ_PROJECT_NAME}.@{DJ_FORECAST_DATASET}.paid_social_forecast` ;;

    dimension: week_start_date {
      type: date_day_of_week
      sql: ${TABLE}.week_start_date ;;
    }

    dimension: budget_target {
      type: number
      sql: ${TABLE}.budget_target ;;
    }

    dimension: impressions_target {
      type: number
      sql: ${TABLE}.Impressions_Target ;;
    }

    dimension: clicks_target {
      type: number
      sql: ${TABLE}.Clicks_Target ;;
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
