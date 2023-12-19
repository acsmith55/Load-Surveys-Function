# Aaron Smith
# 6.27.2023
#
# Task: Build a function that loads in all csvs from a particular file path.
#
################################################################################
# Data Prep ----
library(tidyverse)
library(data.table)

# Build a Function that pulls in all the data frames at once ----
load_surveys <- function(file) {
  
  file_list <- list.files(path = file,
                              recursive = TRUE,
                              pattern = "\\.csv$",
                              full.names = TRUE) %>%
    lapply(read.csv) %>%
    bind_rows
  as.data.frame(file_list)
  return(file_list)
}