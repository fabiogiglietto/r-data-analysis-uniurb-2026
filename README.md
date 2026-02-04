# Data Analysis with R and Claude Code

**From Zero to Hero for Media & Communication Researchers**

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/)
[![Course Website](https://img.shields.io/badge/Course-Website-blue)](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/)

**[View the Course Website](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/)**

## Course Information

| | |
|---|---|
| **Instructor** | Fabio Giglietto |
| **Institution** | University of Urbino |
| **Program** | PhD in Humanities — Scienze della Comunicazione e Cultura Digitale |
| **Dates** | February 9-13, 2026 |
| **Duration** | 10 hours (5 sessions × 2 hours) |

## Description

This intensive one-week course introduces PhD students to data analysis using R and Claude Code. Through hands-on exercises with a real TikTok dataset, students learn to import, manipulate, visualize, and analyze social media data.

No prior programming experience required.

## Schedule

| Day | Date | Topic |
|-----|------|-------|
| 1 | Mon, Feb 9 | Foundations — Why Data Analysis & First Steps in R |
| 2 | Tue, Feb 10 | Working with Data — Import, Explore, Transform |
| 3 | Wed, Feb 11 | Data Wrangling — Transforming Data for Analysis |
| 4 | Thu, Feb 12 | Data Visualization — Telling Stories with Data |
| 5 | Fri, Feb 13 | Putting It All Together — Text Analysis & Capstone |

## Software Setup

Please install the following **before Day 1**:

### 1. R

Download from [CRAN](https://cran.r-project.org/) and install the version for your operating system.

### 2. RStudio

Download [RStudio Desktop](https://posit.co/download/rstudio-desktop/) (free version) and install it after R.

### 3. Claude Code

1. Install [Node.js](https://nodejs.org/) (version 18 or later)
2. Open a terminal and run:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
3. Create an account at [Anthropic](https://www.anthropic.com/) if you don't have one
4. See [detailed instructions](https://docs.anthropic.com/en/docs/claude-code)

### 4. R Packages

After installing R and RStudio, open RStudio and run:

```r
install.packages(c("tidyverse", "tidytext", "scales"))
```

📖 See [resources/setup-instructions.md](resources/setup-instructions.md) for detailed step-by-step instructions.

## Repository Contents

```
├── slides/                 # Daily slide decks (Quarto/HTML)
├── data/                   # Dataset for exercises
├── scripts/                # R scripts for each day
│   └── solutions/          # Exercise solutions
└── resources/              # Cheatsheets and additional materials
```

## How to Download Materials

### Option 1: Download Everything (Recommended)

1. Click the green **Code** button above
2. Select **Download ZIP**
3. Extract the ZIP file on your computer

### Option 2: Download Individual Files

1. Navigate to the file you want
2. Click on the file name
3. Click the **Download** button (or **Raw** then save the page)

## Dataset

The course uses a dataset of **9,373 TikTok videos** about Fabrizio Corona posted in Italy during January 2026, collected via the TikTok Research API.

| Attribute | Value |
|-----------|-------|
| Filename | `fabrizio_corona_tiktok_jan2026.csv` |
| Rows | 9,373 videos |
| Unique creators | 4,964 |
| Total views | 338+ million |
| Period | January 1-31, 2026 |

See the [data dictionary](data/README.md) for variable descriptions.

## Daily Materials

### Day 1: Foundations
- [Slides](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/slides/day1-foundations.html) | [Source](slides/day1-foundations.qmd)
- [Script](scripts/day1-basics.R)

### Day 2: Working with Data
- [Slides](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/slides/day2-working-with-data.html) | [Source](slides/day2-working-with-data.qmd)
- [Script](scripts/day2-import-explore.R)
- [Solutions](scripts/solutions/day2-solutions.R)

### Day 3: Data Wrangling
- [Slides](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/slides/day3-data-wrangling.html) | [Source](slides/day3-data-wrangling.qmd)
- [Script](scripts/day3-wrangling.R)
- [Solutions](scripts/solutions/day3-solutions.R)

### Day 4: Visualization
- [Slides](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/slides/day4-visualization.html) | [Source](slides/day4-visualization.qmd)
- [Script](scripts/day4-visualization.R)
- [Solutions](scripts/solutions/day4-solutions.R)

### Day 5: Text Analysis & Capstone
- [Slides](https://fabiogiglietto.github.io/r-data-analysis-uniurb-2026/slides/day5-text-analysis.html) | [Source](slides/day5-text-analysis.qmd)
- [Script](scripts/day5-text-analysis.R)
- [Solutions](scripts/solutions/day5-solutions.R)

## Resources

- [Setup Instructions](resources/setup-instructions.md) — Detailed installation guide
- [Claude Code Tips](resources/claude-code-tips.md) — How to use AI assistance effectively
- [Italian Stopwords](resources/italian-stopwords.csv) — For text analysis

### External Resources

**Books (free online):**
- [R for Data Science (2e)](https://r4ds.hadley.nz/)
- [Text Mining with R](https://www.tidytextmining.com/)

**Cheatsheets:**
- [Posit Cheatsheets](https://posit.co/resources/cheatsheets/) — dplyr, ggplot2, tidyr, and more

**Practice:**
- [Posit Cloud Primers](https://posit.cloud/learn/primers)

## License

Course materials are licensed under [Creative Commons Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/).

Dataset used under TikTok Research API Terms of Service for academic research purposes.

## Contact

For questions about the course, contact [Fabio Giglietto](mailto:fabio.giglietto@uniurb.it).
