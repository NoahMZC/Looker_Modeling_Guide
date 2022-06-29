connection: "dao3_looker_connection"
label: "modeling guide용 모델입니다."
# include all the views
include: "/views/*.view"

access_grant: subway_dataset_access {
  user_attribute: vaild_user
  allowed_values: ["Accessible"]
}


explore: subway_dataset {
  label: "지하철 승하차 정보 탐색"
  join: station_type {
    type: left_outer
    foreign_key: station_code_number
    relationship: many_to_one
  }
}

explore: time_type {}

explore: calendar {}

explore: card_dataset {}

explore: passenger_type {}

explore: station_type {}


datagroup: looker_modeling_project_noah_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_modeling_project_noah_default_datagroup
