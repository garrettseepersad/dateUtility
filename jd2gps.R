source('cal2jd.R')

jd2gps <- function(jd){
  
# % JD2GPS  Converts Julian date to GPS week number (since
#                                                    %   1980.01.06) and seconds of week. Non-vectorized version.
# %   See also CAL2JD, DOY2JD, GPS2JD, JD2CAL, JD2DOW, JD2DOY,
# %   JD2YR, YR2JD.
# % Version: 05 May 2010
# % Usage:   [gpsweek,sow,rollover]=jd2gps(jd)
# % Input:   jd       - Julian date
# % Output:  gpsweek  - GPS week number
# %          sow      - seconds of week since 0 hr, Sun.
# %          rollover - number of GPS week rollovers (modulus 1024)
# 
# % Copyright (c) 2011, Michael R. Craymer
# % All rights reserved.
# % Email: mike@craymer.com
 

if (jd < 0){
  print("jd2gps")
  outputGPSDate<-list(-1,-1,-1)
  return(outputGPSDate)
}



jdgps = cal2jd(1980,1,6);    #% beginning of GPS week numbering
nweek = fixVal((jd-jdgps)/7);
sow = (jd - (jdgps+nweek*7)) * 3600*24;
rollover = fixVal(nweek/1024);  #% rollover every 1024 weeks
# %gpsweek = mod(nweek,1024);
gpsweek = nweek;

outputGPSDate<-list(gpsweek,sow,rollover)
return(outputGPSDate)


}