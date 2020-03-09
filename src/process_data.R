# author: Racquelle & Farnaz
# date: March 9, 2020

# documentation for how to use scripts and comments

doc <- "This script processes 'suicides'

Usage: process_data.R --data_url=<url_to_raw_data_file>" 

# load libraries and packagaes
suppressMessages(library(tidyr))
suppressMessages(library(dplyr))
suppressMessages(library(ggplot2))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(docopt))
suppressMessages(library(glue))

# parse/define command line arguments 

opt <- docopt(doc)

#take in the filename to where the wrangled data should be saved as a command-line argument

# wrangle/clean/process your raw data and save a new version of data for later analysis

# finding out how many NAs
sum(is.na(suiciderates))/27820*12

sum(is.na(suiciderates$HDI.for.year))/27820

# getting rid of NAs, resulting in new dataset
suicideratesnew <- suiciderates %>% 
  select(-HDI.for.year)

DT::datatable(suicideratesnew)

# confirmation of NAs removed 
sum(is.na(suicideratesnew))/27820*11

#######

main <-function(url){
  suicides <- read.csv('data/suicides.csv', row.names=1)
  write.csv(suicides, here ("data", "suiciderates.csv"))
  
  print("Print of script successful")
}
main(opt$data_url)
