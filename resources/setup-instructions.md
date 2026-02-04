# Setup Instructions

This guide walks you through installing all software needed for the course. Please complete these steps **before Day 1**.

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

## 4. Install Node.js

Node.js is required to run Claude Code.

### Windows

1. Go to [https://nodejs.org/](https://nodejs.org/)
2. Download the **LTS** version (recommended)
3. Run the installer
4. Follow the wizard (default options are fine)
5. Restart your computer

### macOS

**Option A: Direct download**
1. Go to [https://nodejs.org/](https://nodejs.org/)
2. Download the **LTS** version
3. Run the `.pkg` installer

**Option B: Using Homebrew**
```bash
brew install node
```

### Linux (Ubuntu/Debian)

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

### Verify Installation

Open a terminal (or Command Prompt on Windows) and type:
```bash
node --version
```

You should see a version number like `v20.x.x`.

## 5. Install Claude Code

Claude Code is an AI assistant that helps you write and understand R code.

1. Open a terminal (or Command Prompt on Windows)
2. Run:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
3. Wait for installation to complete

### Create an Anthropic Account

1. Go to [https://www.anthropic.com/](https://www.anthropic.com/)
2. Click **Sign Up** or **Get Started**
3. Create an account with your email

### Verify Claude Code Installation

In your terminal, type:
```bash
claude
```

You should see Claude Code start. Follow the prompts to authenticate with your Anthropic account.

## 6. Download Course Materials

1. Go to the course GitHub repository
2. Click the green **Code** button
3. Select **Download ZIP**
4. Extract the ZIP to a folder you can easily find (e.g., `Documents/r-course`)

## Troubleshooting

### "Package not found" errors in R

Try installing packages one at a time:
```r
install.packages("tidyverse")
install.packages("tidytext")
install.packages("scales")
```

### Permission errors installing npm packages

**macOS/Linux:**
```bash
sudo npm install -g @anthropic-ai/claude-code
```

**Windows:** Run Command Prompt as Administrator.

### RStudio doesn't find R

Make sure R is installed before RStudio. Try reinstalling R, then restart RStudio.

### Node.js command not found

Restart your terminal or computer after installing Node.js.

## Backup Option: Posit Cloud

If you have trouble installing software locally, you can use [Posit Cloud](https://posit.cloud/) as a backup. It runs RStudio in your web browser — no installation required.

1. Go to [https://posit.cloud/](https://posit.cloud/)
2. Sign up for a free account
3. Create a **New Project**
4. Upload the course dataset

Note: Claude Code won't work in Posit Cloud, but you can still follow along with the R exercises.

## Need Help?

If you encounter issues, try:
1. Searching the error message online
2. Asking Claude Code for help
3. Contacting the instructor before the course starts

See you on Day 1!
