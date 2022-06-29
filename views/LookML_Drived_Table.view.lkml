view: lookml_drived_table {
  derived_table: {
    explore_source: card_dataset {
      column: dt_date {}
      column: station_nm {}
      column: subway_line_nm {}
    }
  }
  dimension: dt_date {
    description: ""
    type: date
  }
  dimension: station_nm {
    label: "Card Dataset 역명"
    description: ""
  }
  dimension: subway_line_nm {
    label: "Card Dataset 호선 명"
    description: ""
  }
}
