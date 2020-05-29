library(shiny)

ui <- fluidPage(uiOutput('ui'))

server <- function(input, output, session) {
  
  
  #Reactive Values:
  
  rv<-reactiveValues(Sub=0)
  observeEvent(input$Submit, {rv$Sub <-rv$Sub+1})

  #UI's
  
  A<-fluidPage(titlePanel("Block A"), actionButton(inputId = "Submit", "Next"))
  B<-fluidPage(titlePanel("Block B"), actionButton(inputId = "Submit", "Next"))
  C<-fluidPage(titlePanel("Block C"), actionButton(inputId = "Submit", "Next"))
  
  #Randomized order: 
  
  Blocks<-list(A,B,C)
  Blocks<-sample(Blocks)
  
  #Render Ui's
  
  output$ui <- renderUI({
    if(rv$Sub==0){Blocks[[1]]}
    else if(rv$Sub==1){Blocks[[2]]}  
    else if(rv$Sub>1){Blocks[[3]]}
    })
  
}

shinyApp(ui, server)

