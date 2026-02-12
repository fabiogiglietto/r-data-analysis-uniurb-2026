# =============================================================================
# Day 4: Data Visualization — Telling Stories with Data
# Data Analysis with R and Claude Code
# University of Urbino — PhD in Humanities
# =============================================================================

# Today we'll create visualizations with ggplot2

# -----------------------------------------------------------------------------
# SETUP
# -----------------------------------------------------------------------------

library(tidyverse)
library(scales)  # For better axis formatting

# Import and prepare the data
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv",
                   col_types = cols(video_id = col_character(),
                                    music_id = col_character()))

# Add our calculated variables from Day 3
corona <- corona |>
  mutate(
    engagement_total = like_count + comment_count + share_count,
    engagement_rate = engagement_total / view_count,
    duration_category = case_when(
      duration < 30 ~ "short",
      duration >= 30 & duration <= 60 ~ "medium",
      duration > 60 ~ "long"
    ),
    is_viral = view_count > 1000000
  )


# -----------------------------------------------------------------------------
# SECTION 1: The Grammar of Graphics
# -----------------------------------------------------------------------------

# ggplot2 builds plots in layers:
# 1. DATA: What dataset are you using?
# 2. AESTHETICS (aes): What variables map to x, y, color, size, etc.?
# 3. GEOMETRIES (geom_): What shapes represent the data?
# 4. ADDITIONAL LAYERS: Labels, themes, scales, etc.

# Basic template:
# ggplot(data = <DATA>, aes(x = <X_VAR>, y = <Y_VAR>)) +
#   geom_<TYPE>()

# Simple example
ggplot(data = corona, aes(x = view_count, y = like_count)) +
  geom_point()

# You can also write it more compactly
ggplot(corona, aes(x = view_count, y = like_count)) +
  geom_point()


# -----------------------------------------------------------------------------
# SECTION 2: Histograms — Distribution of One Variable
# -----------------------------------------------------------------------------

# Basic histogram
ggplot(corona, aes(x = view_count)) +
  geom_histogram()

# Control the number of bins
ggplot(corona, aes(x = view_count)) +
  geom_histogram(bins = 50)

# The data is very skewed — use log scale
ggplot(corona, aes(x = view_count)) +
  geom_histogram(bins = 50) +
  scale_x_log10()

# Add better labels
ggplot(corona, aes(x = view_count)) +
  geom_histogram(bins = 50, fill = "steelblue", color = "white") +
  scale_x_log10(labels = label_comma()) +
  labs(
    title = "Distribution of Video Views",
    x = "Views (log scale)",
    y = "Number of Videos"
  )

# Histogram of duration
ggplot(corona, aes(x = duration)) +
  geom_histogram(bins = 30, fill = "coral", color = "white") +
  labs(
    title = "Distribution of Video Duration",
    x = "Duration (seconds)",
    y = "Count"
  )

# Exercise: Create a histogram of like_count
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 3: Bar Charts — Counts by Category
# -----------------------------------------------------------------------------

# geom_bar() counts for you
ggplot(corona, aes(x = duration_category)) +
  geom_bar()

# Order categories logically
corona <- corona |>
  mutate(duration_category = factor(duration_category, 
                                    levels = c("short", "medium", "long")))

ggplot(corona, aes(x = duration_category)) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Videos by Duration Category",
    x = "Duration Category",
    y = "Number of Videos"
  )

# For pre-calculated values, use geom_col()
# First, let's prepare data for top authors
top_authors <- corona |>
  count(author_name, sort = TRUE) |>
  head(10)

ggplot(top_authors, aes(x = reorder(author_name, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +  # Flip coordinates for readability
  labs(
    title = "Top 10 Authors by Number of Videos",
    x = "Author",
    y = "Number of Videos"
  )

# Exercise: Create a bar chart showing videos by popularity category
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 4: Line Plots — Trends Over Time
# -----------------------------------------------------------------------------

# First, prepare daily data
daily_stats <- corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_views = mean(view_count)
  )

# Basic line plot
ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line()

# Add points
ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line() +
  geom_point()

# Customize appearance
ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(color = "steelblue", size = 2) +
  labs(
    title = "Daily TikTok Videos about Fabrizio Corona",
    subtitle = "January 2026",
    x = "Date",
    y = "Number of Videos",
    caption = "Source: TikTok Research API"
  )

# Total daily views
ggplot(daily_stats, aes(x = create_date, y = total_views)) +
  geom_line(color = "coral", linewidth = 1) +
  geom_point(color = "coral", size = 2) +
  scale_y_continuous(labels = label_comma()) +
  labs(
    title = "Total Daily Views",
    x = "Date",
    y = "Total Views"
  )

# Exercise: Create a line plot of average views per day
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 5: Scatter Plots — Relationships Between Variables
# -----------------------------------------------------------------------------

# Basic scatter plot
ggplot(corona, aes(x = view_count, y = like_count)) +
  geom_point()

# Too many points! Use transparency
ggplot(corona, aes(x = view_count, y = like_count)) +
  geom_point(alpha = 0.3)

# Add log scales (data is very skewed)
ggplot(corona, aes(x = view_count, y = like_count)) +
  geom_point(alpha = 0.3) +
  scale_x_log10(labels = label_comma()) +
  scale_y_log10(labels = label_comma())

# Add color by category
ggplot(corona, aes(x = view_count, y = like_count, color = duration_category)) +
  geom_point(alpha = 0.5) +
  scale_x_log10(labels = label_comma()) +
  scale_y_log10(labels = label_comma()) +
  labs(
    title = "Views vs. Likes by Video Duration",
    x = "Views (log scale)",
    y = "Likes (log scale)",
    color = "Duration"
  )

# Add a trend line
ggplot(corona, aes(x = view_count, y = like_count)) +
  geom_point(alpha = 0.2) +
  geom_smooth(method = "lm", color = "red") +
  scale_x_log10(labels = label_comma()) +
  scale_y_log10(labels = label_comma()) +
  labs(
    title = "Relationship Between Views and Likes",
    x = "Views (log scale)",
    y = "Likes (log scale)"
  )

# Exercise: Create a scatter plot of view_count vs comment_count
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 6: Box Plots — Distribution by Category
# -----------------------------------------------------------------------------

# Basic boxplot
ggplot(corona, aes(x = duration_category, y = view_count)) +
  geom_boxplot()

# With log scale (because views are skewed)
ggplot(corona, aes(x = duration_category, y = view_count)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7) +
  scale_y_log10(labels = label_comma()) +
  labs(
    title = "View Distribution by Video Duration",
    x = "Duration Category",
    y = "Views (log scale)"
  )

# Add points to show distribution
ggplot(corona, aes(x = duration_category, y = view_count)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7, outlier.shape = NA) +
  geom_jitter(alpha = 0.1, width = 0.2) +
  scale_y_log10(labels = label_comma()) +
  labs(
    title = "View Distribution by Video Duration",
    x = "Duration Category",
    y = "Views (log scale)"
  )

# Engagement rate by duration
ggplot(corona, aes(x = duration_category, y = engagement_rate)) +
  geom_boxplot(fill = "coral", alpha = 0.7) +
  labs(
    title = "Engagement Rate by Video Duration",
    x = "Duration Category",
    y = "Engagement Rate"
  )

# Exercise: Create a boxplot of like_count by duration_category
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# SECTION 7: Customization
# -----------------------------------------------------------------------------

# THEMES - change the overall look
p <- ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line(color = "steelblue", linewidth = 1)

# Default theme
p + theme_gray()

# Minimal theme (clean)
p + theme_minimal()

# Black and white
p + theme_bw()

# Classic (no gridlines)
p + theme_classic()

# COLORS
# Named colors
ggplot(corona, aes(x = duration_category)) +
  geom_bar(fill = "darkgreen")

# Hex colors
ggplot(corona, aes(x = duration_category)) +
  geom_bar(fill = "#1DA1F2")  # Twitter blue

# Color by category
ggplot(corona, aes(x = duration_category, fill = duration_category)) +
  geom_bar() +
  scale_fill_manual(values = c("short" = "#FF6B6B", 
                               "medium" = "#4ECDC4", 
                               "long" = "#45B7D1"))

# COMPLETE CUSTOMIZATION
ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line(color = "#1DA1F2", linewidth = 1) +
  geom_point(color = "#1DA1F2", size = 2) +
  labs(
    title = "Daily TikTok Videos about Fabrizio Corona",
    subtitle = "January 2026",
    x = NULL,  # Remove x label
    y = "Number of Videos",
    caption = "Source: TikTok Research API | Analysis by [Your Name]"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray50"),
    panel.grid.minor = element_blank()
  )


# -----------------------------------------------------------------------------
# SECTION 8: Saving Plots
# -----------------------------------------------------------------------------

# Save the last plot
ggsave("output/daily_videos.png", width = 10, height = 6, dpi = 300)

# Save a specific plot
my_plot <- ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line(color = "steelblue") +
  theme_minimal() +
  labs(title = "Daily Video Count")

ggsave("output/my_plot.png", plot = my_plot, width = 10, height = 6, dpi = 300)

# Different formats
ggsave("output/my_plot.pdf", plot = my_plot, width = 10, height = 6)
ggsave("output/my_plot.svg", plot = my_plot, width = 10, height = 6)


# -----------------------------------------------------------------------------
# EXERCISES
# -----------------------------------------------------------------------------

# Exercise 1: Create a histogram of video duration
# What does the distribution look like?
# [YOUR CODE HERE]


# Exercise 2: Create a bar chart showing the top 10 authors by number of videos
# Hint: First create a summary, then use geom_col() with coord_flip()
# [YOUR CODE HERE]


# Exercise 3: Create a line plot showing total daily views over January 2026
# [YOUR CODE HERE]


# Exercise 4: Create a scatter plot of view_count vs. comment_count
# Add appropriate log scales
# [YOUR CODE HERE]


# Exercise 5: Create a boxplot comparing engagement_rate across duration categories
# [YOUR CODE HERE]


# Exercise 6: Take one of your plots and make it publication-ready:
# - Add proper labels (title, subtitle, axis labels, caption)
# - Use a clean theme
# - Choose appropriate colors
# [YOUR CODE HERE]


# Exercise 7: Save your best plot as a PNG file
# [YOUR CODE HERE]


# CHALLENGE: Using Claude Code, create a visualization that shows
# both the number of videos and total views per day on the same plot
# (Hint: you might need two y-axes or facets)
# [YOUR CODE HERE]


# -----------------------------------------------------------------------------
# KEY TAKEAWAYS
# -----------------------------------------------------------------------------

# 1. ggplot2 builds plots in layers: data + aesthetics + geoms
# 2. geom_histogram() for distributions
# 3. geom_bar() for counts, geom_col() for pre-calculated values
# 4. geom_line() and geom_point() for time series
# 5. geom_point() for scatter plots
# 6. geom_boxplot() for distributions by category
# 7. Use scale_*_log10() for skewed data
# 8. labs() for titles and labels
# 9. theme_*() for different visual styles
# 10. ggsave() to export figures

# See you on Day 5 for text analysis and the capstone project!
