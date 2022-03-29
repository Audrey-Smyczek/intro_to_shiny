
library(shiny)
library(tidyverse)
library(babynames)

ui <- fluidPage(sliderInput(inputId = "years", #input id is how this element will be called in the server later
                            label = "Choose the range of years:", #how it looks to the user; gives instructions
                            min = 1880, #min year
                            max = 2017, #max year
                            value = c(1880,2017), #range of value in slider
                            sep = ""), #what to put in the between the 100s and 1000s
                textInput(inputId = "name",
                          label = "Type the name you are interested in (start with capital letter):",
                          placeholder = "Rita"), #shows a grayed-out sample name
                selectInput(inputId = "sex",
                            label = "Choose the sex:",
                            choices = c(Female = "F", Male = "M")), #drop-down options, shows the word 'Female' but then chooses 'F' in dataset
                submitButton(text = "Create my plot!"), #doesn't let the changes of the inputs change the plot until this button is clicked
                plotOutput(outputId = "names_plot") #puts a place for a plot output in the UI, nothing should show up when there is no graph made, just blank
)

server <- function(input, output) {
  output$names_plot <- renderPlot(#renderPlot makes the plot for plotOutput using plotOutput name
    babynames %>% 
      filter(sex == input$sex, #connects inputId's to graph using $
             name == input$name) %>% 
      ggplot(aes(x = year,
                 y = n)) +
      scale_x_continuous(limits = input$years) + #input $ years returns a list of values which is good for this
      geom_line()
  )
}
shinyApp(ui = ui, server = server)

