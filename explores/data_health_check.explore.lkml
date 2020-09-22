include: "/views/**/*"

explore: data_health_check{
  view_name: redaction_combined
  hidden: yes
  group_label: "01-david_jones"
  label: "01.014 CM+DV360 Data Health Check"
  always_filter: {
    filters: [redaction_combined.partition: "last 7 days"]
  }

}
