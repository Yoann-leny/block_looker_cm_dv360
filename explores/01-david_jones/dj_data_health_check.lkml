include: "/views/**/*"

explore: dj_data_health_check{
  view_name: dj_redaction_combined
  hidden: yes
  group_label: "01-David Jones"
  label: "01.014 CM+DV360 Data Health Check"
  always_filter: {
    filters: [dj_redaction_combined.partition: "last 7 days"]
  }

}
