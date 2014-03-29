library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
# Application title
titlePanel("Galaxies in Shapley Supercluster"),
  
# Sidebar with a slider input for the number of bins
sidebarLayout(
  sidebarPanel(    
    sliderInput("velrange",
                "Velocity (distance) Range:",
                min = 0,
                max = 40000,
                value = c(10000,20000)                
    )
  ),
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("galaxyPlot")
    )
  )
))