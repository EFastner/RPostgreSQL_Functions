sql.player_query <- function(connection, players, seasons, table = "skater_stats"){
  
  player_list <- paste0("('", paste(players, collapse = "', '"), "')")
  season_list <- paste0("('", paste(seasons, collapse = "', '"), "')")
  
  sql_query <- paste0("SELECT * FROM ", table, " WHERE player IN ", player_list, " AND season IN ", season_list)
  
  query_results <- dbGetQuery(db.con, sql_query)
  
  return(query_results)
}

sql.team_results <- function(connection, teams, seasons, table = "team_results"){
  
  team_list <- paste0("('", paste(teams, collapse = "', '"), "')")
  season_list <- paste0("('", paste(seasons, collapse = "', '"), "')")
  
  sql_query <- paste0("SELECT * FROM ", table, " WHERE team IN ", team_list, " AND season IN ", season_list)
  
  query_results <- dbGetQuery(db.con, sql_query)
  
  return(query_results)
}

sql.team_lock_performance <- function(connection, team, season){
  sql_query <- paste0("SELECT team,
                      opp,
                      game_date,
                      side, 
                      team_score, 
                      opp_score, 
                      team_point_total, 
                      lock_line, 
                      no_return 
                      FROM team_results 
                      LEFT JOIN lock_line 
                      ON team_results.team_game=lock_line.team_game 
                      WHERE team='", team, "' AND season='", season, "' ORDER BY game_date;")
  
  query_results <- dbGetQuery(db.con, sql_query)
  
  return(query_results)
}