closeAllConnections()
rm(list=ls())

# library(Geodesy)


# 
# setwd("C:/Users/Garrett/Desktop/Shiny/Date_Utility")
# source("jd2mjd.R")
# source("mjd2jd.R")
# source("jd2yr2.R")
# source("yr2jd.R")
# source("jd2doy.R")
# source("doy2jd.R")
# source("jd2dow.R")
# source("gps2jd.R")
# source("jd2cal.R")
# source("cal2jd.R")
# source("getJulienDate.R")
# 
# library(stringr)
# # str_locate_all(pattern ='2',"the2quickbrownfoxeswere2tired")
# # attr(,"match.length")
# 
# 
# # library(shiny)   
# # jd   = 1;
# # mjd=56657;
# # # mjd  = jd2mjd(jd); #.
# # jd   = mjd2jd(mjd); 
# # # year = jd2yr2(jd);
# # # jd   = yr2jd(year);
# # # print(mjd);
# # # print(jd);
# # # print(year)
# # data=jd2cal(jd)
# # jd2gps(jd)
# # 
# # shiny::runApp()
# 
# timeSystem=1
# outputString= paste("1853 5") 
# timeSystem=2
# outputString= paste("2015 198") 
# timeSystem=3
# outputString= paste("57220") 
# # timeSystem=4
# # outputString= paste("2015.54") 
# # timeSystem=5
# # outputString= paste("2015/07/17") 
# 
# 
# 
# jd=getJulienDate(timeSystem,outputString)
# 
# x=(strsplit(outputString, split = " "))
#  
# 
