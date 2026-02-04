---
layout: default
title: Claude Code Tips
nav_order: 4
---

# Tips for Using Claude Code Effectively

Claude Code is an AI assistant that can help you learn R faster. Here's how to get the most out of it.

---

## Using Claude Code in RStudio

The easiest way to use Claude Code is directly inside RStudio using the **Terminal** tab. This keeps everything in one place while you work on your R scripts.

### Finding the Terminal Tab

RStudio has multiple tabs in the bottom-left pane:

| Tab | Purpose |
|-----|---------|
| **Console** | Where you run R code (you're probably familiar with this) |
| **Terminal** | A command-line shell for running system commands like Claude Code |

Look for the **Terminal** tab next to the Console tab. If you don't see it:
1. Go to **Tools** → **Terminal** → **New Terminal**
2. Or use the keyboard shortcut: **Alt+Shift+T** (Windows/Linux) or **Option+Shift+T** (macOS)

### Starting Claude Code in the Terminal Tab

1. Click on the **Terminal** tab in RStudio
2. Make sure you're in your project folder (RStudio usually does this automatically)
3. Type `claude` and press **Enter**

```bash
claude
```

You should see Claude Code start up and display a welcome message.

### Your Workflow: Console + Terminal Side by Side

A productive workflow looks like this:

| You want to... | Use this tab |
|----------------|--------------|
| Run R code | **Console** |
| Ask Claude Code for help | **Terminal** |
| Edit your script | **Source** (top-left pane) |

**Tip:** You can resize the panes by dragging the borders between them.

### Copying Code Between Tabs

When Claude Code gives you R code to try:

1. **Select the code** in the Terminal (click and drag, or triple-click to select a line)
2. **Copy it**: Ctrl+C (Windows/Linux) or Cmd+C (macOS)
3. **Click in the Console** tab
4. **Paste it**: Ctrl+V (Windows/Linux) or Cmd+V (macOS)
5. **Press Enter** to run

Or paste it into your script file to save it.

### Keeping Claude Code Running

You can keep Claude Code running in the Terminal while you work in the Console. Switch between tabs as needed:

- Click on **Terminal** tab → ask Claude Code a question
- Click on **Console** tab → run your R code
- Click on **Terminal** tab → ask a follow-up question

Claude Code remembers your conversation, so you can refer back to earlier questions.

### Stopping Claude Code

When you're done, type `/exit` or press **Ctrl+C** twice in the Terminal tab.

---

## Alternative: Using an External Terminal

If you prefer, you can run Claude Code in a separate terminal window:

**Windows:** Open Command Prompt or PowerShell

**macOS:** Open Terminal (Applications → Utilities → Terminal)

**Linux:** Open your terminal application

Navigate to your project folder and type `claude`:
```bash
cd /path/to/your/project
claude
```

---

## Basic Interaction

Just type your question or request in natural language. Claude Code understands context and can see files in your current directory (your R scripts, data files, etc.).

---

## Effective Prompts for Learning R

### Explain Code

When you encounter code you don't understand:

```
What does this code do?

corona |>
  filter(view_count > 100000) |>
  group_by(create_date) |>
  summarize(n = n())
```

### Explain Errors

When you get an error message:

```
I got this error when running my code:

Error in filter(., view_count > 100000) :
  object 'view_count' not found

My code is:
corona |> filter(view_count > 100000)

What's wrong?
```

### Ask for Examples

```
Show me 3 different ways to create a bar chart in ggplot2
```

```
Give me an example of using case_when() to create categories
```

### Request Step-by-Step Explanations

```
Explain step by step how to:
1. Import a CSV file
2. Filter rows
3. Calculate the mean of a column
```

### Ask "Why"

```
Why do we use |> instead of writing nested functions?
```

```
Why does ggplot2 use + instead of |> to add layers?
```

---

## Prompts for Specific Tasks

### Data Import

```
Help me import the file fabrizio_corona_tiktok_jan2026.csv
and show me the first few rows
```

### Data Wrangling

```
I have a dataset called 'corona' with columns view_count and like_count.
Help me create a new column called engagement_rate that is
(like_count / view_count)
```

### Visualization

```
Create a line plot showing the number of videos per day
using the corona dataset. The date column is called create_date.
```

### Text Analysis

```
The hashtags column contains comma-separated hashtags like
"corona,italy,news". Help me split this into separate rows
and count the most common hashtags.
```

---

## Best Practices

### 1. Be Specific

**Vague:** "Help me with my data"

**Specific:** "Help me filter the corona dataset to show only videos with more than 1 million views"

### 2. Provide Context

**No context:** "Why doesn't this work?"

**With context:**
```
I'm trying to create a bar chart but I get an error.

My code:
ggplot(corona, aes(x = duration_category)) +
  geom_bar()

Error:
object 'duration_category' not found

I haven't created duration_category yet. How do I create it?
```

### 3. Share Your Data Structure

```
My dataset 'corona' has these columns:
- video_id (character)
- create_date (date)
- view_count (numeric)
- like_count (numeric)
- description (character)

How do I find the day with the most total views?
```

### 4. Ask for Alternatives

```
Is there a simpler way to write this code?

corona %>%
  filter(view_count > 100000) %>%
  select(author_name, view_count) %>%
  arrange(desc(view_count)) %>%
  head(10)
```

### 5. Request Comments

```
Add comments to this code explaining what each line does:

corona |>
  group_by(create_date) |>
  summarize(
    n_videos = n(),
    avg_views = mean(view_count)
  ) |>
  ggplot(aes(x = create_date, y = n_videos)) +
  geom_line()
```

---

## Learning vs. Copying

Claude Code is most valuable as a **learning tool**, not just a code generator.

### Good Learning Approach

1. **Try first**: Attempt the exercise yourself
2. **Get stuck**: Identify what you don't understand
3. **Ask Claude Code**: Get an explanation, not just code
4. **Understand**: Make sure you can explain the solution
5. **Practice**: Try a similar problem without help

### Questions That Help You Learn

- "Why does this approach work?"
- "What would happen if I changed X to Y?"
- "What are common mistakes people make with this function?"
- "Can you explain this concept using a simple example?"

---

## Quick Reference

| Task | Example Prompt |
|------|----------------|
| Explain code | "What does this code do? [paste code]" |
| Fix error | "I got this error: [paste error]. My code is: [paste code]" |
| Write code | "Write code to [specific task] using the [dataset name] data" |
| Learn concept | "Explain [concept] with a simple example" |
| Compare approaches | "What's the difference between [A] and [B]?" |
| Improve code | "How can I make this code cleaner? [paste code]" |

---

## When Claude Code Isn't Sure

Sometimes Claude Code might:
- Give outdated information
- Make mistakes with complex code
- Not know about very recent packages

When in doubt:
- Test the code yourself
- Check the official documentation
- Ask the instructor

---

## Remember

- Claude Code is a tool to help you learn, not a replacement for learning
- Always try to understand the code, not just copy it
- The best questions are specific and include context
- Mistakes and errors are learning opportunities
