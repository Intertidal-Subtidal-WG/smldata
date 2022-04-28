## code to prepare `sml_intertidal_count` dataset goes here
library(dplyr)
library(tidyr)
library(readr)
library(here)
setwd(here())

source("./data-raw/data_parsing_functions.R")

#load the data from the SEED repo
sml_intertidal_count_raw <- read_csv("https://github.com/brianscheng/SEED/blob/main/data/intertidal/ct_clean.csv?raw=true") %>%
  rename(Intertidal_Transect = Transect) %>%
  select(-starts_with("X")) %>%
  mutate(Measure = "Count", Protocol = "Intertidal_Count") %>%
  rename(Value = Count) %>%
  mutate(Replicate = as.character(Replicate)) %>%
  mutate(Organism = ifelse(Organism == "Tectura testinalis", "Testudinalia testudinalis", Organism))



# add in additional info
sml_intertidal_count <- sml_intertidal_count_raw %>%
  fix_intertidal_organisms %>%
  transect_translate %>%
  intertidal_filter

usethis::use_data(sml_intertidal_count, overwrite = TRUE)
