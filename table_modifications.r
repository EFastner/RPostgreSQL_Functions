fun.create_table <- function(connection){
  #DESCRIPTION: Sends a CREATE TABLE script to PostGres Connection
  #Arguments: connection = a PostgreSQL connection created with fun.postgres_connect
  #Edit the sql_command variable as needed to create all needed columns
  
  require(RPostgreSQL)
  
  sql_command <- "CREATE TABLE game_results
(
  season CHAR (255),
  session VARCHAR (255),
  game_date date,
  game_id CHAR (255),
  game_period CHAR (255),
  home_team VARCHAR (255),
  away_team VARCHAR (255),
  home_score CHAR (255),
  away_score CHAR (255),
  home_points CHAR (255), 
  away_points CHAR (255),
  home_game_num CHAR (255),
  home_point_total CHAR (255),
  away_game_num CHAR (255),
  away_point_total CHAR (255)
);"
  
  dbGetQuery(connection, sql_command)  
}

fun.append_table <- function(connection, table, values){
  
  require(RPostgreSQL)
  
  dbWriteTable(conn = connection, 
               name = as.character(table), 
               value = values,
               append = TRUE,
               row.names = FALSE)
}