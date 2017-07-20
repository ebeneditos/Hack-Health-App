library(shiny)
library(plyr)
library(reshape2)
library(ggplot2)
library(caret)
library(pls)

load('HackHealth.RData')

shinyServer(function(input, output) {

  s <- reactive ({
    s <- subset(data,data$PATIENT == as.character(input$Pa))
    s
  })
  
   output$PlotDat <- renderPlot({
     mytable <- table(Activity = s()$ACTIVITY[which(s()$EMOTION!=0)],Emotion = s()$EMOTION[which(s()$EMOTION!=0)]) # A will be rows, B will be columns 
     mosaicplot(~ Activity + Emotion, data = mytable,color = c("blue4","dodgerblue4","dodgerblue3","dodgerblue2","dodgerblue1","deepskyblue"),las = 1,main = "")   
  })

   output$PlotDat2 <- renderPlot({
     mytable2 <- table(Meal = s()$MEAL[which(s()$EMOTION!=0)],Emotion = s()$EMOTION[which(s()$EMOTION!=0)]) # A will be rows, B will be columns 
     mosaicplot(~ Meal + Emotion, data = mytable2,color = c("aquamarine4","seagreen4","seagreen3","aquamarine3","aquamarine2","aquamarine"),las = 1,main = "")   
   })
   
   datinput <- reactive({
     p <- input$Pa
     d <- input$date
     df <- data.frame(seq(1,258,3),seq.Date(as.Date("2015-11-06"),as.Date("2016-01-30"),"days"))
     dia <- df[which(d==df[,2]),1]
     datinput <- subset(dat,dat$PATIENT == p & dat$DAYnum == dia)
     datinput
   })
  
   output$pred <- renderText({
     pred <- predict(model,datinput())
     output <- round(pred*100,1)
     if (length(output) > 0){
       paste('Today this patient will have an episode with a probability of:',as.character(output),'%.')
     }
     else{
       paste('There is no data for this date.')
     }
   })
})
