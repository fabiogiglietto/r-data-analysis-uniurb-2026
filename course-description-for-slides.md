# Data Analysis with R and Claude Code - Course Description

## Course Metadata

| Field | Value |
|-------|-------|
| Title | Data Analysis with R and Claude Code |
| Subtitle | From Zero to Hero for Media & Communication Researchers |
| Duration | 10 hours (5 sessions × 2 hours) |
| Dates | February 9-13, 2026 (Monday to Friday) |
| Time | 2 hours per day |
| Delivery | In-person |
| Target audience | PhD students in Humanities |
| Curriculum | Scienze della Comunicazione e Cultura Digitale |
| Prerequisites | None (no prior programming or data analysis experience required) |
| Instructor | Fabio Giglietto |
| Institution | University of Urbino |
| Materials | Public GitHub repository |

---

## Dataset

The course uses a real TikTok dataset:

| Attribute | Value |
|-----------|-------|
| Topic | Videos about Fabrizio Corona |
| Rows | 9,373 videos |
| Unique creators | 4,964 |
| Total views | 338,738,386 |
| Period | January 1-31, 2026 |
| Region | Italy |

---

## Day-by-Day Content for Slides

### Day 1: Foundations — Why Data Analysis & First Steps in R

**Key topics to cover:**

1. Welcome & Course Overview
   - Instructor introduction
   - Course goals: go from zero to being able to analyze social media data
   - Overview of the week
   - The Fabrizio Corona dataset as our case study

2. Why Data Analysis for Media Research?
   - Examples: social media trends, content analysis at scale, audience metrics
   - The shift from qualitative to mixed methods
   - What questions can data help answer?

3. RStudio Orientation
   - The four panes: Source, Console, Environment, Files/Plots/Help
   - Writing vs. running code
   - Keyboard shortcuts (Ctrl+Enter)

4. R Basics
   - Basic arithmetic: +, -, *, /, ^
   - Variables: assignment with <-
   - Data types: numeric, character, logical
   - Vectors: c(), length(), mean(), sum(), max(), min()
   - Getting help: ?function

5. Introduction to Claude Code
   - What it is and how to use it
   - Demo: explaining code, writing code, debugging
   - Best practices: learning WITH AI, not depending on it

---

### Day 2: Working with Data — Import, Explore, Transform

**Key topics to cover:**

1. Data Structures
   - Vectors (review)
   - Data frames: rows = observations, columns = variables
   - Tibbles: modern data frames

2. Importing Data
   - library(tidyverse)
   - read_csv() function
   - Understanding column types

3. Exploring Data
   - glimpse() - compact overview
   - summary() - statistics
   - head(), tail() - peek at data
   - View() - spreadsheet view
   - nrow(), ncol(), dim()
   - n_distinct() - unique values

4. Selecting Columns with select()
   - By name: select(col1, col2)
   - By range: select(col1:col5)
   - Remove: select(-col)
   - Helpers: ends_with(), starts_with(), contains()

5. Filtering Rows with filter()
   - Comparison operators: ==, !=, >, <, >=, <=
   - Combining conditions: & (and), | (or)
   - Multiple values: %in%

---

### Day 3: Data Wrangling — Transforming Data for Analysis

**Key topics to cover:**

1. Creating Variables with mutate()
   - Simple calculations: mutate(new_col = col1 + col2)
   - Multiple columns at once
   - Engagement metrics: engagement_rate = (likes + comments + shares) / views

2. Recoding with case_when()
   - Creating categories from numeric variables
   - Example: duration_category (short/medium/long)
   - Example: popularity (low/medium/high/viral)

3. The Pipe Operator |>
   - What it does: passes result to next function
   - Reading it as "and then"
   - Chaining operations for readable code

4. Summarizing Data
   - summarize(): n(), sum(), mean(), median(), min(), max()
   - Handling missing values: na.rm = TRUE

5. Grouping with group_by()
   - group_by() + summarize() = statistics by group
   - Example: daily statistics
   - Example: statistics by duration category

6. Counting and Sorting
   - count() - frequency tables
   - arrange() - sorting (desc() for descending)

---

### Day 4: Data Visualization — Telling Stories with Data

**Key topics to cover:**

1. The Grammar of Graphics
   - Data + Aesthetics + Geometries + Layers
   - Basic template: ggplot(data, aes(x, y)) + geom_*()

2. Histograms
   - geom_histogram()
   - Controlling bins
   - Log scales for skewed data: scale_x_log10()

3. Bar Charts
   - geom_bar() - counts automatically
   - geom_col() - pre-calculated values
   - coord_flip() for horizontal bars
   - reorder() for ordering bars

4. Line Plots
   - geom_line() + geom_point()
   - Time series data
   - Daily trends

5. Scatter Plots
   - geom_point()
   - Transparency with alpha
   - Color by category
   - Trend lines: geom_smooth()

6. Box Plots
   - geom_boxplot()
   - Comparing distributions across categories

7. Customization
   - labs() - titles, subtitles, axis labels, captions
   - Themes: theme_minimal(), theme_bw(), theme_classic()
   - Colors: named colors, hex codes, scale_fill_manual()

8. Saving Figures
   - ggsave() - PNG, PDF, SVG

---

### Day 5: Putting It All Together — Text Analysis & Capstone

**Key topics to cover:**

1. Hashtag Analysis
   - separate_rows() - split comma-separated values
   - str_to_lower(), str_trim() - text cleaning
   - Counting and visualizing top hashtags

2. Word Frequency Analysis
   - unnest_tokens() - tokenization
   - Stopwords and anti_join()
   - Word frequency visualization

3. Reproducible Workflows
   - Project organization: data/, scripts/, output/
   - Script structure
   - Commenting code

4. Capstone Exercise (45 min)
   - Option A: Engagement Analysis
   - Option B: Temporal Analysis
   - Option C: Creator Analysis

5. Resources & Next Steps
   - R for Data Science book
   - Text Mining with R book
   - Posit cheatsheets
   - Online communities

---

## Slide Design Suggestions

- Use a clean, minimal design
- Include lots of code examples with output
- Use the Corona dataset examples throughout
- Include "Try it yourself" moments
- Add discussion questions
- Keep text minimal on slides (detail is in scripts)
- Include screenshots of RStudio where helpful
- Use consistent color scheme (suggestion: University of Urbino colors or TikTok-inspired palette)
