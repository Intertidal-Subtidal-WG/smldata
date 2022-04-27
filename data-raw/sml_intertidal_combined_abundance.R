## code to prepare `sml_intertidal_combined_abundance` dataset goes here
## code to prepare `sml_intertidal_count` dataset goes here
library(dplyr)
library(tidyr)
library(readr)
setwd(here::here())

load("data/sml_intertidal_count.rda")
load("data/sml_intertidal_cover.rda")


sml_intertidal_combined_abundance <-
  bind_rows(sml_intertidal_cover, sml_intertidal_count)


usethis::use_data(sml_intertidal_combined_abundance, overwrite = TRUE)
