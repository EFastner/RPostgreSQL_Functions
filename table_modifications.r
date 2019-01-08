fun.create_table <- function(connection){
  #DESCRIPTION: Sends a CREATE TABLE script to PostGres Connection
  #Arguments: connection = a PostgreSQL connection created with fun.postgres_connect
  #Edit the sql_command variable as needed to create all needed columns
  
  require(RPostgreSQL)
  
  sql_command <- "CREATE TABLE lock_line
(
  team_game CHAR (2),
  lock_line CHAR (3),
  no_return CHAR (3)
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