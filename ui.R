library(shiny, attach.required = TRUE)
library(caret, attach.required = TRUE)
library(lattice, attach.required = TRUE)
library(ggplot2, attach.required = TRUE)
library(dplyr, attach.required = TRUE)
library(stats, attach.required = TRUE)
library(data.table, attach.required = TRUE)
library(graphics, attach.required = TRUE)

shinyUI(fluidPage(
        titlePanel("Hwy MPG Predictor"),
        tabsetPanel(type ="tabs",
                tabPanel("Main",
                        sidebarLayout(
                                sidebarPanel(
                                        h3("Model Inputs"),
                                        selectInput("select_man", "Select Manufacturer", levels(df$manufacturer)),
                                        selectInput("select_drv","Select DRV",levels(df$drv)),
                                        selectInput("select_class","Select Class",levels(df$class)),
                                        selectInput("select_trans","Select transmission",levels(df$trans)),
                                        sliderInput("select_displ","Select displacement",min = min(df$displ), max = max(df$displ), value = 2,step=.1),
                                        sliderInput("select_year","Select year",min = min(df$year), max = max(df$year), value = 1999,step=1, sep=""),
                                        sliderInput("select_cyl","Select cylinders",min = min(df$cyl), max = max(df$cyl), value = 4,step=1)
                                        ),
                                mainPanel(
                                        h3("Variable plotting"),
                                        selectInput("select_var", "Choose variable to display", names(subset(df,select = -hwy)), selected = "year"),
                                        plotOutput("plot1"),
                                        hr(),
                                        h3("Model Prediction:"),
                                        h1(textOutput("pred1"),style="color:red")
                                        )
                        )
                ),
                tabPanel("Documentation",
                h5("The purpose of this app is to predict highway MPGs for a car, given a set of inputs. The source of the data is the MPG dataset available in R. 
                        To use the app, select the inputs you would like to model in the sidebar on the left. An xgboost model has been fit to the data, 
                        and the model prediction will be output in the Model Prediction section.",
                        br(),br(),
                        "You can explore the dataset in the Variable Plotting panel. Select the variable you wish to plot, and it will be plotted relative to highway MPGs.")
                )
        )
))
