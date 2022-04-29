#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(ggplot2)
library(ggpmisc)

data <- swiss

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Swiss data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput('x', 'X', names(data)),
            selectInput('y', 'Y', names(data)),
            selectInput('method', 'Method', c("lm", "rlm", "rq"))
            ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot"),
            align = "center")
    )
))
