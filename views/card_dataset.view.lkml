view: card_dataset {
  sql_table_name: `DAO3_looker.card_dataset`
    ;;

  dimension: clean_transported_cnt {
    type: number
    sql: ${TABLE}.clean_transported_cnt ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: foot_traffic_cnt {
    type: number
    sql: ${TABLE}.foot_traffic_cnt ;;
  }

  dimension: getoff_passenger_cnt {
    type: number
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }

  measure: passenger_cnt {
    label: "탑승인원수"
    type: sum
    sql: ${TABLE}.passenger_cnt ;;
  }

  dimension: station_nm {
    label: "역명"
    group_label: "지하철 정보"
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_nm {
    label: "호선 명"
    group_label: "지하철 정보"
    type: string
    drill_fields: [station_nm]
    sql: ${TABLE}.subway_line_nm ;;
    link: {
      label: "drill into {{value}} DashBoard"
      url: "https://megazonepartner.cloud.looker.com/dashboards/234?호선+명={{value}}"
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
