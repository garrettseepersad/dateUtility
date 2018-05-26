library(shiny)   

shinyUI(fluidPage(
  
  # titlePanel(h1("Convert Date")),
  
  sidebarLayout(
    sidebarPanel(
      # helpText("Utility for converting dates..."),
      br(),
      selectInput("timeSystem", label = "Format:", 
                  choices = list("GPS week, day of week" = 1, 
                                 "Year, Day of Year"     = 2,
                                 "Modified Julian Day"   = 3,
                                 "Decimal Year"          = 4,
                                 "YYYY-MM-DD"            = 5), selected = 5),
      
      textInput("intputTextBased", "Date: ", value = NULL),
      br()
      #       helpText("Note: while the data view will show only the specified",
      #                "number of observations, the summary will still be based",
      #                "on the full dataset.")
    ),
    
    mainPanel(
      #       textOutput("text1"),
      # textOutput("text2"),
      #       textOutput("text3"),
      # h4("Equivalent Dates"),
      # tableOutput("view")
      
      dataTableOutput("table")   
      
      # helpText("Day of week - (Sun=1,...,Sat=7)")
      
    )
  )
)
)

