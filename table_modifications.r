fun.create_table <- function(connection, table_name, column_names){
  #DESCRIPTION: Sends a CREATE TABLE script to PostGres Connection
  #Arguments: connection = a PostgreSQL connection created with fun.postgres_connect
  #           table_name = a string variable naming the table
  #           column_names = a string variable naming the columns and defining their types
  
  require(RPostgreSQL)
  
  sql_command <- paste("CREATE TABLE ", table_name, " (", column_names, ");")

  dbGetQuery(connection, sql_command)  
}

fun.get_row_names <- function(df, col_type = "VARCHAR"){
  #DESCRIPTION: Outputs a string character to create a list of column names in SQL Database based on the existing data table's column names
  #ARGUMENTS: df = a dataframe with desired column names in the first column and optionally data types in second
  #           col_type = denotes the type of column to create if not supplied in df
  #
  #WILL NOT FIX COLUMNS WITH INVALID SQL CHARACTERS. YOU WILL STILL NEED TO DO THAT YOURSELF
  
  if(ncol(df) == 1){
    cols <- paste(colnames(gmorning), collapse = paste0(" ", col_type, ", "))
    cols <- paste(cols, " ", col_type)
  }else{
   cols <- paste(df[,1], df[,2])
   cols <- paste(cols, collapse = ", ")
  }
  
  return(cols)
}

fun.append_table <- function(connection, table, values){
  
  require(RPostgreSQL)
  
  dbWriteTable(conn = connection, 
               name = as.character(table), 
               value = values,
               append = TRUE,
               row.names = FALSE)
}