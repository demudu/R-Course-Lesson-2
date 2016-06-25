## READ DATA

source("scripts/rcourse_lesson2_cleaning.R")

library(ggplot2)

data_figs =data_clean

##MAKE FIGURES

name.plot = ggplot(data_figs, aes(x=prop)) + geom_histogram()

pdf("figures/name.pdf")
name.plot
dev.off()

data_clean = data %>% filter(name=="Page") %>%
  mutate(name=factor(name))%>%
  filter(year > 1900) %>% 
  filter(year <=2000) %>%
  mutate(prop_loge = log(prop)) %>% 
  mutate(prop_log10 = log10(prop))

data_figs =data_clean

# Histogram of dependent variable (number pf Page's)- e based log tranfrom

name_loge.plot =ggplot(data_figs, aes(x=prop_loge)) + geom_histogram()
pdf("figures/name_loge.pdf")
name_loge.plot
dev.off()


# Histogram of dependent variable (number pf Page's)- 10 based log tranfrom

name_log10.plot =ggplot(data_figs, aes(x=prop_log10)) + geom_histogram()
pdf("figures/name_log10.pdf")
name_log10.plot
dev.off()


# Proportion of Page's by year (continuous predictor)

year.plot = ggplot(data_figs, aes(x=year, y=prop_log10)) + geom_point(aes(color="red")) +
            geom_smooth(method = "lm") 
pdf("figures/year.pdf")
year.plot
dev.off()


# Proportion of Page's by sex (categorical predictor)

sex.plot = ggplot(data_figs, aes(x=sex, y=prop_log10)) + geom_boxplot(aes(fill=sex))

pdf("figures/sex.pdf")
sex.plot
dev.off()

data_figs = data_clean %>%
            mutate(sex=factor(sex, levels=c("F","M"), labels=c("female", "male")))
sex.plot = ggplot(data_figs, aes(x=sex, y=prop_log10)) + geom_boxplot(aes(fill=sex))

pdf("figures/sex2.pdf")
sex.plot
dev.off()
