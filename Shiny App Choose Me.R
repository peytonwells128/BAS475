library(shiny)
ui <- fluidPage(
  prettyCheckboxGroup(
    inputId = "I1",
    label = "Choose:", 
    choices = c("Click me !", "Me !", "Or me !")
  ),
 textOutput("Text1") 
 
)

server <- function(input, output) {
  output$Text1 <- renderPrint(if (length(input$I1) == 0){
    paste("Nothing has been selected")
    } else if (input$I1 == "Click me !"){
    paste("First Choice")
    } else if (input$I1 == "Me !"){
    paste("Second Choice")
    } else if (input$I1 == "Or me !"){
    paste("Third Choice")
    })
}

shinyApp(ui = ui, server = server)

library(shiny)
library(fpp3)
data("tourism")

Data <- subset(tourism, Region == "Adelaide")

ui <- fluidPage(
  selectInput(
    inputId = "Purpose",
    label = "Select Purpose(s)",
    choices = unique(tourism$Purpose),
    multiple = TRUE
  ),
  plotOutput("plotted_series")
)

server <- function(input, output) {
  output$plotted_series <- renderPlot(input$Purpose)
  
}

shinyApp(ui, server)




