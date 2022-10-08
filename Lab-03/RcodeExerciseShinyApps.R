library(shiny)
library(tidyverse)

#####Import Data

#type in your data path
dat<-read_csv("DataExerciseShinyApps.csv")
dat<- dat %>% select(c("pid7","ideo5"))

#remove missing values 
dat<-drop_na(dat)


# UI component
ui <- fluidPage(
  
  # Application title
  titlePanel("Ideology"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Select Five Point Ideology (1=Very liberal, 5=Very conservative)",
                  min = 1,
                  max = 5,
                  value = 3),
      
                # hr(),
                # helpText("Data from 1000 respondents.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Server component
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # draw the histogram with the specified number of bins
    hist(x = dat$pid7,
         #breaks = input$bins,
         #ylim = c(0,100),
         xlab = '7 Point party ID, 1=very D, 7=very R',
         ylab = 'Count',
         main = 'Histogram over ideologies',
        )
    
    })
}


# Complete app with UI and server configs
shinyApp(ui, server)