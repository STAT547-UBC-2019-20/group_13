# author: Racquelle & Farnaz
# date: March 17, 2020

.PHONY: all clean

## YOUR SOLUTION HERE FOR THE `all` target
all: docs/finalreport.html docs/finalreport.pdf

# download data
data/suiciderates.csv : src/load_data.R
Rscript src/load_data.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates.csv"

# clean data
data/suicidesrates_clean.csv : src/process_data.R data/suiciderates.csv
  Rscript src/process_data.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv"

# EDA
images/gen_suicides.png images/canada_suicides.png images/sex_suicides.png : src/EDA_script.R data/suiciderates_clean.csv
  Rscript src/EDA_script.R -- url_to_read="https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv"

# Knit report
docs/finalreport.html docs/gen_suicides.png docs/canada_suicides.png docs/sex_suicides.png docs/finalreport.Rmd data/suiciderates_clean.csv src/knit.R docs/asd_refs.bib
  Rscript src/knit.R --final_report="docs/final_report.Rmd"

clean :
    rm -f data/*
    rm -f images/*
    rm -f docs/*.md
    rm -f docs/*.html