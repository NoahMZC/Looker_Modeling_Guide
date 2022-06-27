view: subway_dataset {
  sql_table_name: `DAO3_looker.subway_dataset`
    ;;

  dimension: clean_transported_cnt {
    type: number
    sql: ${TABLE}.clean_transported_cnt ;;
  }


  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    convert_tz: yes
    sql: ${TABLE}.dt ;;
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

  dimension: passenger_cnt {
    type: number
    sql: ${TABLE}.passenger_cnt ;;
  }

  dimension: passenger_type_cd {
    type: string
    sql: ${TABLE}.passenger_type_cd ;;
  }

  dimension: station_code_number {
    label: "역 번호"
    group_label: "지하철 정보"
    type: string
    sql: ${TABLE}.station_cd ;;
  }

  dimension: subway_line_code {
    label: "호선 명"
    group_label: "지하철 정보"
    type: string
    sql: ${TABLE}.subway_line_cd ;;
  }

  dimension: subway_company {
    label: "사"
    group_label: "지하철 정보"
    type: string
    sql: 1;;
    html:
          {% if subway_line_code <= "'4'" %}
          <p style="color: white; background-color: gray; font-size:100%; text-align:center">
          {{subway_line_code}}
           {% elsif subway_line_code <= "'8'" %}
          <p style="color: white; background-color: red; font-size:100%; text-align:center">
          {{subway_line_code}}
          {% else %}
          <p style="color: white; background-color: pink; font-size:100%; text-align:center">
          {{subway_line_code}}
          {% endif %} ;;
  }


  dimension: html_example {
    type: string
    sql: 1;;
    html:
      <ul>
        <font color="darkgreen" size="2pt" >
        <li> 메가존 클라우드</li>
        <p><img src="https://imgnew.megazone.com/2019/07/MZC_logo.png" height=100 width=100></p>
      </ul>;;
  }

  dimension: tm_range_cd {
    type: string
    sql: ${TABLE}.tm_range_cd ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
