# Goal for Day 2 - Tidyverse solution

# Load packages
library(tidyverse)

# Read in the input data
inputs <- read_table2("Inputs/02_input.txt", 
                      col_names = c("movement", "distance"))

# Convert the values based on the following rules:
### forward = positive
### down    = positive
### up      = negative
inputs_values <-
  inputs %>%
  mutate(distance = ifelse(movement == "up", -distance, distance))

# Now we can sum the down/up rows to get the final depth
depth <-
  inputs_values %>%
  filter(movement != "forward") %>%
  select(distance) %>%
  sum()

# Sum the forward distance to get the horizontal position
horizontal <-
  inputs_values %>%
  filter(movement == "forward") %>%
  select(distance) %>%
  sum()

# Compute the solution
depth * horizontal