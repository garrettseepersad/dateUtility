source("jd2mjd.R")
source("mjd2jd.R")
source("jd2yr2.R")
source("yr2jd.R")
source("jd2doy.R")
source("doy2jd.R")
source("jd2dow.R")
source("gps2jd.R")
source("jd2cal.R")
source("jd2gps.R")

convertAllSystems <- function(jd){
 
  #Calculate date parameters
  calculatedGPSweek       = jd2gps(jd)[1]   #1
  calculatedDOW           = jd2dow(jd)      #2
  calculatedYear          = jd2doy(jd)[1]   #3
  calculatedDOY           = jd2doy(jd)[2]   #4
  calculatedMJD           = jd2mjd(jd)      #5
  calculatedDecimalYear   = jd2yr2(jd)      #6
  calculatedYYYYMMDD      = jd2cal(jd)      #7
  
  outputAllSystems <- list(calculatedGPSweek,calculatedDOW,calculatedYear,calculatedDOY,calculatedMJD,calculatedDecimalYear,calculatedYYYYMMDD)
  return(outputAllSystems)
  
}