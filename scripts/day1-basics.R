# =============================================================================
# Day 1: Foundations — First Steps in R
# Data Analysis with R and Claude Code
# University of Urbino — PhD in Humanities
# =============================================================================

# Welcome to R! This script will guide you through the basics.
# Lines starting with # are comments — R ignores them.
# To run a line of code, place your cursor on it and press Ctrl+Enter (Cmd+Enter on Mac)

# -----------------------------------------------------------------------------
# SECTION 1: Basic Arithmetic
# -----------------------------------------------------------------------------

# R can work as a calculator
2 + 2
10 - 3
5 * 4
20 / 5
3^2        # 3 squared (exponentiation)
sqrt(16)   # Square root

# Try some calculations yourself:
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 2: Creating Variables
# -----------------------------------------------------------------------------

# Use <- to assign values to variables (the "assignment operator")
x <- 10
y <- 5

# Now you can use these variables
x + y
x * y
x / y

# Variables can store any type of data
my_name <- "Fabio"        # Text (character)
my_age <- 30              # Number (numeric)
is_student <- TRUE        # Logical (TRUE or FALSE)

# View a variable by typing its name
my_name

# Let's create some variables related to our course topic
platform <- "TikTok"
subject <- "Fabrizio Corona"
n_videos <- 9373

# Exercise: Create variables for your own name and research interest
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 3: Vectors
# -----------------------------------------------------------------------------

# A vector is a collection of values of the same type
# Create vectors using c() which stands for "combine"

# Numeric vector
views <- c(1000, 5000, 25000, 100000, 50000)
views

# Character vector
platforms <- c("TikTok", "Instagram", "YouTube", "Facebook")
platforms

# Logical vector
is_viral <- c(TRUE, FALSE, TRUE, TRUE, FALSE)
is_viral

# Access elements using square brackets
views[1]       # First element
views[3]       # Third element
views[c(1,3)]  # First and third elements

# Basic functions for vectors
length(views)   # How many elements?
sum(views)      # Total
mean(views)     # Average
max(views)      # Maximum
min(views)      # Minimum
sort(views)     # Sort ascending
sort(views, decreasing = TRUE)  # Sort descending

# Exercise: Create a vector called 'likes' with 5 numbers of your choice
# Then calculate the mean and sum
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 4: Logical Operations
# -----------------------------------------------------------------------------

# Comparison operators return TRUE or FALSE
5 > 3    # Greater than
5 < 3    # Less than
5 == 5   # Equal to (note: two equals signs!)
5 != 3   # Not equal to
5 >= 5   # Greater than or equal to

# Apply to vectors - compares each element
views <- c(1000, 5000, 25000, 100000, 50000)

views > 10000          # Which values are greater than 10000?
views == 5000          # Which values equal 5000?

# Count how many meet a condition
sum(views > 10000)     # How many values > 10000?

# Find which positions meet a condition
which(views > 10000)   # Positions where views > 10000

# Exercise: Create a logical vector showing which views are below the mean
# Hint: You can use mean(views) inside the comparison
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 5: Getting Help
# -----------------------------------------------------------------------------

# Use ? to get help on any function
?mean
?sum
?sort

# Use help.search() to search for topics
help.search("average")

# Exercise: Look up the help for the sd() function
# What does it calculate?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 6: Installing and Loading Packages
# -----------------------------------------------------------------------------

# Packages extend R's functionality
# Install a package (only need to do this once):
# install.packages("tidyverse")

# Load a package (need to do this each R session):
# library(tidyverse)

# Note: We'll install tidyverse as homework
# Run this command before Day 2:
# install.packages("tidyverse")


# -----------------------------------------------------------------------------
# EXERCISES
# -----------------------------------------------------------------------------

# Exercise 1: Create a vector called 'likes' with these values: 100, 500, 2000, 800, 350
# [YOUR CODE HERE]


# Exercise 2: Calculate the mean of your 'likes' vector
# [YOUR CODE HERE]


# Exercise 3: Calculate the sum of your 'likes' vector
# [YOUR CODE HERE]


# Exercise 4: Create a logical vector called 'above_average' that is TRUE 
# when likes are above the mean
# [YOUR CODE HERE]


# Exercise 5: How many values in 'likes' are above the mean?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# HOMEWORK
# -----------------------------------------------------------------------------

# 1. Run this command to install the tidyverse package:
#    install.packages("tidyverse")
#    (This may take a few minutes)

# 2. Create a new R script and practice:
#    - Create at least 3 variables
#    - Create a numeric vector with at least 5 values
#    - Calculate mean, sum, min, and max of your vector

# 3. Try asking Claude Code:
#    "What is the tidyverse and why is it useful for data analysis?"

# See you on Day 2!
