- connection: history_of_baseball

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: batting
  joins:
    - join: player
      type: left_outer
      sql_on: ${batting.player_id} = ${player.player_id}
      relationship: many_to_one

- explore: player