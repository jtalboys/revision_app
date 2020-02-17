# APP TO TRIAL RENDERING MATHJAX FROM THE DATA FRAME
library(shiny)

ui <- fluidPage(
  withMathJax(),
  # Insert this tag to allow inline MathJax
  tags$div(HTML("<script type='text/x-mathjax-config' >
            MathJax.Hub.Config({
            tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}
            });
            </script >
            ")),
  h1("Clue:"),
  uiOutput('clue'),
  uiOutput('rev_sol'),
  br(),
  actionButton('next_clue', 'Next Clue!')
)

server <- function(input, output, session) {
  clues_sols <- reactive(Tseries)
  # Need a random ordering of the dataset
  order <- reactive(sample(seq_along(Tseries$Clue)))
  
  #current <- reactive(order[input$next])
  
  output$clue <- renderUI({
    withMathJax(
      purrr::map(clues_sols()[order()[input$next_clue], 1, drop = TRUE], helpText)
    )
  })
  
  output$rev_sol <- renderUI({})
  
  observeEvent(input$next_clue, 
               {
                 output$rev_sol <- renderUI({
                   actionButton('reveal', 'Reveal Solution')
                 })
               })
  
  observeEvent(input$reveal, 
               {
                 output$rev_sol <- renderUI({
                   withMathJax(
                     purrr::map(clues_sols()[order()[input$next_clue], 2, drop = TRUE], helpText)
                   )
                 })
               })
}

shinyApp(ui, server)
