library(dplyr)
library(readr)


fix_intertidal_organisms <- . %>%
  mutate(Organism_Type = stringr::str_extract(Organism, " \\(.*$"),
         Organism_Type = stringr::str_replace_all(Organism_Type, " \\((.*)\\)$", "\\1"),
         Organism = stringr::str_replace_all(Organism, " \\((.*)\\)$", ""),
  )


transect_translate <- . %>%
  left_join(read_csv("data-raw/transect_translate.csv") ) %>%
  rename(subtidal_transect = Subtidal_Transect_Name)


intertidal_filter <- . %>%
  rename_all(tolower) %>%
  select(site, subtidal_transect, intertidal_transect, year, everything()) %>%
  dplyr::filter(data_taken != "no") %>%
  mutate(area = 0.04, tide_height_rel_mllw = (13-level)*0.348)

