

# Read in the input file as a vector
Sonar <- scan("Inputs/01_SonarSweep.txt", quote="\"", comment.char="")

# Stagger the vector
# Set the last value to the smallest possible value since the first value
#   cannot be an increase
Staggered <- c(Sonar[2:length(Sonar)], min(Sonar) - 1)

# Compute the number of increases
num_increases <- sum(Staggered > Sonar)
num_increases
