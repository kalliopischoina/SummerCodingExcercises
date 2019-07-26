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

## for the following data analysis we will use data from the file ProfSalaries

stress<- read_csv(file.choose())

###in the following i will examine a bivariate data analysis, using descriptive statistics

####1) boxplot for the variables gender and salary
