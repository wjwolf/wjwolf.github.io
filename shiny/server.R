library(shiny)

shinyServer(
  function(input, output) {
      output$image <- renderImage({
          if (input$conversion == "Farenheit to Celsius" || input$conversion == "Celsius to Farenheit") {
             return(list(
                 src = "thermometer.png",
                 contentType = "image/png",
                 width = 100,
                 height = 100,
                 alt = "thermometer"
             )) } else {
             return(list(
                     src = "ruler.png",
                     contentType = "image/png",
                     width = 100,
                     height = 100,
                     alt = "thermometer"
             ))  
             }
      }, deleteFile=FALSE) 
      output$title <- renderText({paste("Convert ",input$conversion)})
      output$answer <- renderText({
          if (suppressWarnings(is.na(as.numeric(input$inputValue)))) {"Enter a numeric value please"}
          else { 
              nIn <- as.numeric(input$inputValue)
              if (input$conversion == "Farenheit to Celsius") {
                  nOut <- round((nIn - 32) * 5 / 9,digits=2)
                  paste(nIn, " degrees Farenheit is ", nOut, " degrees Celsius")
              } else 
                  
              if (input$conversion == "Celsius to Farenheit") {
                  nOut <- round(nIn * 9 /5 + 32,digits=2)
                  paste(nIn, " degrees Celsius is ", nOut, " degrees Farenheit")
              } else 
                  
              if (input$conversion == "Miles to Kilometers") {
                  nOut <- round(nIn * 1.60934,digits=2) 
                  paste(nIn, " miles is ", nOut, " kilometers")
              } else       
                  
              if (input$conversion == "Kilometers to Miles") {
                  nOut <- round(nIn / 1.60934,digits=2)
                  paste(nIn, " kilometers is ", nOut, " miles")
              }   
                  
          }
      })
  }    
)  
