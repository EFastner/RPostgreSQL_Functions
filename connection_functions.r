fun.postgres_connect <- function(db.name, db.host, db.user){
  #DECRIPTION: Creates a connection to a PostgreSQL Server
  #ARGUMENTS: 
    #db.name = The name of the database to connect to
    #db.host = The host ("localhost" or IP Address)
    #db.user = The name of the user to connect with
  
  require(RPostgreSQL)
  require(getPass)
  
  #Set the connection drive for PostgreSQL
  db.drv <- dbDriver("PostgreSQL")
  
  #Prompt for Password
  db.pw <- getPass(msg = "Enter your Password: ", noblank = FALSE)
  
  #Create Connection
  db.con <- 
    dbConnect(db.drv, 
              dbname = as.character(db.name), 
              host = as.character(db.host), 
              port = 5432, 
              user = as.character(db.user), 
              password = db.pw)
  
  #Clear the pasword entered above
  rm(db.pw)
  
  return(db.con)
}