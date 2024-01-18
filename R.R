###---SETUP---
rm(list = ls())
library(corrplot)
library(tidyverse)

setwd("C:\\Users\\Jose de Vera\\Desktop\\AI 201\\miniproject")

data <- read_csv("phytoplankton.csv")


hist(data$temp,main="Histogram of Temperature",xlab="Temperature (degrees Celsius)")
hist(data$chlor,main="Histogram of Chlorophyll",xlab="Chlorophyll (ug/L)")
hist(data$salinity,main="Histogram of Salinity",xlab="Salinity (psu)")
hist(data$depth,main="Histogram of Depth",xlab="Chlorophyll (ug/L)")

lm <- lm(Thalassionema~temp+chlor+salinity+depth, data = data)
summary(lm)
plot(lm)


standardized <- data %>%
  mutate(chlor = scale(chlor)[,1],
         salinity = scale(salinity)[,1],
         depth = scale(depth)[,1])
write_csv(standardized,"standardized.csv")
