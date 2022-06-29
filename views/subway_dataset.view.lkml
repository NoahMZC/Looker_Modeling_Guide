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
    label: "{%if _user_attributes['vaild_user'] == '3' %}
              호선 정보
            {% else %} 지하철 호선 정보. 접근 제어된 상태입니다.
            {% endif %}"
    group_label: "지하철 정보"
    type: string
    drill_fields: [station_code_number]
    sql: {%if _user_attributes['vaild_user'] == '3' %}
              ${TABLE}.subway_line_cd
          {% else %} '[접근불가]'
          {% endif %} ;;
  }






  filter: filter_on_subway_line_code {
    label: "지하철 호선 선택"
    type: string
    sql: {% condition filter_on_subway_line_code %} ${subway_line_code} {% endcondition %} ;;
  }

  measure: getoff_passenger_cnt {
    label: "하차 인원수"
    group_label: "승객 정보"
    type: sum
    sql: ${TABLE}.getoff_passenger_cnt ;;
  }


  measure: passenger_number {
    label: "승차 인원수"
    group_label: "승객 정보"
    type: sum
    sql: ${TABLE}.passenger_cnt ;;
  }

  parameter: transport_info{
    label: "탑승 정보"
    type:unquoted
    allowed_value: {
      label: "승차"
      value: "passenger_cnt"
    }
    allowed_value: {
      label: "하차"
      value: "getoff_passenger_cnt"
    }
  }

  measure: combine {
    type: sum
    sql: ${TABLE}.{% parameter transport_info %} ;;
    value_format_name: "decimal_0"
  }

  measure: combine1 {
    type: sum
    sql: ${TABLE}.{% parameter transport_info %} ;;
    value_format_name: "decimal_0"
  }

  dimension: company {
    label: "회사"
    type: string
    sql: 1 ;;
    html:
          <!-- 1,2,3,4호선일 경우 서울 매트로 이미지 출력-->
          {% if subway_dataset.subway_line_code._value <= '4' %}
            <p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Seoul_Metro_Logo.svg/1280px-Seoul_Metro_Logo.svg.png"
                         height=30 width=30></p>

          <!-- 5,6,7,8호선일 경우 서울 도시철도 이미지 출력-->
          {% elsif subway_dataset.subway_line_code._value <= '8' %}
            <p><img src="http://kmug.co.kr/data/file/design/data_logo_1276568275_1.jpg"
                         height=30 width=30></p>

          <!-- 그 외의 경우 '[데이터 없음]' 출력-->
          {% else %}
            [데이터 없음]

          {% endif %} ;;
  }


  # dimension: subway_company {
  #   label: "사"
  #   group_label: "지하철 정보"
  #   type: string
  #   sql: 1;;
  #   html:
  #         {% if subway_dataset.subway_line_code._value <= '4' %}
  #           <p><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Seoul_Metro_Logo.svg/
  #                       1280px-Seoul_Metro_Logo.svg.png" height=100 width=100></p>
  #         {% elsif subway_dataset.subway_line_code._value <= '8' %}
  #           <p><img src="http://kmug.co.kr/data/file/design/data_logo_1276568275_1.jpg"
  #                       height=100 width=100></p>
  #         {% else %}
  #         [데이터 없음]
  #         {% endif %} ;;
  # }

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
