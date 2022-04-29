#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data <- swiss


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$plot <- renderPlot({
        my.formula = y ~ x
        p <- ggplot(data, aes_string(x=input$x, y=input$y)) + geom_point()+theme_bw()+
            theme(axis.text=element_text(size=12),
                  axis.title=element_text(size=14,face="bold"))
        if (!(input$method %in% c("rq"))){
            p <- p + stat_poly_line(method = input$method)+stat_poly_eq(method = input$method, formula = my.formula, aes(label = paste(..eq.label.., ..AIC.label.., sep = "~~~")), parse = TRUE)
        } else {
            p <- p + stat_quant_line(method = input$method, se=TRUE)+stat_quant_eq(method = input$method, formula = my.formula, aes(label = paste(..eq.label.., ..AIC.label.., ..quantile.., sep = "~~~")), parse = TRUE)
        }
            p

    }, width = 600)

})



