# Author: Farnaz & Racquelle
# Date: March 26, 2020

"This script is the main file that creates a Dash app.

Usage: app.R
"

suppressMessages(library(dash))
suppressMessages(library(here))
suppressMessages(library(dashCoreComponents))
suppressMessages(library(dashHtmlComponents))
suppressMessages(library(tidyverse))
suppressMessages(library(plotly))
suppressMessages(library(ggplot2))
suppressMessages(library(dplyr))

## LOAD DATASET
suiciderates <- read_csv(here::here("data", "suiciderates_clean.csv"))
data <- suiciderates %>% 
  filter(country %in% c('Canada', 'United States', 'Mexico')) 

## PLOTS

# BOXPLOT (PLOT 1) 
make_plot1= function(xaxis="Generation X"){
<<<<<<< HEAD
  generation_key= DropdownKey$label[DropdownKey$value==xaxis]
  boxplot = data %>%
    filter(generation==xaxis) %>% 
    ggplot() +
    geom_violin(aes(x=sex, y=suicides_no, fill=sex)) +
    theme_bw(12) +
    theme(legend.position = "none")+
    theme(axis.title.x = element_blank()) +
    ylab("Number of Suicides")+
    scale_y_continuous(labels = scales::comma_format())+
    ggtitle(paste0("Number of suicides in ", generation_key," based on sex (1985-2016)")) +
=======
  boxplot = data %>%
    filter(generation==xaxis) %>% 
    ggplot() +
    geom_violin(aes(x=generation, y=suicides_no, fill=generation)) +
    theme_bw(12) +
    xlab("Generation") +
    ylab("Number of Suicides")+
    labs(fill="Generation") +
    ggtitle("Number of Suicides for each generation (1985-2016)") +
>>>>>>> upstream/master
    theme(plot.title = element_text(hjust = 0.5))
  
  ggplotly(boxplot, tooltip=c("text"))
}

## DROPDOWN FOR BOXPLOT (PLOT1)
DropdownKey <- tibble(label = unique(data$generation),
                      value = unique(data$generation))
Dropdown <- dccDropdown(
  id = "Dropdown",
  options = map(1:nrow(DropdownKey),   function(i){
    list(label=DropdownKey$label[i], value=DropdownKey$value[i])
  }),
<<<<<<< HEAD
  value = "Generation X",
  clearable= FALSE
=======
  value = "Generation X"
>>>>>>> upstream/master
)

## HISTOGRAM (PLOT 2)
make_plot2= function(xaxis="Canada"){
<<<<<<< HEAD
  country_key= DropdownKey1$label[DropdownKey1$value==xaxis]
  histogram = data %>%
    filter(country==xaxis) %>% 
    ggplot() +
    geom_boxplot(aes(x=sex, y=suicides_no, fill=sex)) +
    theme_bw(12) +
    theme(legend.position = "none")+
    ylab("Number of Suicides") +
    theme(axis.title.x = element_blank()) +
    scale_y_continuous(labels = scales::comma_format()) +
    ggtitle(paste0("Number of suicides in ", country_key," based on sex (1985-2016)")) +
=======
  histogram = data %>%
    filter(country==xaxis) %>% 
    ggplot() +
    geom_boxplot(aes(x=country, y=suicides_no, fill=country)) +
    theme_bw(12) +
    xlab("Country") +
    ylab("Number of Suicides") +
    labs(fill="Country") +
    ggtitle("Number of Suicides for each country (1985-2016)") +
>>>>>>> upstream/master
    theme(plot.title = element_text(hjust = 0.5))
  
  ggplotly(histogram, tooltip=c("text"))
}

## SLIDER FOR HISTOGRAM
DropdownKey1 <- tibble(label = unique(data$country),
                       value = unique(data$country))
Dropdown1 <- dccDropdown(
  id = "Dropdown1",
  options = map(1:nrow(DropdownKey1),   function(i){
    list(label=DropdownKey1$label[i], value=DropdownKey1$value[i])
  }),
<<<<<<< HEAD
  value = "Canada",
  clearable= FALSE
=======
  value = "Canada"
>>>>>>> upstream/master
)

## LINE GRAPH (PLOT 3)
make_plot3= function(){
<<<<<<< HEAD
  line1 = data %>% 
    ggplot(aes(x=year, y=gdp_per_capita....)) +
    geom_line(aes(colour=country)) +
    ylab("GDP per capita") +
    xlab("Year") +
    guides(colour="none") +
    scale_y_continuous(labels = scales::dollar_format()) +
=======
  line1 = ggplot(data, aes(year, gdp_per_capita...., fill=country)) +
    geom_jitter() +
    xlab("Year") +
    ylab("GDP per capita") +
    scale_y_continuous(labels = scales::dollar_format()) +
    labs(fill="Country") +
>>>>>>> upstream/master
    theme_minimal(12) +
    ggtitle("Change of GDP per capita over time") +
    theme(plot.title = element_text(hjust = 0.5))
  
  ggplotly(line1, tooltip=c("text"))
}

## Headers and description/usage
header1 <-  htmlH1("Do socioeconomic factors play a role in suicides in North America?")
header3 <-  htmlH3("By: Racquelle and Farnaz")
desc_usage <- dccMarkdown("

<<<<<<< HEAD
**Welcome to our dashboard!**

In this app you can find information on how *socio-economic factors* play an important role in the *number of suicide rates* in different countries and how they change between 1985 to 2016. 
There are 3 plots that show how suicide rates change according to changes in socio-economic factors. The violin plot provides information on how Generation can affect number of suicides.
The box plot provides information on how number of suicides change according to country. The jitter plot is very informative in interpreting the trend of GDP per capita vs year in different countries (Canada, Mexico, United States). This dashboard has dropdown menus for the violin plot and box plot that will essentially allow the user to choose another variable rather than what is shown on the plots. 
You can find the link to the suicide dataset [here](https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv).

")
image1 = dccMarkdown("![] (https://raw.githubusercontent.com/STAT547-UBC-2019-20/group_13/master/images/old%20(2).png)")
image2= dccMarkdown("![] (https://raw.githubusercontent.com/STAT547-UBC-2019-20/group_13/master/images/north-america%20(1).png)")
=======
**Welcome to our Dashboard**

In this app you can find information on how *socio-economic factors* play an important role in the *number of suicide rates* in different countries and how they change between 1985 to 2016. 
There are 3 plots that show how suicide rates change according to changes in socio-economic factors. The violin plot provides information on how Generation can affect number of suicides.
The box plot provides information on how number of suicides change according to country. 

The jitter plot is very informative in interpreting the trend of GDP per capita vs year in different countries (Canada, Mexico, United States). This dashboard has dropdown menus for the violin plot and box plot that will essentially allow the user to choose another variable rather than what is shown on the plots. 
You can find the link to the suicide dataset [here](https://raw.githubusercontent.com/STAT547-UBC-2019-20/data_sets/master/suiciderates_clean.csv).


**Usage**

David is a sociologist who is interested in the assessment and prevention of suicide as part of his major. 
He is wondering how different socio-economic variables can affect suicide rates. 
He is also curious to know if those socio-economic factors intersect together. 
One day he is searching on the web and he finds our app that provides information on how socio-economic variables interact with the number of suicides.
")
>>>>>>> upstream/master

## Create Dash instance
app <- Dash$new()

## LAYOUT ELEMENTS
# Headers
div_header1 = htmlDiv(
  list(header1,
       header3
  ),
  style = list(
    backgroundColor = '#FFEBEE',
    textAlign = 'center',
    color = 'black',
    margin = 5,
    marginTop = 0
  )
)

div_header2 = htmlDiv(
  list(desc_usage
  ),
  style = list(
    backgroundColor = '#F5F5F5',
<<<<<<< HEAD
    textAlign = 'center',
=======
    textAlign = 'left',
>>>>>>> upstream/master
    color = 'black',
    margin = 2,
    marginTop = 0
  )
)


# Side bar with dropdowns
div_siderbar = htmlDiv(
<<<<<<< HEAD
  list(image1,
       Dropdown,
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       htmlBr(),
       image2,
=======
  list(htmlLabel('Generation'),
       htmlBr(),
       Dropdown,
       htmlBr(),
       htmlBr(),
       htmlLabel('Country'),
       htmlBr(),
>>>>>>> upstream/master
       Dropdown1
  ), 
  style = list('background-color' = '#FFEBEE',
               'textAlign'='center',
               'color'= 'black',
<<<<<<< HEAD
               'padding' = '15',
               'flex-basis' = '17%')
=======
               'padding' = 10,
               'flex-basis' = '20%')
>>>>>>> upstream/master
)

# Plots
div_main <- htmlDiv(
  list(dccGraph(id='Violin', figure = make_plot1()),
<<<<<<< HEAD
       htmlBr(),
       htmlBr(),
       dccGraph(id='Boxplot', figure = make_plot2()),
       htmlBr(),
       htmlBr(),
=======
       dccGraph(id='Boxplot', figure = make_plot2()),
>>>>>>> upstream/master
       dccGraph(id='Scatter', figure = make_plot3())
  )
)

## APP LAYOUT
app$layout(
  div_header1,
  div_header2,
  htmlDiv(
    list(
      div_siderbar,
      div_main
    ), 
    style = list('display' = 'flex',
                 'justify-content'='space-around')
  )
)
<<<<<<< HEAD

=======
  
>>>>>>> upstream/master

## APP CALLBACKS

# BOXPLOT (PLOT 1) & DROPDOWN
app$callback(
  output=list(id='Violin', property='figure'),
  params=list(input(id='Dropdown', property='value')),
  function(xaxis) {
    make_plot1(xaxis)
  })

# HISTOGRAM (PLOT 2) & SLIDER
app$callback(
  output=list(id='Boxplot', property='figure'),
  params=list(input(id="Dropdown1", property='value')),
  function(xaxis) {
    make_plot2(xaxis)
  })

## Run app 
<<<<<<< HEAD
app$run_server(debug=TRUE)
=======
app$run_server(debug=TRUE)
>>>>>>> upstream/master
