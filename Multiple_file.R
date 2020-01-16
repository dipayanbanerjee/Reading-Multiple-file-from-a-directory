rm(list = ls())
setwd("~/Documents/Datasets/World Happiness")

library(readr)
library(data.table)

# Creating a list of files from the directory
file.list <- list.files(pattern = '*.csv')

# Reading the list of files with read_csv function
df.list <- lapply(file.list,read_csv)

# Merging the dataframe as a single data object with an indicator column
worldhappiness.df <- rbindlist(df.list,idcol = "id",fill = TRUE)


# Little data wrangling
# Replacing the indicator with actual indicator
worldhappiness.df$id <- ifelse(worldhappiness.df$id == "1",2015,
                               ifelse(worldhappiness.df$id=="2",2016,
                                      ifelse(worldhappiness.df$id=="3",2017,
                                             ifelse(worldhappiness.df$id==4,2018,2019))))

# The chunk would return a null dataframe, as no compelete cases
worldhappiness.df <- worldhappiness.df[complete.cases(worldhappiness.df),]

View(worldhappiness.df)







