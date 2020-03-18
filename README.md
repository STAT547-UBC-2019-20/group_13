# Group_13
:star: Farnaz and Racquelle :star: 

## Suicide Rates Overview 1985 to 2016

### Introduction

This compiled dataset pulled from four other datasets linked by time and place was built to find signals correlated to increased suicide rates among different cohorts globally, across the socio-economic spectrum. The inspiration for this study was to prevent suicide. This data set includes 11 columns and provides information about country, year, sex, age group, count of suicides, population, suicide rate, country-year composite key, gdp_for_year, gdp_per_capita, generation (based on age grouping average).

The references for this study are:

- [United Nations Development Program. (2018). Human development index (HDI)](http://hdr.undp.org/en/indicators/137506)

- [World Bank. (2018). World development indicators: GDP (current US$) by country:1985 to 2016](http://databank.worldbank.org/data/source/world-development-indicators#)

- [Szamil. (2017). Suicide in the Twenty-First Century dataset](https://www.kaggle.com/szamil/suicide-in-the-twenty-first-century/notebook)

- [World Health Organization. (2018). Suicide prevention](http://www.who.int/mental_health/suicide-prevention/en/)

## Milestone 1
Our exploratory data analysis can be found [here](https://stat547-ubc-2019-20.github.io/group_13/docs/suicide-data.html). 

## Milestone 2
**(1)** Ensure the following packages are installed:

````
tidyr
dplyr
ggplot2
here
tidyverse
docopt
glue
````

**(2)** Our Rscripts to load, process, and conduct exploratory data analysis can be fould in the links below:

  1. [load_data.R](https://github.com/STAT547-UBC-2019-20/group_13/blob/master/src/load_data.R): This loads the raw data file into a CSV.
  
  2. [process_data.R](https://github.com/STAT547-UBC-2019-20/group_13/blob/master/src/process_data.R): Cleaned data via omitting NAs and   eliminating one of the columns. 
  
  3. [EDA_script.R](https://github.com/STAT547-UBC-2019-20/group_13/blob/master/src/EDA_script.R): Performed exploratory data analysis of our cleaned dataset.
  
 To replicate this analysis, clone this repository, navigate to the `src` folder in your terminal, and type in the commands below:
 
````
Rscript src/load_data.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates.csv"
 
 Rscript src/process_data.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv"
 
 Rscript src/EDA_script.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv"

````
 
 ## Milestone 3
 
# documentation for knitting Rmd to html and pdf

doc <- "This script knits Rmd to html and pdf
Usage: knit.R --final_report=<final_report>" 

# load libraries and packagaes

suppressMessages(library(docopt))

# parse/define command line arguments 
opt <- docopt(doc)

main <- function(url_to_read){
  
rmarkdown::render('docs/finalreport.Rmd', 
                  c("html_document", "pdf_document"))
  
  print("Print of script successful")
}

main(opt$final_report)


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

# Usage for GNU Make

Ensure you load all the packages below:

suppressMessages(library(tidyr))
suppressMessages(library(dplyr))
suppressMessages(library(here))
suppressMessages(library(tidyverse))
suppressMessages(library(docopt))
suppressMessages(library(glue))
suppressMessages(library(modelr))
suppressMessages(library(broom))




  
