fixVal <- function(roundNumber){
  
  if (roundNumber>0) roundNumber <- floor(roundNumber)
  if (roundNumber<0) roundNumber <- ceiling(roundNumber)
  
  return(roundNumber)
}