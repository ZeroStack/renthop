

# Set directory accordingly
file_dir <- basic:::get_file_dir()
setwd(file_dir)

# Load packages and data
packages <- c("jsonlite", "dplyr", "purrr")
purrr::walk(packages, library, character.only = TRUE, warn.conflicts = FALSE)

# Load data into R
data <- fromJSON("raw_data/train.json")

# unlist every variable except `photos` and `features` and convert to tibble
vars <- setdiff(names(data), c("photos", "features"))
data <- map_at(data, vars, unlist) %>% tibble::as_tibble(.)
