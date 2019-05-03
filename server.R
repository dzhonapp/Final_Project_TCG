library(shiny)
birthInUSA <- read.csv("US_births_2000-2014_SSA.csv")
sumbyYear <- aggregate(dFrame['births'], by = dFrame['year'], sum)
sumbyWeekDay <- aggregate(dFrame['births'], by = dFrame['day_of_week'], sum)
sumbyMonth <- aggregate(dFrame['births'], by = dFrame['month'], sum)
sumbyDateofMonth <- aggregate(dFrame['births'], by = dFrame['date_of_month'], sum)

shinyServer(function(input, output) {
    output$distPlot <- renderPlot({
        if(input$p=='a'){
            x <- sumbyYear[, 2]
        }
        
        if(input$p=='b'){
            x <- sumbyMonth[, 2]
        }
        
        if(input$p=='c'){
            x <- sumbyWeekDay[, 2]
        }
        
        if(input$p=='d'){
            x <- sumbyDateofMonth[, 2]
        }
        
        
        
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
})