#preparation stage

library(caret)
library(tidyverse)
library(ggpubr)
getwd()

train <- read_csv("train.csv")
test <- read_csv("test.csv")

train <- train %>% mutate(Notes = "Train")
test <- test %>% mutate(Notes = "Test")


#join train and test data
df_full <- train %>% bind_rows(test) %>% mutate(logPrice = log10(SalePrice))


#getting to know your data
summary(df_full)
glimpse(df_full)
df_full %>% is.na() %>% colSums()

## changing all char variables into factor
df_full <- df_full %>% mutate_if(is.character, as.factor)

#finding non factor variable
df_full_nonfactor <- df_full[,!sapply(df_full, is.factor)]
glimpse(df_full_nonfactor)
#change non factor variable into factor
MSSubClass, OverallQual, OverallCond, 

#add new variable remodel
is year built the same as year remod

#
df_full %>% filter(Notes == "Train") %>% 
  ggqqplot(x = "SalePrice")


df_full %>% filter(Notes == "Train") %>% 
  ggqqplot(x = "logPrice")


#looking for correlation between variables start from 
corr.test