view: passenger_type {
  sql_table_name: `DAO3_looker.passenger_type`
    ;;

  dimension: passenger_type_cd {
    type: string
    sql: ${TABLE}.passenger_type_cd ;;
  }

  dimension: passenger_type_nm {
    type: string
    sql: ${TABLE}.passenger_type_nm ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
