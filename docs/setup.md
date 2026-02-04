---
layout: default
title: Setup
nav_order: 3
---

# Setup Instructions

Please complete these steps **before Day 1**.

---

## 1. Install R

R is the programming language we'll use for data analysis.

### Windows

1. Go to [https://cran.r-project.org/](https://cran.r-project.org/)
2. Click **Download R for Windows**
3. Click **base**
4. Click **Download R-4.x.x for Windows** (latest version)
5. Run the downloaded `.exe` file
6. Follow the installation wizard (default options are fine)

### macOS

1. Go to [https://cran.r-project.org/](https://cran.r-project.org/)
2. Click **Download R for macOS**
3. Download the `.pkg` file for your Mac:
   - Apple Silicon (M1/M2/M3): `R-4.x.x-arm64.pkg`
   - Intel Mac: `R-4.x.x-x86_64.pkg`
4. Open the downloaded file and follow the installer

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install r-base
```

---

## 2. Install RStudio

RStudio is the interface we'll use to write and run R code.

1. Go to [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/)
2. Scroll down to **All Installers**
3. Download the version for your operating system
4. Install:
   - **Windows**: Run the `.exe` file
   - **macOS**: Open the `.dmg` and drag RStudio to Applications
   - **Linux**: Install the `.deb` or `.rpm` package

### Verify Installation

1. Open RStudio
2. In the Console pane (bottom left), type:
   ```r
   1 + 1
   ```
3. Press Enter — you should see `[1] 2`

---

## 3. Install R Packages

Packages extend R's functionality. We need a few for this course.

1. Open RStudio
2. In the Console, type:
   ```r
   install.packages(c("tidyverse", "tidytext", "scales"))
   ```
3. Press Enter
4. Wait for installation to complete (this may take a few minutes)
5. You may see messages asking to select a CRAN mirror — choose one close to you

### Verify Package Installation

```r
library(tidyverse)
```

You should see a message listing the packages loaded. If you see an error, try reinstalling.

---

## 4. Install Claude Code

Claude Code is an AI assistant that helps you write and understand R code.

### macOS / Linux

Open a terminal and run:
```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### Windows

Open PowerShell and run:
```powershell
irm https://claude.ai/install.ps1 | iex
```

Alternatively, you can use Git Bash or WSL and run the macOS/Linux command above.

### Activate Your Guest Pass

You will receive a **guest pass by email** from the instructor. This gives you **one free week of Claude Code** — no subscription or payment required.

1. Check your email for the guest pass invitation from Anthropic
2. Click the link to activate your pass
3. Follow the prompts to create an Anthropic account (if you don't have one)

### Verify Claude Code Installation

In your terminal, type:
```bash
claude
```

You should see Claude Code start. Follow the prompts to sign in with your Anthropic account (the one you used to activate the guest pass).

---

## 5. Download Course Materials

1. Go to the [course GitHub repository](https://github.com/fabio-giglietto/r-data-analysis-uniurb-2026)
2. Click the green **Code** button
3. Select **Download ZIP**
4. Extract the ZIP to a folder you can easily find (e.g., `Documents/r-course`)

---

## Troubleshooting

### "Package not found" errors in R

Try installing packages one at a time:
```r
install.packages("tidyverse")
install.packages("tidytext")
install.packages("scales")
```

### Claude Code installation fails

Try running the installer again. On Windows, make sure you're using PowerShell (not Command Prompt). On macOS/Linux, you may need to restart your terminal after installation.

### RStudio doesn't find R

Make sure R is installed before RStudio. Try reinstalling R, then restart RStudio.

---

## Backup Option: Posit Cloud

If you have trouble installing software locally, you can use [Posit Cloud](https://posit.cloud/) as a backup. It runs RStudio in your web browser — no installation required.

1. Go to [https://posit.cloud/](https://posit.cloud/)
2. Sign up for a free account
3. Create a **New Project**
4. Upload the course dataset

Note: Claude Code won't work in Posit Cloud, but you can still follow along with the R exercises.

---

## Need Help?

If you encounter issues, try:
1. Searching the error message online
2. Asking Claude Code for help
3. Contacting the [instructor](mailto:fabio.giglietto@uniurb.it) before the course starts

See you on Day 1!
