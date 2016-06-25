## READ DATA

source("scripts/rcourse_lesson2_cleaning.R")

## Load Packages
#[none]

# organise data
data_clean = data %>% filter(name=="Page") %>%
  mutate(name=factor(name))%>%
  filter(year > 1900) %>% 
  filter(year <=2000) %>%
  mutate(prop_loge = log(prop)) %>% 
  mutate(prop_log10 = log10(prop))

data_stats = data_clean

## Build Model - Proportion of Page's by Year (Contnuos Predictor)

year.lm = lm(prop_log10~year, data=data_stats)

year.lm_sum = summary(year.lm)
year.lm_sum


## Build Model - Proportion of Page's by Sex (categorical Predictor)

sex.lm = lm(prop_log10~sex, data=data_stats)

sex.lm.sum = summary(sex.lm)
sex.lm.sum
