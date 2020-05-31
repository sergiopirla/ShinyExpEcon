
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
    p("Next, you have to make 10 choices among pairs of lotteries.
    These choices represent an scenario with 2 urns filled with black and red balls. The first urn (Urn A) contains 50 red and 50 black balls. 
    The second urn (Urn B) contains an unknown distribution of red and black balls. To begin with, you have to choose the color on which you want to bet (either red or black). 
    Later, we will randomly selct one of your choices and randomly draw a ball from your preferred urn.
    If the ball drawn is of your selected color, you will be paid the corresponding amount."),
    p(" "),
    hr(),
    p(" "),
    radioButtons(inputId = "AM.Color", choices = c("Red"="A","Black"="B"), label = "Select Color", inline = T ,selected = character(0)),
    p(" "),
    hr(),
    p(" "),
    radioButtons(inputId = "AM.S1", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 1.72$ If Chosen Color, 0$ If Not"=1), label = "--- Urn A: 50 Red Balls, 50 Black Balls --- Urn B: ? Red Balls, ? Black Balls", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S2", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 1.88$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S3", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.04$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S4", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.20$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S5", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.36$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S6", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.52$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S7", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.68$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S8", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 2.84$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S9", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 3.00$ If Chosen Color, 0$ If Not"=1), label = "", inline = T ,selected = character(0)),
    radioButtons(inputId = "AM.S10", choices = c("Urn A: 2$ If Chosen Color, 0$ If Not"=0,"Urn B: 3.16$ If Chosen Color, 0$ If Not"=1), label = "", inline = T,selected = character(0)),
    p(""),
    hr()
  )
  
  #Render Ui
  
  output$ui <- renderUI(A)
  
})


shinyApp(ui = ui, server = server)
