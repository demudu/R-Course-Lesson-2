# load packages

library(dplyr)

# read data

data=read.table("data/rcourse_lesson2_data.txt", header=TRUE, sep="\t")

# look at Data

dim(data)
head(data)
tail(data)
str(data)

# subsetting data

data_clean = data %>% filter(name=="Page")

head(data_clean)
xtabs(~name,data_clean)

data_clean = data %>% filter(name=="Page") %>%
             mutate(name=factor(name))
head(data_clean)
xtabs(~name,data_clean)

data_clean = data %>% filter(name=="Page") %>%
  mutate(name=factor(name))%>%
  filter(year > 1900) %>% 
  filter(year <=2000)


head(data_clean)
xtabs(~name,data_clean)

min(data_clean$year)
max(data_clean$year)
