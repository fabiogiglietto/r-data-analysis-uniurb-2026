# =============================================================================
# Day 2: Working with Data — Import, Explore, Transform
# Data Analysis with R and Claude Code
# University of Urbino — PhD in Humanities
# =============================================================================

# Today we'll work with real data: TikTok videos about Fabrizio Corona

# -----------------------------------------------------------------------------
# SECTION 1: Load Packages
# -----------------------------------------------------------------------------

# Load the tidyverse (you installed this as homework)
library(tidyverse)

# If you get an error, run: install.packages("tidyverse")


# -----------------------------------------------------------------------------
# SECTION 2: Data Structures Review
# -----------------------------------------------------------------------------

# VECTORS: one-dimensional, single data type
authors <- c("user1", "user2", "user3")
views <- c(1000, 5000, 2500)

# DATA FRAMES: two-dimensional, mixed data types
# Think of it like a spreadsheet: rows = observations, columns = variables
example_df <- data.frame(
  author = c("user1", "user2", "user3"),
  views = c(1000, 5000, 2500),
  likes = c(100, 800, 300)
)

# View the data frame
example_df

# TIBBLES: modern data frames (part of tidyverse)
# More informative printing, stricter behavior
example_tibble <- tibble(
  author = c("user1", "user2", "user3"),
  views = c(1000, 5000, 2500),
  likes = c(100, 800, 300)
)

example_tibble


# -----------------------------------------------------------------------------
# SECTION 3: Import the Corona Dataset
# -----------------------------------------------------------------------------

# Set your working directory to where the data file is located
# Or use the full file path

# Import the CSV file
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv")

# Note: read_csv() is from tidyverse and creates a tibble
# It also shows you what data types it detected for each column

# View the data
corona


# -----------------------------------------------------------------------------
# SECTION 4: Exploring the Data
# -----------------------------------------------------------------------------

# DIMENSIONS
nrow(corona)    # Number of rows (videos)
ncol(corona)    # Number of columns (variables)
dim(corona)     # Both at once

# STRUCTURE AND OVERVIEW
glimpse(corona)    # Compact column-by-column view (great for wide data!)
summary(corona)    # Statistical summary of each column

# LOOK AT THE DATA
head(corona)           # First 6 rows
head(corona, 10)       # First 10 rows
tail(corona)           # Last 6 rows

# Open in spreadsheet viewer (capital V!)
View(corona)

# COLUMN NAMES
names(corona)          # List all column names
colnames(corona)       # Same thing

# ACCESS A SINGLE COLUMN with $
corona$view_count
corona$author_name

# UNIQUE VALUES
unique(corona$region_code)         # What regions are in the data?
n_distinct(corona$author_name)     # How many unique authors?
n_distinct(corona$video_id)        # How many unique videos?

# Exercise: Explore the dataset
# - How many rows and columns are there?
# - What are the column names?
# - How many unique dates are in create_date?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 5: Data Cleaning Basics
# -----------------------------------------------------------------------------

# Real data is messy! Let's check for common issues.

# CHECKING FOR MISSING VALUES (NA)
# Count NAs in each column
colSums(is.na(corona))

# Which columns have missing values?
corona |>
  summarize(
    missing_description = sum(is.na(description)),
    missing_hashtags = sum(is.na(hashtags))
  )

# NA means "Not Available" - the value is missing
# Many functions fail with NA unless you handle it:
x <- c(10, NA, 30)
mean(x)                  # Returns NA!
mean(x, na.rm = TRUE)    # Ignores NA → returns 20

# CHECKING FOR DUPLICATES
# Our dataset was already de-duplicated, but good practice to verify:
corona |>
  count(video_id, sort = TRUE) |>
  filter(n > 1)

# Note: videos with same description are OK - different creators can post
# similar content. Always de-duplicate by unique identifier (video_id)

# If needed, you could remove duplicates with:
# corona <- corona |> distinct(video_id, .keep_all = TRUE)

# FILTERING OUT BAD DATA
# Remove videos with no description AND no hashtags
corona_clean <- corona |>
  filter(!is.na(description) | !is.na(hashtags))

# Remove very short videos (< 1 second - likely errors)
corona_clean <- corona_clean |>
  filter(duration >= 1)

# Note: The only way to completely eliminate false positives is manual review
# or using an LLM to classify relevance - beyond this course's scope

# Tip: Always keep original data and create a new variable for cleaned data


# -----------------------------------------------------------------------------
# SECTION 6: Introduction to dplyr — select()
# -----------------------------------------------------------------------------

# dplyr is part of tidyverse and provides verbs for data manipulation
# select() chooses COLUMNS

# Select specific columns by name
corona |> select(video_id, author_name, view_count)

# Select a range of columns
corona |> select(video_id:duration)

# Remove columns with -
corona |> select(-music_id, -region_code)

# Select by pattern
corona |> select(ends_with("_count"))    # All columns ending in "_count"
corona |> select(starts_with("create"))  # All columns starting with "create"
corona |> select(contains("count"))      # All columns containing "count"

# Reorder columns (everything() keeps the rest)
corona |> select(author_name, view_count, everything())

# Exercise: Select only the engagement columns (like_count, comment_count, share_count)
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 7: Introduction to dplyr — filter()
# -----------------------------------------------------------------------------

# filter() chooses ROWS based on conditions

# Videos with more than 1 million views
corona |> filter(view_count > 1000000)

# Videos from a specific date
corona |> filter(create_date == "2026-01-15")

# Videos shorter than 30 seconds
corona |> filter(duration < 30)

# Videos longer than 60 seconds
corona |> filter(duration > 60)

# COMBINING CONDITIONS

# AND: both conditions must be true (use &)
corona |> filter(view_count > 100000 & duration < 60)

# OR: at least one condition must be true (use |)
corona |> filter(view_count > 1000000 | like_count > 100000)

# Multiple conditions with commas (same as &)
corona |> filter(view_count > 100000, duration < 60, like_count > 5000)

# NOT: negate a condition (use !)
corona |> filter(!is.na(description))  # Rows where description is NOT missing

# COMPARISON OPERATORS
# ==  equal to
# !=  not equal to
# >   greater than
# <   less than
# >=  greater than or equal to
# <=  less than or equal to
# %in%  is one of (for multiple values)

# Filter by multiple values with %in%
corona |> filter(create_date %in% c("2026-01-01", "2026-01-02", "2026-01-03"))

# Count results
corona |> filter(view_count > 1000000) |> nrow()


# -----------------------------------------------------------------------------
# SECTION 8: Combining select() and filter()
# -----------------------------------------------------------------------------

# The pipe |> allows us to chain operations
# Read it as "and then"

# Get top viewed videos with just key info
corona |>
  filter(view_count > 500000) |>
  select(author_name, description, view_count, like_count)

# Videos from first week of January, engagement columns only
corona |>
  filter(create_date >= "2026-01-01" & create_date <= "2026-01-07") |>
  select(video_id, create_date, ends_with("_count"))

# Exercise: Filter videos with more than 10,000 likes AND more than 100 comments
# Then select only author_name, description, like_count, and comment_count
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# EXERCISES
# -----------------------------------------------------------------------------

# Exercise 1: How many rows and columns does the Corona dataset have?
# [YOUR CODE HERE]


# Exercise 2: What is the data type of each column? (Hint: use glimpse())
# [YOUR CODE HERE]


# Exercise 3: How many unique authors are in the dataset?
# [YOUR CODE HERE]


# Exercise 4: Filter the dataset to show only videos with more than 500,000 views
# How many videos meet this criterion?
# [YOUR CODE HERE]


# Exercise 5: Select only these columns: author_name, description, view_count, like_count
# [YOUR CODE HERE]


# Exercise 6: Filter videos that have:
# - More than 10,000 likes AND
# - More than 100 comments
# How many videos meet both criteria?
# [YOUR CODE HERE]


# Exercise 7: Find videos from the first week of January (Jan 1-7)
# Hint: create_date >= "2026-01-01" & create_date <= "2026-01-07"
# [YOUR CODE HERE]


# CHALLENGE: Use Claude Code to help you find the video with the most views
# What is the author_name and how many views does it have?
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# KEY TAKEAWAYS
# -----------------------------------------------------------------------------

# 1. read_csv() imports CSV files into tibbles
# 2. Use glimpse(), summary(), head() to explore data
# 3. select() chooses columns
# 4. filter() chooses rows based on conditions
# 5. The pipe |> chains operations together

# See you on Day 3!
