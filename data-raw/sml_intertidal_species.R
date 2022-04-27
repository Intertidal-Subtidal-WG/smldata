## code to prepare `sml_intertidal_species` dataset goes here

#read in the species info and merge with the data
sml_intertidal_species <- read_csv("https://github.com/brianscheng/SEED/raw/main/data/intertidal/species_list_aggregate.csv") %>%
  rename(Organism = name) %>%
  mutate(type = case_when(
    type=="Green Algae" ~ "Algae",
    type=="Fungi" ~ "Fungus",
    type=="Microalgae" ~ "Algae",
    Organism=="Bare rock" ~ "Substrate",
    Organism=="Brown ground" ~ "Substrate",
    Organism=="Shell hash"  ~ "Substrate",
    Organism=="Feather" ~ "Detritus",
    Organism=="Turbellarid" ~ "Invertebrate",

    TRUE ~ type
  )) %>%
  rename_with(tolower)

#fix
usethis::use_data(sml_intertidal_species, overwrite = TRUE)
