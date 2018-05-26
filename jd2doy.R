jd2doy <- function(jd){
# % JD2DOY  Converts Julian date to year and day of year.
# % . Non-vectorized version. See also CAL2JD, DOY2JD,
# %   GPS2JD, JD2CAL, JD2DOW, JD2GPS, JD2YR, YR2JD.
# % Version: 24 Apr 99
# % Usage:   [doy,yr]=jd2doy(jd)
# % Input:   jd  - Julian date
# % Output:  doy - day of year
# %          yr  - year
# 
# % Copyright (c) 2011, Michael R. Craymer
# % All rights reserved.
# % Email: mike@craymer.com

 
  
  if (jd < 0){
    print("jd2doy")
    return(list(-1,-1));
  }
  

ymd = jd2cal(jd);
doy = jd - cal2jd(as.numeric(ymd[1]),1,0);

outputYrDOY <- list(as.numeric(ymd[1]),doy)
return(outputYrDOY)

}