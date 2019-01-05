#Set the Season Starts and the directory with the files
start_year <- 2007
end_year <- 2008
dir <- "~/Data_Sets/Hockey/Enhanced PbP"

#Create POSTGRES Connection
db.connect <- fun.postgres_connect("nhl_pbp", "192.154.38.113", "eric")

#Loop through all seasons and load into SQL database
for (i in 1:11){
  #Create Filename to read in
  filename <- paste0(dir, "/pbp_", start_year, end_year, ".csv")
  
  #Read in pbp file
  df.pbp <- read_csv(filename, col_names = TRUE)
  
  #Summarize Player Stats
  df.player_stats <- fun.skater_summary(df.pbp)
  
  #Combine Home and Away Stats
  df.player_stats <- fun.combine_skater_stats(df.player_stats)
  
  #Change row names to lowercase so they will work in Postgres
  names(df.player_stats) <- tolower(names(df.player_stats))
  
  #Clear the pbp file from memory
  rm(df.pbp)
  
  #Append the game_results SQL table with summarized files
  append_result <- fun.append_table(db.connect, "skater_stats", df.player_stats)
  
  if(append_result == TRUE){
    print(paste0(start_year, end_year, " Success"))
  } else {
    print(paste0(start_year, end_year, " Failure"))
  }
  
  #Increment start_year and end_year
  start_year <- start_year + 1
  end_year <- end_year + 1
}