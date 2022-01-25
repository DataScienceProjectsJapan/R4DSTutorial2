library("tidyverse")
library(dplyr)
library("lubridate")
library("readxl")
library("highcharter")
library("tidyquant")
library("timetk")
library("tibbletime")
library("quantmod")
library("PerformanceAnalytics")
library("scales")
prices <-
  read_excel("C:/Users/hoang/OneDrive/Desktop/Reproducible Finance.xlsx",
             col_types = c("date", "numeric", "numeric","numeric","numeric",
                           "numeric")) %>%
  mutate(data = ymd(date)) %>%
  tk_xts(date_var = date)

