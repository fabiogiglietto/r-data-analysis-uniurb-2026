---
layout: default
title: Materials
nav_order: 2
---

# Course Materials

---

## Download Everything

The easiest way to get all course materials:

1. Go to the [GitHub repository](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026)
2. Click the green **Code** button
3. Select **Download ZIP**
4. Extract the ZIP file on your computer

---

## Daily Scripts

| Day | Topic | Script | Solutions |
|:---:|-------|--------|-----------|
| 1 | Foundations | [day1-basics.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/day1-basics.R) | — |
| 2 | Working with Data | [day2-import-explore.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/day2-import-explore.R) | [day2-solutions.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/solutions/day2-solutions.R) |
| 3 | Data Wrangling | [day3-wrangling.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/day3-wrangling.R) | [day3-solutions.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/solutions/day3-solutions.R) |
| 4 | Visualization | [day4-visualization.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/day4-visualization.R) | [day4-solutions.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/solutions/day4-solutions.R) |
| 5 | Text Analysis | [day5-text-analysis.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/day5-text-analysis.R) | [day5-solutions.R](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/scripts/solutions/day5-solutions.R) |

---

## Dataset

| File | Description | Download |
|------|-------------|----------|
| `fabrizio_corona_tiktok_jan2026.csv` | TikTok dataset (9,373 videos) | [Download](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/data/fabrizio_corona_tiktok_jan2026.csv) |
| `README.md` | Data dictionary | [View](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/blob/main/data/README.md) |

### Dataset Columns

| Column | Type | Description |
|--------|------|-------------|
| `video_id` | string | Unique TikTok identifier |
| `create_time` | integer | Unix timestamp |
| `create_datetime` | datetime | UTC datetime |
| `create_date` | date | Date only |
| `description` | string | Video caption text |
| `hashtags` | string | Comma-separated hashtags |
| `duration` | numeric | Video length (seconds) |
| `view_count` | numeric | Number of views |
| `like_count` | numeric | Number of likes |
| `comment_count` | numeric | Number of comments |
| `share_count` | numeric | Number of shares |
| `author_name` | string | Creator username |
| `music_id` | string | Audio track identifier |
| `region_code` | string | Country code (IT) |

---

## Resources

| File | Description | Download |
|------|-------------|----------|
| Italian Stopwords | Word list for text analysis | [Download](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026/raw/main/resources/italian-stopwords.csv) |
| Setup Instructions | Installation guide | [View](setup.html) |
| Claude Code Tips | AI assistant guide | [View](claude-code.html) |

---

## Required R Packages

After installing R and RStudio, install these packages:

```r
install.packages(c("tidyverse", "tidytext", "scales"))
```

| Package | Purpose |
|---------|---------|
| `tidyverse` | Data manipulation and visualization (includes dplyr, ggplot2, tidyr, readr) |
| `tidytext` | Text mining and analysis |
| `scales` | Axis label formatting |
