library(shiny)
library(spatstat)
data(shapley)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # create a plot of the locations of the galaxies
  # in the shapley supercluster
  # allow user to select a subset of galaxies to display
  output$galaxyPlot <- renderPlot({
    allx = shapley$x  # x positions of all of the galaxies
    ally = shapley$y  # y positions of all of the galaxies 
    
    # plot the map with all of the galaxies in gray
    plot(shapley$x,shapley$y,pch=16,col="gray")
    plot(shapley$window,add=T)
    # add the subset of galaxies from the slider input
    inds = shapley$marks$V >= input$velrange[1] & 
           shapley$marks$V <= input$velrange[2]
    points(shapley$x[inds],shapley$y[inds],pch="+")
    
    })
})