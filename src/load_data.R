# author: Racquelle & Farnaz
# date: March 9, 2020

# documentation for how to use scripts and comments

doc <- "This script loads 'suicides'

Usage: load_data.R --data_url=<url_to_raw_data_file>" 
  
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

main <-function(url){
 suicides <- read.csv('data/suicides.csv', row.names=1)
 write.csv(suicides, here ("data", "suiciderates.csv"))
 
 print("Print of script successful")
}
main(opt$data_url)
