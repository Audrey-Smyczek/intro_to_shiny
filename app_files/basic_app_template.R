# Use R Script instead of R markdown with apps
# This is the absolute bare minimum of what I need to create a shiny app.
# Beware! ... This alone will be a REALLY boring app. A blank page :(

library(shiny)
library(tidyverse)
library(babynames)

ui <- fluidPage("Some text") #usually the same, creates the page
server <- function(input, output) {} #basic function, where we write r code, incorperate parts of ui into server
shinyApp(ui = ui, server = server)

