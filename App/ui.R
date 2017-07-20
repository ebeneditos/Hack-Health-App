library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  sidebarMenu(
             selectInput("Pa", 
                label = "Patient:",
                choices = list("Patient 1" = "P1",
                               "Patient 2" = "P2", "Patient 3" = "P3",
                               "Patient 4" = "P4", "Patient 5" = "P5",
                               "Patient 6" = "P6", "Patient 7" = "P7",
                               "Patient 8" = "P8", "Patient 9" = "P9",
                               "Patient 10" = "P10", "Patient 11" = "P11",
                               "Patient 12" = "P12", "Patient 13" = "P13",
                               "Patient 14" = "P14", "Patient 15" = "P15",
                               "Patient 16" = "P16", "Patient 17" = "P17",
                               "Patient 18" = "P18", "Patient 19" = "P19",
                               "Patient 20" = "P20", "Patient 21" = "P21",
                               "Patient 22" = "P22", "Patient 23" = "P23",
                               "Patient 24" = "P24", "Patient 25" = "P25",
                               "Patient 26" = "P26", "Patient 27" = "P27",
                               "Patient 28" = "P28", "Patient 29" = "P29",
                               "Patient 30" = "P30"),
                selected = "P1"),
             dateInput("date", 
               label = "Date:",
               value = "2016-01-30")
  )
)

body <- dashboardBody(
  h2("Prediction:"),
  textOutput("pred"),
  h2("Emotion and activity"),
  plotOutput("PlotDat", width = "100%",height = 400),
  h2("Meal and activity"),
  plotOutput("PlotDat2", width = "100%",height = 400)
)

# Put them together into a dashboardPage
dashboardPage(
  dashboardHeader(title = "Hack&Health App"),
  sidebar,
  body
)

#     
#     
#     # Show a plot of the generated distribution
#     mainPanel( 
#       tabsetPanel(
#         tabPanel('Emotion and activity',
#                  plotOutput("PlotDat", width = "100%",height = 450)),
#         tabPanel('Meal and activity',
#                  plotOutput("PlotDat2", width = "100%",height = 450)),
#         tabPanel('Prediction',
#                  textOutput("pred"))
#       )
#     )
#   ))
# )