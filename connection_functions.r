fun.postgres_connect <- function(db.name, db.host, db.user){
  require(RPostgreSQL)
  
  #Set the connection drive for PostgreSQL
  db.drv <- dbDriver("PostgreSQL")
  
  #Prompt for Password
  db.pw <- readline(prompt = "Enter your Password: ")
  
  #Create Connection
  db.con <- 
    dbConnect(db.drv, 
              dbname = db.name, 
              host = db.host, 
              port = 5432, 
              user = db.user, 
              password = db.pw)
  
  #Clear the pasword entered above
  rm(db.pw)
  
  return(db.con)
}