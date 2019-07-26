#load libraries

library (dplyr)
library (readr)
library (questionr)
library (sjmisc)
library(sjPlot)
library (haven)
library (car)
library(nnet)
library(ordinal)

#read file
options(scipen=7)

setwd("C:\\Users\\fujitsu\\Dropbox\\popis\\summerEx")
insurance<- read_csv(file.choose())

####new data frame before creating  corr matrix

newinssurance<-select(insurance,c(age,bmi,expenses))

sjp.corr(newinssurance)

sjt.corr(newinssurance,show.p=TRUE,p.numeric=TRUE)



