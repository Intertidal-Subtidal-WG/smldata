## code to prepare `sml_intertidal_cover` dataset goes here
library(dplyr)
library(tidyr)
library(readr)
library(here)
setwd(here())

source("./data-raw/data_parsing_functions.R")

#load the data from the SEED repo
sml_intertidal_cover_raw <- read_csv("https://github.com/brianscheng/SEED/blob/main/data/intertidal/pc_clean.csv?raw=true") %>%
  rename(Intertidal_Transect = Transect) %>%
  select(-starts_with("X")) %>%
  mutate(Measure = "Percent_Cover", Protocol = "Intertidal_Cover") %>%
  rename(Value = Percent_cover)


# add in additional info
sml_intertidal_cover <- sml_intertidal_cover_raw %>%
  fix_intertidal_organisms %>%
  transect_translate %>%
  intertidal_filter

usethis::use_data(sml_intertidal_cover, overwrite = TRUE)
