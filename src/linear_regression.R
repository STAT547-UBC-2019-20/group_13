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
  suiciderates_clean <- read.csv(url_to_read, sep=",")
  # best-fit line (age vs # suicides)
  suicides_regression <- ggplot(suiciderates_clean, aes(`gdp_for_year....`, suicides_no)) +
    geom_point() +
    geom_smooth(method="lm") +
    theme_minimal(20) +
    xlab("GDP for year ($)") +
    ylab("Number of Suicides") +
    scale_x_continuous(labels = scales::comma_format())
  ggsave(here("images", "suicides_regression.png"), width = 15, height = 10, device="png")
  suicides_regression

  # linear models: ......
  suicides_gdp <- lm (suicides_no ~ `gdp_for_year....`, data= suiciderates_clean)

  suicides_regression_tidy <- broom::tidy(suicides_gdp)


# save to RDS file

  saveRDS(suicides_gdp, file = here("data", "linearregression.rds")) 
  saveRDS(suicides_regression_tidy, file = here("data", "linearregression_clean.rds"))

 message("Print of script successful")
}

main(opt$url_to_read)