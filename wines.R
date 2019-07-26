library (dplyr)
library (readr)
library (questionr)
library (sjmisc)
library(sjPlot)
library (haven)
library (car)
library(nnet)
library(ordinal)
library(plotly)

library(haven)

#####Bivariate descriptive statistics

## for the following data analysis we will use data from the file stressdata

wine<- read_csv(file.choose())


#####describing the variables
str (wine)

descr(wine)

###running scatterplots

plot_scatter(wine,alcohol,pH)

plot_scatter(wine,alcohol,density)

plot_scatter(wine, alcohol,residual.sugar)

plot_scatter(wine, alcohol,sulphates)

##### in the following i will run a correlation matrix

###correlation matrix

winenew<- select (wine,c(density,alcohol,pH,residual.sugar,sulphates,free.sulfur.dioxide,total.sulfur.dioxide,fixed.acidity,volatile.acidity,citric.acid,chlorides))


sjt.corr(winenew,show.p=TRUE,p.numeric=TRUE)

sjp.corr(winenew)

#### As a first step i will runsimple linear regression models
###with the biggest and the smallest correlation (according to the corr.table)


### finally i will run a multiple regression model including more variables

winenewmodel2<-lm(density ~ alcohol+pH+residual.sugar+sulphates+free.sulfur.dioxide+
                    fixed.acidity+volatile.acidity+
                    chlorides,data=winenew)

summary (winenewmodel2)

####multiple regression diagnostics

vif(winenewmodel2)####this command calculate the variance inflametion factor for my stressmodel3

###heteroscendacity assumption
####diagnostic plots



par(mfrow=c (2,2))
plot(winenewmodel2)
par(mfrow=c (1,1))

