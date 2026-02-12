# =============================================================================
# Day 4: SOLUTIONS
# Data Analysis with R and Claude Code
# =============================================================================

library(tidyverse)
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

# Exercise 1: Histogram of video duration
ggplot(corona, aes(x = duration)) +
  geom_histogram(bins = 30, fill = "steelblue", color = "white") +
  labs(
    title = "Distribution of Video Duration",
    x = "Duration (seconds)",
    y = "Number of Videos"
  ) +
  theme_minimal()

# The distribution is right-skewed - most videos are short

# Exercise 2: Bar chart of top 10 authors by number of videos
top_authors <- corona |>
  count(author_name, sort = TRUE) |>
  head(10)

ggplot(top_authors, aes(x = reorder(author_name, n), y = n)) +
  geom_col(fill = "coral") +
  coord_flip() +
  labs(
    title = "Top 10 Authors by Number of Videos",
    x = "Author",
    y = "Number of Videos"
  ) +
  theme_minimal()

# Exercise 3: Line plot of total daily views
daily_stats <- corona |>
  group_by(create_date) |>
  summarize(total_views = sum(view_count))

ggplot(daily_stats, aes(x = create_date, y = total_views)) +
  geom_line(color = "steelblue", linewidth = 1) +
  geom_point(color = "steelblue", size = 2) +
  scale_y_continuous(labels = label_comma()) +
  labs(
    title = "Total Daily Views - January 2026",
    x = "Date",
    y = "Total Views"
  ) +
  theme_minimal()

# Exercise 4: Scatter plot of view_count vs comment_count
ggplot(corona, aes(x = view_count, y = comment_count)) +
  geom_point(alpha = 0.3) +
  scale_x_log10(labels = label_comma()) +
  scale_y_log10(labels = label_comma()) +
  labs(
    title = "Views vs. Comments",
    x = "Views (log scale)",
    y = "Comments (log scale)"
  ) +
  theme_minimal()

# Exercise 5: Boxplot of engagement_rate by duration_category
ggplot(corona, aes(x = duration_category, y = engagement_rate)) +
  geom_boxplot(fill = "purple", alpha = 0.7) +
  labs(
    title = "Engagement Rate by Video Duration",
    x = "Duration Category",
    y = "Engagement Rate"
  ) +
  theme_minimal()

# Exercise 6: Publication-ready plot
publication_plot <- ggplot(daily_stats, aes(x = create_date, y = total_views)) +
  geom_line(color = "#1DA1F2", linewidth = 1) +
  geom_point(color = "#1DA1F2", size = 2) +
  scale_y_continuous(labels = label_comma()) +
  labs(
    title = "TikTok Activity about Fabrizio Corona",
    subtitle = "Total daily views throughout January 2026",
    x = NULL,
    y = "Total Views",
    caption = "Source: TikTok Research API | University of Urbino"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    plot.subtitle = element_text(color = "gray50"),
    panel.grid.minor = element_blank()
  )

publication_plot

# Exercise 7: Save plot
ggsave("output/daily_views_publication.png", 
       plot = publication_plot, 
       width = 10, height = 6, dpi = 300)

# CHALLENGE: Dual axis or faceted plot showing videos and views
# Option 1: Faceted plot
daily_full <- corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    total_views = sum(view_count)
  ) |>
  pivot_longer(cols = c(n_videos, total_views), 
               names_to = "metric", 
               values_to = "value")

ggplot(daily_full, aes(x = create_date, y = value)) +
  geom_line(color = "steelblue") +
  geom_point(color = "steelblue") +
  facet_wrap(~metric, scales = "free_y", ncol = 1) +
  labs(title = "Daily Videos and Views", x = "Date", y = NULL) +
  theme_minimal()
