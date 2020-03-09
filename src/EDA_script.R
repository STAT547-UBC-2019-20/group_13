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


# EDA 
nrow(suicideratesnew)
ncol(suicideratesnew)
summary(suicideratesnew)

# plots
# In this first plot, we will look at how suicides may differ between generations, globally between 1985-2016.
gen_suicides <- suicideratesnew %>% 
  group_by(generation) %>% 
  summarise("mean_suicides"=mean(suicides_no)) 
DT::datatable(gen_suicides)

gen_suicides %>% 
ggplot() +
  geom_col(aes(x=fct_reorder(generation, mean_suicides),y=mean_suicides, fill=generation)) +
  xlab("Generation") +
  ylab("Mean # of suicides") +
  theme_minimal() +
  coord_flip() + 
  ggtitle("Average number of suicides globally across generations (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(filename= paste(path,'gen_suicides.png', sep= "/", width = 15, height = 10))


# In the second plot, we look at how suicide rates have changed over the years, particularly in Canada, and see if there is a trend. 
canada_suicides <- suiciderates %>% 
  filter(country== 'Canada') %>% 
  group_by(year) %>% 
  summarise("sum_suicides"=sum(suicides_no))
DT::datatable(canada_suicides)

canada_suicides %>%     
ggplot() +
  geom_line(aes(x=year, y=sum_suicides)) +
  xlab("Year") +
  ylab("Sum of suicides") +
  theme_minimal() +
  ggtitle("Number of suicides in Canada (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(filename= paste(path,'canada_suicides.png', sep= "/", width = 15, height = 10))

# Lastly, we will see the distribution of suicides between sexes within the entire dataset. suicideratesnew %>% 
suicideratesnew %>% 
ggplot() +
  geom_violin(aes(x=sex, y= suicides_no, fill=sex)) +
  xlab("Sex") +
  ylab("Number of suicides") +
  theme_minimal() +
  ggtitle("Distribution of suicides between sexes, globally (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(filename= paste(path,'suiciderates_sex.png', sep= "/", width = 15, height = 10))


#######


main <-function(url){
  suicides <- read.csv('data/suicides.csv', row.names=1)
  write.csv(suicides, here ("data", "suiciderates.csv"))
  
  print("Print of script successful")
}
main(opt$data_url)
