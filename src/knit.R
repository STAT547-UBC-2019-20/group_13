# author: Racquelle and Farnaz
# date: March 17, 2020

# documentation for knitting Rmd to html and pdf

doc <- "This script knits Rmd to html and pdf

Usage: knit.R --final_report=<final_report>" 

# load libraries and packagaes

suppressMessages(library(docopt))

# parse/define command line arguments 
opt <- docopt(doc)

main <- function(final_report){
  rmarkdown::render(final_report, 
                  c("html_document", "pdf_document"))
  
  print("Print of script successful")
}

main(opt$final_report)