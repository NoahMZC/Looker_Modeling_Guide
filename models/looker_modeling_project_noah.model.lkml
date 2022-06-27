connection: "dao3_looker_connection"

# include all the views
include: "/views/**/*.view"

datagroup: looker_modeling_project_noah_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_modeling_project_noah_default_datagroup

explore: time_type {}

explore: calendar {}

explore: subway_dataset {}

explore: card_dataset {}

explore: passenger_type {}

explore: station_type {}
