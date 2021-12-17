
# Read in the input file as a vector
Sonar <- scan("Inputs/01_SonarSweep.txt", quote="\"", comment.char="")

# Set the desired interval length
interval_length <- 3

# Create an empty vector to store the interval sums
interval_sums <- numeric()

# Loop through each interval and compute the sum
for (start in 1:length(Sonar)) {
  
  # Compute the ending index for each interval
  end <- start + (interval_length - 1)
  
  # If it's impossible to create another set of 3, leave the loop
  if(end > length(Sonar)) {
    break
  }
  
  # Compute the sum of the 3 unit interval
  # Store in the output vector
  interval_sums[start] <- sum(Sonar[start:end])

}

#########################################################################

# Apply the solution to part 1

# Stagger the vector
# Set the last value to the smallest possible value since the first value
#   cannot be an increase
Staggered <- c(interval_sums[2:length(interval_sums)], min(interval_sums) - 1)

# Compute the number of increases
num_increases <- sum(Staggered > interval_sums)
num_increases
