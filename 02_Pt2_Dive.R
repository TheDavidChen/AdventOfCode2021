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

# Compute the aim for each row individually, ignoring past values.
### Then cumulative sum the values to determine the actual aim
# Repeat the process for horizontal movement and depth
sub_positions <-
  inputs_values %>%
  mutate(row_aim = ifelse(movement != "forward", distance, 0),
         row_hor = ifelse(movement == "forward", distance, 0)) %>%
  mutate(sub_aim = cumsum(row_aim), 
         sub_hor = cumsum(row_hor)) %>%
  mutate(row_depth = ifelse(movement == "forward", sub_aim * distance, 0)) %>%
  mutate(sub_depth = cumsum(row_depth))

# Compute the final output
tail(sub_positions$sub_depth, 1) * tail(sub_positions$sub_hor,1)


