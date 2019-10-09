library(shiny, attach.required = TRUE)
library(caret, attach.required = TRUE)
library(lattice, attach.required = TRUE)
library(ggplot2, attach.required = TRUE)
library(dplyr, attach.required = TRUE)
library(stats, attach.required = TRUE)
library(data.table, attach.required = TRUE)
library(graphics, attach.required = TRUE)
library(gbm)

#load mpg data
df<-mpg
        
#transform variables
attach(df)
df$manufacturer<-as.factor(manufacturer)
df$model<-as.factor(model)
df$trans<-as.factor(trans)
df$drv<-as.factor(drv)
df$fl<-as.factor(fl)
df$class<-as.factor(class)
detach(df)
        
#drop cty mpg
df<-subset(df, select =-c(cty,model, fl))
        
#fit model
modFit<-train(hwy~., method="gbm",data=df,verbose = FALSE)