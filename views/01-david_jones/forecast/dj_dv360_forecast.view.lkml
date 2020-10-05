view: dj_dv360_forecast {

    sql_table_name: `@{DJ_PROJECT_NAME}.@{DJ_FORECAST_DATASET}.dv360_forecast`;;

      dimension: week_start_date {
        type: string
        sql: ${TABLE}.week_start_date ;;
      }


    dimension: budget_target_dim {
      hidden: yes
        type: number
        sql: ${TABLE}.budget_target ;;
      }

  measure: budget_target {
    type: sum
    sql:${budget_target_dim} ;;
  }

  dimension: impressions_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Impressions_Target ;;
  }

  measure: impressions_target {
    type: sum
    sql:${impressions_target_dim} ;;
  }

  dimension: clicks_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Clicks_Target ;;
  }

  measure: clicks_target {
    type: sum
    sql:${clicks_target_dim} ;;
  }

  dimension: transactions_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Transactions_Target ;;
  }

  measure: transactions_target {
    type: sum
    sql:${transactions_target_dim} ;;
  }

  dimension: revenue_target_dim {
    hidden: yes
    type: number
    sql: ${TABLE}.Revenue_Target ;;
  }

  measure: revenue_target {
    type: sum
    sql:${revenue_target_dim} ;;
  }
    }
