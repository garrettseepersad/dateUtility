# closeAllConnections()
# rm(list=ls())

library(shiny)

# setwd("C:/Users/Garrett/Desktop/Shiny/Date_Utility")
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
source("getJulienDate.R")
source("convertAllSystems.R")
source("formatStringBasedOnTimeSystem.R")

validateDate <- function(timeSystem,outputString) {
  
  
  if (outputString == "") {
    errorMessage="Please input date"
    return(errorMessage)
  }
  
  if (timeSystem==1){
    x=strsplit(outputString, split = " ")
    gpsWeek   = as.numeric(unlist(x)[1])
    DOW       = as.numeric(unlist(x)[2])
    
    if(is.na(DOW)){
      errorMessage="Invalid DOW required"
      return(errorMessage)
      
    }
    if(gpsWeek<=0){
      errorMessage="GPS week"
      return(errorMessage)
      
    }
    else {
      NULL
    } 
    
  }
  if (timeSystem==2){
    x=strsplit(outputString, split = " ")
    year   = as.numeric(unlist(x)[1])
    DOY    = as.numeric(unlist(x)[2]) 
    
    if(is.na(DOY)){
      errorMessage="Invalid DOY required"
      return(errorMessage)
      
    }
    else {
      NULL
    } 
    
  }
  
  if ((timeSystem==3)&&((outputString != ""))){
    mjd   = outputString
    jd     =  mjd2jd(as.numeric(mjd))
    
    
    if(is.na(mjd)){
      errorMessage="Invalid decimal year format N/A"
      return(errorMessage)
      
    }
    else {
      NULL
    } 
    
    
  }
  if ((timeSystem==4)&&((outputString != ""))){
    decimalYear   = (as.numeric(outputString))
    
    if((nchar(as.character(outputString))<4)){
      errorMessage="Invalid decimal year format"
      return(errorMessage)
    } 
    if(is.na(decimalYear)){
      errorMessage="Invalid decimal year format N/A"
      return(errorMessage)
      
    }
    if (decimalYear < 0){
      errorMessage="Invalid year"
      return(errorMessage)
    }
    else {
      NULL
    } 
  }
  
  if ((timeSystem==5)&&((outputString != ""))){
    x=strsplit(outputString, split = "/")
    year   = as.numeric(unlist(x)[1])
    month  = as.numeric(unlist(x)[2])
    day    = as.numeric(unlist(x)[3]) 
    
    #         print(as.character(outputString))
    #         print(nchar(as.character(outputString)))
    #         print(day)
    
    
    if((nchar(as.character(outputString))<8)){
      errorMessage="Invalid date format"
      return(errorMessage)
      
    } 
    if(is.na(day)){
      errorMessage="Invalid date format"
      return(errorMessage)
      
    }
    
    if (((day) < 1)||(month == 2 && day > 29)||(month == 3 && day > 30)||(month == 5 && day > 30)||(month == 9 && day > 30)||(month == 11 && day > 30) ){
      
      errorMessage="Invalid day of the month"
      return(errorMessage)
    } 
    if((month<1)||(month>12)){
      errorMessage="Invalid month"
      return(errorMessage)
    }
    
    if((year<1800)){
      errorMessage="Invalid year"
      return(errorMessage)
      
    }
    else {
      NULL
    } 
    
  }
  
}




shinyServer(function(input, output, clientData, session) {
  
  # Load system time as default data
  yearSystemTime  = format(Sys.Date(), format="%Y")
  monthSystemTime = format(Sys.Date(), format="%m")
  daySystemTime   = format(Sys.Date(), format="%d")
  # Convert to julien date
  jd   = cal2jd(as.numeric(yearSystemTime),as.numeric(monthSystemTime),as.numeric(daySystemTime));
  # Convert julien date to all other systems
  allSystemTimes = convertAllSystems(jd)
  
  #Observes changes to timeSystem and updates input box value
  observe({ 
    
    timeSystem<-input$timeSystem
    
    
    outputString=formatStringBasedOnTimeSystem(timeSystem,allSystemTimes)
    
    # Change values for input$inSelect
    updateSelectInput(session, "intputTextBased",
                      selected = paste0(outputString)
    )
    
  }) #observe end
  
  # Reactive function ???
  dataFormReactiveFunction<-reactive({
    
    #input date
    outputString=toString(input$intputTextBased)
    timeSystem<-input$timeSystem
    
    #validation of input data
    validate(
      validateDate(timeSystem,input$intputTextBased)
    )
    
    
    
    jd=getJulienDate(timeSystem,outputString)
    allSystemTimes = convertAllSystems(jd)
    
    #Calculate date parameters
    calculatedGPSweek       = as.numeric(allSystemTimes[[1]])
    calculatedDOW           = as.numeric(allSystemTimes[[2]])
    calculatedYear          = as.numeric(allSystemTimes[[3]])
    calculatedDOY           = as.numeric(allSystemTimes[[4]])
    calculatedMJD           = as.numeric(allSystemTimes[[5]])
    calculatedDecimalYear   = as.numeric(allSystemTimes[[6]])
    calculatedYYYYMMDD      = as.numeric(allSystemTimes[[7]])
    
    # Create data frame
    labelGPSweekDOW = paste(calculatedGPSweek, " ", calculatedDOW)
    labelYearDOY    = paste(calculatedYear, " ", calculatedDOY)
    labelMJD        = paste(calculatedMJD)
    labelDecimalYear= paste(round(calculatedDecimalYear*10000)/10000)
    labelYYYYMMDD   = paste(calculatedYYYYMMDD[1], "/", calculatedYYYYMMDD[2], "/", calculatedYYYYMMDD[3])
    dataFrameString = c("GPS week, day of week", "Year, Day of Year", "Modified Julian Day","Decimal Year","YYYY-MM-DD")
    dataFrameNumbers= c(labelGPSweekDOW, labelYearDOY, labelMJD, labelDecimalYear, labelYYYYMMDD)
    
    dataFrameTime   = data.frame(dataFrameString, dataFrameNumbers)       
    colnames(dataFrameTime) <- c("Time System", "Output")
    
    # Output data frame 
    return(dataFrameTime)
    
  })
  
  output$table <- renderDataTable(dataFormReactiveFunction(),options = list(pageLength = 5,paging = FALSE,searching = FALSE,info=0))  
  # https://datatables.net/upgrade/1.10-convert
})