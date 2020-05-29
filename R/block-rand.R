#Ambiguity App

library(shiny)


ui <- fluidPage(uiOutput('ui'))


server <- shinyServer(function(input, output, session){
  

  #Reactive Values:
  
  rv<-reactiveValues(Sub=0,SubQ=0)
  observeEvent(input$Submit, {rv$Sub <-rv$Sub+1})
  observeEvent(input$SubmitQ, {rv$SubQ <-rv$SubQ+1})
  
  #Create UI's
  
  Q1<-fluidPage(titlePanel("Block A - Q1"),actionButton(inputId = "SubmitQ", "Next"))
  Q2<-fluidPage(titlePanel("Block A - Q2"), actionButton(inputId = "SubmitQ", "Next"))
  A<-fluidPage(titlePanel("Block A"), actionButton(inputId = "SubmitQ", "Next"))
  B<-fluidPage(titlePanel("Block B"), actionButton(inputId = "Submit", "Next"))
  C<-fluidPage(titlePanel("Block C"), actionButton(inputId = "Submit", "Next"))
  
  #Randomized order: 

  Blocks<-list(A,B,C)
  Blocks<-sample(Blocks)
  Page<-list(Q1,Q2)
  Page<-sample(Page)
  
  #Render Ui's

  output$ui <- renderUI({
    if(rv$SubQ==0){
      if(rv$Sub==0){Blocks[[1]]}
      else if(rv$Sub==1){Blocks[[2]]}  
      else if(rv$Sub==2){Blocks[[3]]}
    }
    else if(rv$SubQ>0){
      if(rv$SubQ==1){Page[[1]]}
      else if(rv$SubQ==2){Page[[2]]}  
      else if(rv$SubQ==3){
        if(rv$Sub+2==2){Blocks[[2]]}
        else if(rv$Sub+2==3){Blocks[[3]]}
      }
    }
    
  })
  
})


shinyApp(ui = ui, server = server)

