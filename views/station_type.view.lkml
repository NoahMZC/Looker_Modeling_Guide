view: station_type {
  sql_table_name: `DAO3_looker.station_type`
    ;;

  dimension: station_cd {
    type: string
    sql: ${TABLE}.station_cd ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_cd {
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }

  dimension: transfer_line_cnt {
    type: number
    sql: ${TABLE}.transfer_line_cnt ;;
  }

  dimension: transfer_station_gb {
    type: string
    sql: ${TABLE}.transfer_station_gb ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
