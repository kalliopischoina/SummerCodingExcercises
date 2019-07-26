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

stress<- read_csv(file.choose())
#####describing the variables
str (stress)

descr(stress)
###running scatterplots
plot_scatter(stress,hours_sleep,hours_exercise)

plot_scatter(stress,hours_sleep,hours_exercise)

plot_scatter(stress,hours_sleep,hours_leisure)

plot_scatter(stress,hours_sleep,age)

##### in the following i will run a correlation matrix

###correlation matrix

sjt.corr(stress,show.p=TRUE,p.numeric=TRUE)
####there is moderate negative correlation between the variables stress and hours_sleep
### as well as a moderate negative correlation between the variables sress and hours_leisure
###for the rest variables there is not correlation, which is statistically significant

#### running a linear regression model1

stressmodel1<-lm(stress~hours_sleep,data=stress)
summary (stressmodel1)

####runnig a linear regression model2

stressmodel2<-lm(stress~hours_leisure,data=stress)
summary(stressmodel2)

### finally i will run a multiple regression model for the variables with the best fit

stressmodel3<-lm(stress~hours_leisure+hours_sleep,data=stress)
summary (stressmodel3)

####multiple regression diagnostics

vif(stressmodel3)####this command calculate the variance inflametion factor for my stressmodel3
### according to the results(1.19 for both variables)it is ok

###heteroscandacity assumption

plot(stressmodel3)

####diagnostic plots

par(mfrow=c (2,2))
plot(stressmodel3)











