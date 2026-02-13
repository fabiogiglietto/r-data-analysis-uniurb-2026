# =============================================================================
# Day 5: SOLUTIONS
# Data Analysis with R and Claude Code
# =============================================================================

library(tidyverse)
library(tidytext)
library(scales)

corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv",
                   col_types = cols(video_id = col_character(),
                                    music_id = col_character()))

# Prepare data
corona <- corona |>
  mutate(
    engagement_total = like_count + comment_count + share_count,
    engagement_rate = engagement_total / view_count,
    duration_category = factor(
      case_when(
        duration < 30 ~ "short",
        duration >= 30 & duration <= 60 ~ "medium",
        duration > 60 ~ "long"
      ),
      levels = c("short", "medium", "long")
    )
  )

# =============================================================================
# EXERCISE 3: Most commented videos about "processo" with URLs
# =============================================================================

# Add video URLs to the dataset
corona <- corona |>
  mutate(video_url = paste0("https://www.tiktok.com/@", author_name, "/video/", video_id))

# Find the 5 most commented videos mentioning "processo"
corona |>
  filter(str_detect(str_to_lower(description), "processo")) |>
  arrange(desc(comment_count)) |>
  head(5) |>
  select(author_name, description, comment_count, video_url)


# =============================================================================
# CAPSTONE OPTION A: ENGAGEMENT ANALYSIS
# =============================================================================

# 1. Calculate engagement metric (using engagement_rate)
summary(corona$engagement_rate)

# 2. Compare engagement across duration categories
engagement_by_duration <- corona |>
  group_by(duration_category) |>
  summarize(
    n_videos = n(),
    avg_engagement_rate = mean(engagement_rate, na.rm = TRUE),
    median_engagement_rate = median(engagement_rate, na.rm = TRUE),
    avg_views = mean(view_count)
  )

engagement_by_duration

# 3. Top 10 most engaging videos
corona |>
  arrange(desc(engagement_rate)) |>
  head(10) |>
  select(author_name, description, view_count, engagement_rate)

# 4. Visualizations
# Plot 1: Boxplot of engagement by duration
ggplot(corona, aes(x = duration_category, y = engagement_rate)) +
  geom_boxplot(fill = "steelblue", alpha = 0.7) +
  labs(
    title = "Engagement Rate by Video Duration",
    x = "Duration Category",
    y = "Engagement Rate"
  ) +
  theme_minimal()

# Plot 2: Scatter plot of views vs engagement
ggplot(corona, aes(x = view_count, y = engagement_rate)) +
  geom_point(alpha = 0.3) +
  geom_smooth(method = "loess", color = "red") +
  scale_x_log10(labels = label_comma()) +
  labs(
    title = "Views vs. Engagement Rate",
    x = "Views (log scale)",
    y = "Engagement Rate"
  ) +
  theme_minimal()

# 5. Summary:
# Short videos tend to have slightly higher engagement rates than longer videos.
# There is a negative relationship between view count and engagement rate - 
# viral videos tend to have lower engagement rates (more passive viewers).
# The most engaging videos by rate tend to be smaller videos with dedicated audiences.


# =============================================================================
# CAPSTONE OPTION B: TEMPORAL ANALYSIS
# =============================================================================

# 1. Daily and weekly statistics
daily_stats <- corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_views = mean(view_count),
    avg_engagement = mean(engagement_rate, na.rm = TRUE)
  )

# Add week number
daily_stats <- daily_stats |>
  mutate(week = lubridate::week(create_date))

weekly_stats <- daily_stats |>
  group_by(week) |>
  summarize(
    total_videos = sum(n_videos),
    total_views = sum(total_views),
    avg_daily_videos = mean(n_videos)
  )

weekly_stats

# 2. Identify spikes
daily_stats |> arrange(desc(n_videos)) |> head(5)  # Most videos
daily_stats |> arrange(desc(total_views)) |> head(5)  # Most views

# 3. First half vs second half
corona <- corona |>
  mutate(half_month = ifelse(create_date <= "2026-01-15", "first_half", "second_half"))

corona |>
  group_by(half_month) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_engagement = mean(engagement_rate, na.rm = TRUE)
  )

# 4. Visualizations
# Plot 1: Time series of daily videos
ggplot(daily_stats, aes(x = create_date, y = n_videos)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(color = "steelblue", size = 2) +
  labs(
    title = "Daily TikTok Videos about Fabrizio Corona",
    subtitle = "January 2026",
    x = "Date",
    y = "Number of Videos"
  ) +
  theme_minimal()

# Plot 2: Comparison bar chart
half_comparison <- corona |>
  group_by(half_month) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count)
  )

ggplot(half_comparison, aes(x = half_month, y = n_videos, fill = half_month)) +
  geom_col() +
  labs(
    title = "Video Count: First vs. Second Half of January",
    x = NULL,
    y = "Number of Videos"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# 5. Summary:
# Activity about Fabrizio Corona varied throughout January 2026.
# [Specific patterns would depend on actual data - look for spikes and explain]
# The first/second half comparison reveals whether interest grew or declined.


# =============================================================================
# CAPSTONE OPTION C: CREATOR ANALYSIS
# =============================================================================

# 1. Most prolific creators (by number of videos)
prolific_creators <- corona |>
  count(author_name, sort = TRUE) |>
  head(10)

prolific_creators

# 2. Most viewed creators (by total views)
viewed_creators <- corona |>
  group_by(author_name) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count),
    avg_views = mean(view_count)
  ) |>
  arrange(desc(total_views)) |>
  head(10)

viewed_creators

# 3. Compare the two lists
# Check overlap
prolific_names <- prolific_creators$author_name
viewed_names <- viewed_creators$author_name

overlap <- intersect(prolific_names, viewed_names)
length(overlap)  # How many are in both lists?
overlap  # Who are they?

# Correlation between n_videos and total_views per author
author_stats <- corona |>
  group_by(author_name) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count)
  )

cor(author_stats$n_videos, author_stats$total_views)

# 4. Visualizations
# Plot 1: Top creators by number of videos
ggplot(prolific_creators, aes(x = reorder(author_name, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Top 10 Most Prolific Creators",
    x = NULL,
    y = "Number of Videos"
  ) +
  theme_minimal()

# Plot 2: Top creators by total views
ggplot(viewed_creators, aes(x = reorder(author_name, total_views), y = total_views)) +
  geom_col(fill = "coral") +
  coord_flip() +
  scale_y_continuous(labels = label_comma()) +
  labs(
    title = "Top 10 Creators by Total Views",
    x = NULL,
    y = "Total Views"
  ) +
  theme_minimal()

# 5. Summary:
# The most prolific creators (most videos) are not always the most viewed.
# [X] creators appear in both top 10 lists.
# This suggests that quantity doesn't guarantee visibility - 
# some creators achieve high reach with fewer, higher-quality videos.
# The correlation between video count and total views is [positive/weak/etc].
