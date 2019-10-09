library(shiny, attach.required = TRUE)
library(caret, attach.required = TRUE)
library(lattice, attach.required = TRUE)
library(ggplot2, attach.required = TRUE)
library(dplyr, attach.required = TRUE)
library(stats, attach.required = TRUE)
library(data.table, attach.required = TRUE)
library(graphics, attach.required = TRUE)

shinyServer(function(input,output){
                pred<-reactive({
                        manufacturerInput<-input$select_man
                        displInput<-input$select_displ
                        yearInput<-input$select_year
                        cylInput<-input$select_cyl
                        transInput<-input$select_trans
                        drvInput<-input$select_drv
                        classInput<-input$select_class
                        newdata = data.frame(
                             manufacturer = manufacturerInput,
                             displ = displInput,
                             year = yearInput,
                             cyl = cylInput,
                             trans = transInput,
                             drv = drvInput,
                             class = classInput
                             )
        round(predict(modFit,newdata),digits =2)
        })
        output$pred1<-renderText({pred()})
        output$plot1<-renderPlot({
             with(df,plot(get(input$select_var),hwy,xlab=input$select_var,ylab="Hwy MPG")) 
        })
        })