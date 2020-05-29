
library(shiny)

ui <- fluidPage(uiOutput('ui'))

server <- shinyServer(function(input, output, session){

  #Create UI's

  A<-fluidPage(titlePanel("Block A"), 
               hr(),
               h3("Task 1:"),
               p("Imagine that you are given $2. You must decide which part of this amount
                 (between 0 cents and 200 cents) you wish to bet in the following lottery. "),
               p(em("You have a chance of 1/2 (50%) to lose the amount you bet and a chance of 1/2
                 (50%) to win two and a half times the amount you bet.")),
               numericInput(inputId="GP", label="Amount Invested (in cents)", value=0,min=0, max=200, step=1),
               span(textOutput("Error.GP"), style="color:red"),
               )

  #Error message

  observeEvent(input$GP, if(!is.na(input$GP)){
    if(input$GP>200){
      output$Error.GP<-renderText("Error Notification: You cannot allocate less than 0 cents or more than 200 cents to this lottery.")}
    else{output$Error.GP<-renderText("")}})
  
  #Render Ui
  
  output$ui <- renderUI(A)
  
})


shinyApp(ui = ui, server = server)

