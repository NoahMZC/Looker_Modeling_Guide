connection: "dao3_looker_connection"
label: "modeling guide용 모델입니다."
# include all the views
include: "/views/*.view"

# explore: subway_dataset {
#   label: "지하철 승하차 정보 탐색"
#   join: station_type {
#     type: left_outer
#     foreign_key: station_code_number
#     relationship: many_to_one
#   }
#   aggregate_table: rollup_table {
#     query: {
#       dimensions: [station_code_number, subway_line_code]
#       measures: [passenger_number]
#       timezone: "Asia/Seoul"
#     }
#     materialization: {
#       datagroup_trigger: 1_hour_trigger
#     }
#   }
# }

explore: lookml_drived_table{}


# explore: +subway_dataset {
#   aggregate_table: rollup__station_code_number__subway_line_code {
#     query: {
#       dimensions: [station_code_number, subway_line_code]
#       measures: [passenger_number]
#       timezone: "Asia/Seoul"
#     }

#     materialization: {
#       datagroup_trigger: looker_modeling_project_noah_default_datagroup
#     }
#   }
# }


explore: time_type {}

explore: calendar {}

explore: card_dataset {
  group_label: "코드 데이터"
}

explore: passenger_type {
  group_label: "코드 데이터"
}

explore: station_type {
  group_label: "코드 데이터"
}


datagroup: 1_hour_trigger {
  interval_trigger: "1 hour"
  max_cache_age: "1 hour"
}

datagroup: once_a_day {
  interval_trigger: "24 hour"
  max_cache_age: "1 hour"
}


# persist_with: looker_modeling_project_noah_default_datagroup
