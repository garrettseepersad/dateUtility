
formatStringBasedOnTimeSystem <- function(timeSystem,allSystemTimes){
  
  
  if(timeSystem==1){
    outputString= (paste0(as.numeric(allSystemTimes[[1]])," ",as.numeric(allSystemTimes[[2]])))}
  
  if(timeSystem==2) {
    outputString= (paste0(as.numeric(allSystemTimes[[3]])," ",as.numeric(allSystemTimes[[4]])))}
  
  if(timeSystem==3) {
    outputString= paste( allSystemTimes[5])
  }
  if(timeSystem==4) {
    outputString= paste( allSystemTimes[6])
  }
  if(timeSystem==5) {
    outputString= paste(format( Sys.Date(), format="%Y/%m/%d"))
  }
  
  return(outputString)
}