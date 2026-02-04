# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a 10-hour PhD-level R data analysis course for the University of Urbino (Scienze della Comunicazione e Cultura Digitale program), February 9-13, 2026. The course teaches R fundamentals to communication/humanities researchers with no prior programming experience, using Claude Code as an AI learning assistant.

**Dataset:** TikTok videos about Fabrizio Corona (Italian media personality), January 2026 — 9,373 videos from 4,964 creators collected via TikTok Research API.

## Repository Structure

- `scripts/` — Daily lesson scripts (day1 through day5), each building on the previous
- `scripts/solutions/` — Complete answer keys for exercises
- `data/` — CSV dataset with TikTok video metadata (see `data/README.md` for data dictionary)
- `resources/` — Setup instructions, Claude Code tips, Italian stopwords, Uniurb ggplot2 theme
- `output/` — Directory for student-generated visualizations (gitignored)
- `slides/` — Course slide decks (Quarto revealjs, HTML output)
- `_uniurb.brandid/` — University of Urbino brand identity assets and guidelines

## R Package Stack

```r
library(tidyverse)  # Core: dplyr, ggplot2, tidyr, readr
library(tidytext)   # Text tokenization and analysis (Day 5)
library(scales)     # Axis label formatting for visualizations
```

## Code Conventions

- **Pipe operator:** Uses native R pipe `|>` (not magrittr's `%>%`)
- **Variable naming:** snake_case throughout
- **RStudio settings:** 2-space indentation, UTF-8 encoding
- **Exercise placeholders:** Look for `[YOUR CODE HERE]` comments

## Course Progression

1. **Day 1:** R basics — vectors, assignment, arithmetic, indexing
2. **Day 2:** Data import with `read_csv()`, exploration, `select()`, `filter()`, pipes
3. **Day 3:** Data wrangling — `mutate()`, `case_when()`, `group_by()`, `summarize()`, `count()`, `arrange()`
4. **Day 4:** Visualization with ggplot2 — histograms, bar charts, line plots, scatter plots, box plots, themes
5. **Day 5:** Text analysis — hashtag parsing, tokenization, stop word filtering, capstone project

## Working with the Dataset

```r
corona <- read_csv("data/fabrizio_corona_tiktok_jan2026.csv")
```

Key columns: `video_id`, `create_datetime`, `create_date`, `description`, `hashtags`, `duration`, `view_count`, `like_count`, `comment_count`, `share_count`, `author_name`

## Uniurb Brand Identity

All visual materials must follow the University of Urbino brand guidelines (see `_uniurb.brandid/`).

### Color Palette

| Color | Hex | Use |
|-------|-----|-----|
| Blu Scuro | `#294973` | Primary brand color |
| Blu Medio | `#49668C` | Secondary text |
| Blu Chiaro | `#7289A6` | Accents |
| Blu Pallido | `#A4B0BF` | Borders, grid lines |
| Grigio Chiaro | `#F2F2F2` | Backgrounds |
| Oro Primario | `#FAC73C` | Highlights, accents |

### Typography

- **Headings:** Montserrat (Google Fonts)
- **Body text:** Atkinson Hyperlegible (accessibility-focused)
- **Fallback:** Arial, Helvetica

### Quarto Slides

Slides use `uniurb.scss` theme with revealjs format:
```yaml
format:
  revealjs:
    theme: [default, uniurb.scss]
```

Section headers use dark blue background: `{background-color="#294973"}`

### ggplot2 Visualizations

Use the Uniurb theme and color scales from `resources/uniurb_theme.R`:
```r
source("resources/uniurb_theme.R")

ggplot(data, aes(x, y)) +
  geom_point(color = uniurb_colors$blue_dark) +
  scale_fill_uniurb(type = "mixed") +
  theme_uniurb()
```

## Context for AI Assistance

This is an educational repository. When helping:
- Explain concepts clearly for beginners with no programming background
- The audience are communication and humanities researchers
- Italian language context applies to text analysis (stopwords provided in `resources/`)
- Focus on understanding over just providing solutions
- Follow Uniurb brand identity for any visual outputs
