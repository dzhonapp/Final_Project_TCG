library(shiny)
shinyUI(fluidPage(
    titlePanel("Birth Dataset"),
    sidebarLayout(
        sidebarPanel(
            radioButtons("p", "Select column of iris dataset:",
                         list("Year"='a', "Month"='b', "Day of Week"='c', "Day of Month"='d')),
            
            
                sliderInput("bins",
                            "Data:",
                            min = 1,
                            max = 31,
                            value = 20)
           
           
        ),
        mainPanel(
            plotOutput("distPlot")
        )
    )
))
