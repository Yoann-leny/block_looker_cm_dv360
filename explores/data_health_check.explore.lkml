include: "/views/**/*"

explore: data_health_check{
  view_name: redaction_combined
  hidden: yes
  label: "(5) Data Health Check"
  always_filter: {
    filters: [redaction_combined.partition: "last 7 days"]
  }

}
