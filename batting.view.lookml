- view: batting
  sql_table_name: public.batting
  fields:

  - dimension: ab
    type: number
    sql: ${TABLE}.ab

  - dimension: bb
    type: number
    sql: ${TABLE}.bb

  - dimension: cs
    type: number
    sql: ${TABLE}.cs

  - dimension: double
    type: number
    sql: ${TABLE}.double

  - dimension: g
    type: number
    sql: ${TABLE}.g

  - dimension: g_idp
    type: number
    value_format_name: id
    sql: ${TABLE}.g_idp

  - dimension: h
    type: number
    sql: ${TABLE}.h

  - dimension: hbp
    type: number
    sql: ${TABLE}.hbp

  - dimension: hr
    type: number
    sql: ${TABLE}.hr

  - dimension: ibb
    type: number
    sql: ${TABLE}.ibb

  - dimension: league_id
    type: string
    sql: ${TABLE}.league_id

  - dimension: player_id
    type: string
    # hidden: yes
    sql: ${TABLE}.player_id

  - dimension: r
    type: number
    sql: ${TABLE}.r

  - dimension: rbi
    type: number
    sql: ${TABLE}.rbi

  - dimension: sb
    type: number
    sql: ${TABLE}.sb

  - dimension: sf
    type: number
    sql: ${TABLE}.sf

  - dimension: sh
    type: number
    sql: ${TABLE}.sh

  - dimension: so
    type: number
    sql: ${TABLE}.so

  - dimension: stint
    type: number
    sql: ${TABLE}.stint

  - dimension: team_id
    type: string
    # hidden: yes
    sql: ${TABLE}.team_id

  - dimension: triple
    type: number
    sql: ${TABLE}.triple

  - dimension: year
    type: number
    sql: ${TABLE}.year
    
  - measure: sum_at_bats
    type: sum
    hidden: yes
    sql: ${ab}

  - measure: sum_hits
    type: sum
    hidden: yes
    sql: ${h}

  - measure: count
    type: count
    drill_fields: [player.player_id, team.name, team.team_id]
    
  - measure: batting_average
    type: number
    sql: ${sum_hits} / nullif(${sum_at_bats}, 0)
    value_format_name: decimal_3
    
  - measure: measure_using_case
    sql_case: 
      "1.00": ${batting_average} > 0.000 AND ${batting_average} <= 0.100
      "2.00": ${batting_average} > 0.100 AND ${batting_average} <= 0.200
      "3.00": ${batting_average} > 0.200 AND ${batting_average} <= 0.300
      "4.00": ${batting_average} > 0.300 AND ${batting_average} <= 0.400
      else: "N/A"
      

