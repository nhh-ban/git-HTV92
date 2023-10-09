
# Skeleton file 2 for Assignment 1 in BAN400.
# -------------------------------------------

# More detailed steps to complete Problem 1.
# Solution developed using Posit Cloud (formerly known as RStudio Cloud). I like the cloud cause it provides a good way to manage projects and provides stable handling of library installation.

library(tidyverse)    # Contains most of what we need.

# Read the entire data file into memory using the readLines()-function. Use the
# URL direcly or read the data from the local file that is in the repository.

library(tidyverse)

raw_file <- readLines(con = "suites_dw_Table1.txt")

L <- which(substr(x = raw_file, start = 1, stop = 2) == "--")[1]

cat(raw_file[1:(L-2)], sep = "\n", file = "variable_descriptions.txt")

variable_names <- str_split(string = raw_file[L-1], pattern = "\\|") %>% unlist() %>% str_trim()

comma_separated_values <- raw_file[(L+1):length(raw_file)] %>%
  gsub("\\|", ",", .) %>%
  gsub(" ", "", .)

comma_separated_values_with_names <- c(paste(variable_names, collapse = ","), comma_separated_values)

new_csv_file <- "galaxies_cleaned.csv"

cat(comma_separated_values_with_names, sep = "\n", file = new_csv_file)

galaxies <- read_csv(new_csv_file)
