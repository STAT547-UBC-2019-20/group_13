# author: Racquelle and Farnaz
# date: March 17, 2020

# documentation for linear regression and EDA

doc <- "This script does linear regression of 'suicides'

Usage: linear_regression.R --url_to_read=<url_to_clean_data_file>" 

# load libraries and packagaes

suppressMessages(library(tidyr))
suppressMessages(library(dplyr))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(docopt))
suppressMessages(library(glue))
suppressMessages(library(modelr))
suppressMessages(library(broom))

# parse/define command line arguments 

opt <- docopt(doc)

main <- function(url_to_read){
  # Load the csv
  suiciderates_clean <- read.csv(url_to_read, sep=" ")

# best-fit line (age vs # suicides)
  
suicides_regression -> ggplot(suiciderates_clean, aes(year, suicides_no)) +
    geom_point() +
    geom_smooth(method="lm")
ggsave(here ("images", "suicides_regression.png"), width = 15, height = 10)

suicides_regression

# linear models

# year vs number of suicides

suicides_year <- lm (suicides_no ~ year, data= suicidesrates_clean)
coef(suicides_age_no)

suicides_year

# save to RDS file

saveRDS(suicides_year, file = "linearregression.rds", file=url_to_read) 


print("Print of script successful")
}

main(opt$url_to_read)