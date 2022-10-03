library(shiny)
library(tidyverse)

#####Import Data

#type in your data path
dat<-read_csv("/yourPath...")
dat<- dat %>% select(c("pid7","ideo5"))

#remove missing values 
dat<-drop_na(dat)

ui <- 
  
  server<-function(input,output){
    
  }

shinyApp(ui,server)