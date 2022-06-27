view: time_type {
  sql_table_name: `DAO3_looker.time_type`
    ;;

  dimension: tm_range_cd {
    type: string
    sql: ${TABLE}.tm_range_cd ;;
  }

  dimension: tm_range_nm {
    type: string
    sql: ${TABLE}.tm_range_nm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
