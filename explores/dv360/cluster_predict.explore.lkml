include: "/views/dv360/cluster_model.view"


explore: cluster_predict {
  view_name: cluster_predict
  
  label: "(6) Cluster Predict"
  join: clustering_dataset {
    relationship: one_to_one
    sql_on: ${cluster_predict.row_num} = ${clustering_dataset.row_num} ;;
  }
}
