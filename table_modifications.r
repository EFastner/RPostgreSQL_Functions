fun.create_table <- function(connection){
  #DESCRIPTION: Sends a CREATE TABLE script to PostGres Connection
  #Arguments: connection = a PostgreSQL connection created with fun.postgres_connect
  #Edit the sql_command variable as needed to create all needed columns
  
  require(RPostgreSQL)
  
  sql_command <- "CREATE TABLE skater_stats
(
  player VARCHAR (255),
  team VARCHAR (3),
  season CHAR (8),
  game_id CHAR (10),
  TOI CHAR (255),
  G CHAR (255),
  A1 CHAR (255),
  A2 CHAR (255),
  A CHAR (255),
  P CHAR (255),
  P1 CHAR (255),
  FOW CHAR (255),
  FOT CHAR (255),
  FOL CHAR (255),
  SOG CHAR (255),
  iCF CHAR (255),
  HITS CHAR (255),
  BLK CHAR (255),
  PEND CHAR (255),
  PENT CHAR (255),
  CF CHAR (255),
  CA CHAR (255),
  CF_5v5 CHAR (255),
  CA_5v5 CHAR (255),
  GF_5v5 CHAR (255),
  GA_5v5 CHAR (255),
  FO_PER CHAR (255),
  GS CHAR (255)
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