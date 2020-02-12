# APP TO TRIAL RENDERING MATHJAX FROM THE DATA FRAME
library(shiny)

ui <- fluidPage(
  withMathJax(),
  tags$div(HTML("
                ")),
  helpText('An irrational number $\sqrt{2}$
           and a fraction $$1-\\frac{1}{2}$$')
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
