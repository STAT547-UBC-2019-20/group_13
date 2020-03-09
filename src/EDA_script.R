# author: Racquelle & Farnaz
# date: March 9, 2020

# documentation for how to use scripts and comments

doc <- "This script processes 'suicides'

Usage: process_data.R --data_url=<url_to_clean_data_file>" 

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

main <- function(url_to_read){
  ## Load the csv
  suicidesratesnew <- read.csv(url_to_read, sep=" ")

# EDA 
nrow(suicideratesnew)
ncol(suicideratesnew)
summary(suicideratesnew)

# Plots
# In this first plot, we will look at how suicides may differ between generations, globally between 1985-2016.

gen_suicides <- suicideratesnew %>% 
  group_by(generation) %>% 
  summarise("mean_suicides"=mean(suicides_no)) %>% 
ggplot() +
  geom_col(aes(x=fct_reorder(generation, mean_suicides),y=mean_suicides, fill=generation)) +
  xlab("Generation") +
  ylab("Mean # of suicides") +
  theme_minimal(20) +
  coord_flip() + 
  ggtitle("Average number of suicides globally across generations (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(here ("images", "gen_suicides.png"), width = 15, height = 10)
    
    gen_suicides


# In the second plot, we look at how suicide rates have changed over the years, particularly in Canada, and see if there is a trend. 
canada_suicides <- suicideratesnew %>%     
  filter(country== 'Canada') %>% 
  group_by(year) %>% 
  summarise("sum_suicides"=sum(suicides_no)) %>% 
ggplot() +
  geom_line(aes(x=year, y=sum_suicides)) +
  xlab("Year") +
  ylab("Sum of suicides") +
  theme_minimal(20) +
  ggtitle("Number of suicides in Canada (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(here ('canada_suicides.png', sep= "/", width = 15, height = 10)) 
    
    canada_suicides

# Lastly, we will see the distribution of suicides between sexes within the entire dataset. suicideratesnew %>% 
sex_suicides <- suicideratesnew %>% 
ggplot() +
  geom_boxplot(aes(x=sex, y= log10(suicides_no), fill=sex)) +
  xlab("Sex") +
  ylab("Number of suicides") +
  theme_minimal(20) +
  ggtitle("Distribution of suicides between sexes, globally (1985-2016)") +
  theme(plot.title = element_text(hjust = 0.5))
    ggsave(filename= paste(path,'suiciderates_sex.png', sep= "/", width = 15, height = 10))

    sex_suicides
####

  write.csv(gen_suicides, here ("images", "gen_suicides.png"))
    write.csv(canada_suicides, here ("images", "canada_suicides.png"))
    write.csv(sex_suicides, here ("images", "sex_suicides.png"))
  
  print("Print of script successful")
}

main(opt$url_to_read)
