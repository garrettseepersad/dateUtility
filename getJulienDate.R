
source("jd2mjd.R")
source("mjd2jd.R") 
source("yr2jd.R") 
source("doy2jd.R") 
source("gps2jd.R") 
source("cal2jd.R") 



getJulienDate <- function(timeSystem,outputString){
  
  
  if (timeSystem==1){
    x=strsplit(outputString, split = " ")
    gpsWeek   = (unlist(x)[1])
    DOW       = (unlist(x)[2])
    jd=gps2jd(as.numeric(gpsWeek),((as.numeric(DOW))*3600*24),0)
  }
  if (timeSystem==2){
    x=strsplit(outputString, split = " ")
    year   = (unlist(x)[1])
    DOY    = (unlist(x)[2])
    jd=doy2jd(as.numeric(year),as.numeric(DOY) )
  }
  
  if (timeSystem==3){
    mjd   = outputString
    jd     =  mjd2jd(as.numeric(mjd))
  }
  if (timeSystem==4){
    decimalYear   = outputString
    jd     =  yr2jd(as.numeric(decimalYear))
  }
  
  if (timeSystem==5){
    x=strsplit(outputString, split = "/")
    year   = (unlist(x)[1])
    month  = (unlist(x)[2])
    day    = (unlist(x)[3])
    jd     = cal2jd(as.numeric(year),as.numeric(month),as.numeric(day))
  }
  
  
  
  return(jd)
}