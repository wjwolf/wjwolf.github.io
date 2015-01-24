shinyUI(
    pageWithSidebar(
        headerPanel("Bill's Conversion App"),
        sidebarPanel(
            radioButtons("conversion", "Choose conversion type:",
                         list("Farenheit to Celsius", 
                              "Celsius to Farenheit",
                              "Miles to Kilometers",
                              "Kilometers to Miles")),
            br(),
            textInput(inputId="inputValue",label="Value")
        ),
        mainPanel(
            textOutput('title'),
            br(),
            textOutput('answer'),
            br(),
            imageOutput('image')
        )
    )
)