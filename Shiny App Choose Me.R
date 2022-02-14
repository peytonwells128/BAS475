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



