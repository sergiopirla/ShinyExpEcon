
library(shiny)

ui <- fluidPage(uiOutput('ui'))

server <- shinyServer(function(input, output, session){
  
  #Create UI's
  
  A<-fluidPage(
    
    #Reduce margins between widgets
    
    tags$head(
      tags$style(
        HTML(
          "
          .form-group {
            margin-bottom: 0 !important;
          }
        "
        ))),
    
    titlePanel("Block A"), 
               hr(),
               h3("Task 1:"),
               p("Next, you have to make 10 choices among pairs of lotteries. The set of lotteries are presented below. Each row is composed of an option A and an option B. You have to select 1 lottery per row. "),
               p(" "),
               hr(),
               p(" "),
               radioButtons(inputId = "HL1", choices = c("1/10 of 2$, 9/10 of 1.6$"=0,"1/10 of 3.85$, 9/10 of 0.1$"=1), label = "Option A --------------------------------------------------- Option B", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL2", choices = c("2/10 of 2$, 8/10 of 1.6$"=0,"2/10 of 3.85$, 8/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL3", choices = c("3/10 of 2$, 7/10 of 1.6$"=0,"3/10 of 3.85$, 7/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL4", choices = c("4/10 of 2$, 6/10 of 1.6$"=0,"4/10 of 3.85$, 6/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL5", choices = c("5/10 of 2$, 5/10 of 1.6$"=0,"5/10 of 3.85$, 5/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL6", choices = c("6/10 of 2$, 4/10 of 1.6$"=0,"6/10 of 3.85$, 4/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL7", choices = c("7/10 of 2$, 3/10 of 1.6$"=0,"7/10 of 3.85$, 3/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL8", choices = c("8/10 of 2$, 2/10 of 1.6$"=0,"8/10 of 3.85$, 2/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL9", choices = c("9/10 of 2$, 1/10 of 1.6$"=0,"9/10 of 3.85$, 1/10 of 0.1$"=1), label = "", inline = T ,selected = character(0)),
               radioButtons(inputId = "HL10", choices = c("10/10 of 2$, 0/10 of 1.6$"=0,"10/10 of 3.85$, 0/10 of 0.1$"=1), label = "", inline = T,selected = character(0))
    
  )
  
  #Render Ui
  
  output$ui <- renderUI(A)
  
})


shinyApp(ui = ui, server = server)
