## code to prepare `sml_intertidal_count` dataset goes here
library(dplyr)
library(tidyr)
library(readr)
library(here)
setwd(here("data-raw"))

#load the data from the SEED repo
cover <- read_csv("https://github.com/brianscheng/SEED/blob/main/data/intertidal/pc_clean.csv?raw=true") %>%
  rename(Intertidal_Transect = Transect) %>%
  select(-starts_with("X")) %>%
  mutate(Measure = "Percent_Cover", Protocol = "Intertidal_Cover") %>%
  rename(Value = Percent_cover)

count <- read_csv("https://github.com/brianscheng/SEED/blob/main/data/intertidal/ct_clean.csv?raw=true") %>%
  rename(Intertidal_Transect = Transect) %>%
  select(-starts_with("X")) %>%
  mutate(Measure = "Count", Protocol = "Intertidal_Count") %>%
  rename(Value = Count)


# write data out
usethis::use_data(sml_intertidal, overwrite = TRUE)
