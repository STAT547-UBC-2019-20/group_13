# author: Racquelle & Farnaz
# date: March 9, 2020

# documentation for how to use scripts and comments

doc <- "This script processes 'suicides'

Usage: src/process_data.R --url_to_read=<url_to_raw_data_file>" 

# load libraries and packagaes
suppressMessages(library(tidyr))
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(docopt))
suppressMessages(library(glue))

# parse/define command line arguments 
#' Add together two numbers
#'
#' @param url_to_read: this link will take us to the csv file of our raw dataset
#' @param y A number
#' @return The sum of \code{x} and \code{y}
#' @examples
#' main(https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates.csv)
#' 
opt <- docopt(doc)

main <- function(url_to_read){
  ## Load the csv
  suicidesrates <- read.csv(url_to_read, sep=" ")

# Finding out how many NAs
sum(is.na(suicidesrates))/27820*12

sum(is.na(suicidesrates$HDI.for.year))/27820

# Getting rid of NAs, resulting in new dataset
suicideratesnew <- suicidesrates %>% 
  select(-HDI.for.year)

# Confirmation of NAs removed 
sum(is.na(suicideratesnew))/27820*11

write.csv(suicideratesnew, here ("data", "suiciderates_clean.csv"))

print("Print of script successful")
}

main(opt$url_to_read)
