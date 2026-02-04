# Uniurb Brand Identity: Quarto HTML Slides Template Instructions

## Overview

Create a Quarto-based HTML presentation template that follows the **Università degli Studi di Urbino Carlo Bo** brand identity manual (Piano di Comunicazione 2024-2026).

---

## 1. Color Palette

### Primary University Colors (Ateneo)

```scss
// Main blue palette
$uniurb-blue-dark: #294973;     // Primary - RGB(41, 73, 115)
$uniurb-blue-medium: #49668C;   // RGB(73, 102, 140)
$uniurb-blue-light: #7289A6;    // RGB(114, 137, 166)
$uniurb-blue-pale: #A4B0BF;     // RGB(164, 176, 191)
$uniurb-gray-light: #F2F2F2;    // RGB(242, 242, 242)

// Gold/Yellow accent palette
$uniurb-gold-dark: #7A621D;     // RGB(122, 98, 29)
$uniurb-gold-light: #FADB87;    // RGB(250, 219, 135)
$uniurb-gold-primary: #FAC73C;  // RGB(250, 199, 60)
$uniurb-gold-muted: #7A6F51;    // RGB(122, 111, 81)
$uniurb-gold-medium: #C79F30;   // RGB(199, 159, 48)
```

### Department Color Palettes

Each department has its own distinct color scheme. Include these as optional theme variants:

```scss
// DESP - Economia, Società, Politica (Gold)
$desp-1: #DCB145;  // RGB(220, 177, 69)
$desp-2: #D96704;  // RGB(217, 103, 4)
$desp-3: #D99862;  // RGB(217, 153, 98)
$desp-4: #F2CDAC;  // RGB(242, 205, 172)
$desp-5: #F2F2F2;  // RGB(242, 242, 242)

// DIGIUR - Giurisprudenza (Blue-gray)
$digiur-1: #839BC2;  // RGB(131, 155, 194)
$digiur-2: #768BA6;  // RGB(118, 139, 166)
$digiur-3: #9FADBF;  // RGB(159, 173, 191)
$digiur-4: #C5CED9;  // RGB(197, 206, 217)
$digiur-5: #F2F2F2;  // RGB(242, 242, 242)

// DISB - Scienze Biomolecolari (Red/Coral)
$disb-1: #D92B04;   // RGB(217, 43, 4)
$disb-2: #F24535;   // RGB(242, 69, 53)
$disb-3: #F26F63;   // RGB(242, 111, 99)
$disb-4: #F2A7A0;   // RGB(242, 167, 160)
$disb-5: #F2F2F2;   // RGB(242, 242, 242)

// DISCUI - Scienze della Comunicazione (Orange)
$discui-1: #E06029;  // RGB(224, 96, 41)
$discui-2: #F68B5F;  // RGB(246, 139, 95)
$discui-3: #F56D65;  // RGB(245, 109, 101)
$discui-4: #F2A7A0;  // RGB(242, 167, 160)
$discui-5: #F2F2F2;  // RGB(242, 242, 242)

// DISPEA - Scienze Pure e Applicate (Teal)
$dispea-1: #027368;  // RGB(2, 115, 104)
$dispea-2: #168C80;  // RGB(22, 140, 128)
$dispea-3: #6AA6A0;  // RGB(106, 166, 160)
$dispea-4: #BAD9D3;  // RGB(186, 217, 211)
$dispea-5: #F2F2F2;  // RGB(242, 242, 242)

// DISTUM - Studi Umanistici (Purple/Magenta)
$distum-1: #8C1B59;  // RGB(140, 27, 89)
$distum-2: #A83E7D;  // RGB(168, 62, 125)
$distum-3: #BF7EA2;  // RGB(191, 126, 162)
$distum-4: #D9B0C6;  // RGB(217, 176, 198)
$distum-5: #F2F2F2;  // RGB(242, 242, 242)
```

---

## 2. Typography

### Primary Fonts (in order of preference)

1. **Atkinson Hyperlegible** - Primary font for accessibility
   - Source: https://brailleinstitute.org/freefont
   - Use for: Body text, accessibility-focused content

2. **Montserrat** - Modern sans-serif
   - Source: https://fonts.google.com/specimen/Montserrat
   - Use for: Headings, titles

3. **DIN 2014** - Technical/modern
   - Source: https://fonts.adobe.com/fonts/din-2014
   - Use for: Numbers, technical content

4. **Scala Sans** - Humanist sans-serif
   - Source: https://fonts.adobe.com/fonts/scala-sans
   - Use for: Alternative body text

### Fallback Fonts
- Arial
- Helvetica

### Font Implementation

```css
@import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&family=Montserrat:wght@300;400;500;600;700&display=swap');

:root {
  --font-primary: 'Atkinson Hyperlegible', Arial, Helvetica, sans-serif;
  --font-headings: 'Montserrat', Arial, Helvetica, sans-serif;
}
```

---

## 3. Logo Usage Guidelines

### Rules
- **Color logo**: Use ONLY on white backgrounds
- **Monochrome white logo**: Use on dark/colored backgrounds
- **Monochrome blue logo**: Use on light colored backgrounds
- The seal (sigillo) and logotype MUST always be used together
- Maintain clear space around the logo (minimum: 2x the distance between seal and logotype)

### Logo Placement in Slides
- Title slide: Center or bottom-right
- Content slides: Footer area, small size
- Closing slide: Center

### Don'ts
- Never change the logo colors
- Never add shadows or gradients
- Never distort or rotate the logo
- Never separate the seal from the logotype
- Never change the font of the logotype

---

## 4. Quarto Template Structure

### File Structure

```
uniurb-quarto-slides/
├── _quarto.yml
├── template.qmd
├── _extensions/
│   └── uniurb/
│       ├── _extension.yml
│       └── uniurb.scss
├── assets/
│   ├── logo-uniurb-color.svg
│   ├── logo-uniurb-white.svg
│   ├── logo-uniurb-blue.svg
│   └── fonts/
└── examples/
    └── example-presentation.qmd
```

### _quarto.yml Configuration

```yaml
project:
  type: default

format:
  revealjs:
    theme: [default, _extensions/uniurb/uniurb.scss]
    logo: assets/logo-uniurb-white.svg
    footer: "Università degli Studi di Urbino Carlo Bo"
    slide-number: true
    transition: fade
    background-transition: fade
    highlight-style: github
    code-line-numbers: false
    width: 1920
    height: 1080
    margin: 0.1
```

---

## 5. SCSS Theme File (uniurb.scss)

```scss
/*-- scss:defaults --*/

// Import Google Fonts
@import url('https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&family=Montserrat:wght@300;400;500;600;700&display=swap');

// Primary Colors
$uniurb-blue-dark: #294973;
$uniurb-blue-medium: #49668C;
$uniurb-blue-light: #7289A6;
$uniurb-blue-pale: #A4B0BF;
$uniurb-gray-light: #F2F2F2;
$uniurb-gold-primary: #FAC73C;
$uniurb-gold-dark: #7A621D;

// Reveal.js variables
$body-bg: $uniurb-gray-light;
$body-color: $uniurb-blue-dark;
$link-color: $uniurb-blue-medium;
$link-color-hover: $uniurb-gold-primary;
$selection-bg: $uniurb-gold-primary;
$selection-color: $uniurb-blue-dark;

// Typography
$font-family-sans-serif: 'Atkinson Hyperlegible', Arial, Helvetica, sans-serif;
$presentation-font-size-root: 42px;
$presentation-heading-font: 'Montserrat', Arial, Helvetica, sans-serif;
$presentation-heading-color: $uniurb-blue-dark;
$presentation-h1-font-size: 2.2em;
$presentation-h2-font-size: 1.6em;
$presentation-h3-font-size: 1.3em;

// Code blocks
$code-block-bg: white;
$code-block-border-color: $uniurb-blue-pale;

/*-- scss:rules --*/

// Title slide styling
.reveal .slides section.title-slide {
  background-color: $uniurb-blue-dark;
  color: white;
  
  h1 {
    color: white;
    font-weight: 700;
    text-transform: none;
    letter-spacing: -0.02em;
  }
  
  h2 {
    color: $uniurb-gold-primary;
    font-weight: 400;
  }
  
  .author, .date, .institute {
    color: rgba(255, 255, 255, 0.9);
  }
}

// Section headers (dark blue background)
.reveal .slides section.section-slide {
  background-color: $uniurb-blue-dark;
  color: white;
  
  h2 {
    color: white;
    border-bottom: 4px solid $uniurb-gold-primary;
    padding-bottom: 0.5em;
  }
}

// Standard content slides
.reveal .slides section {
  text-align: left;
  
  h2 {
    border-bottom: 3px solid $uniurb-gold-primary;
    padding-bottom: 0.3em;
    margin-bottom: 0.8em;
  }
}

// Lists
.reveal ul, .reveal ol {
  margin-left: 1em;
  
  li {
    margin-bottom: 0.5em;
    line-height: 1.4;
  }
}

.reveal ul li::marker {
  color: $uniurb-gold-primary;
}

// Blockquotes
.reveal blockquote {
  border-left: 4px solid $uniurb-gold-primary;
  background-color: white;
  padding: 1em 1.5em;
  font-style: italic;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

// Tables
.reveal table {
  border-collapse: collapse;
  
  th {
    background-color: $uniurb-blue-dark;
    color: white;
    padding: 0.7em 1em;
  }
  
  td {
    padding: 0.5em 1em;
    border-bottom: 1px solid $uniurb-blue-pale;
  }
  
  tr:nth-child(even) {
    background-color: rgba($uniurb-blue-pale, 0.3);
  }
}

// Code styling
.reveal pre {
  border-radius: 8px;
  border: 1px solid $uniurb-blue-pale;
  box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.reveal code {
  font-family: 'Fira Code', 'Consolas', monospace;
}

// Footer and slide numbers
.reveal .slide-number {
  color: $uniurb-blue-medium;
  font-family: 'Montserrat', sans-serif;
  font-size: 0.6em;
}

.reveal .footer {
  font-family: 'Montserrat', sans-serif;
  font-size: 0.5em;
  color: $uniurb-blue-medium;
}

// Logo positioning
.reveal .slide-logo {
  max-height: 80px;
}

// Callout boxes
.callout {
  border-radius: 8px;
  border-left-width: 4px;
  
  &.callout-note {
    border-left-color: $uniurb-blue-medium;
  }
  
  &.callout-warning {
    border-left-color: $uniurb-gold-primary;
  }
  
  &.callout-important {
    border-left-color: #D92B04;
  }
  
  &.callout-tip {
    border-left-color: #027368;
  }
}

// Highlight boxes
.highlight-box {
  background-color: white;
  border: 2px solid $uniurb-gold-primary;
  border-radius: 8px;
  padding: 1em;
  margin: 1em 0;
}

// Two-column layout helper
.columns-2 {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2em;
}

// Image styling
.reveal img {
  border-radius: 4px;
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

// Accessibility: Focus states
.reveal a:focus,
.reveal button:focus {
  outline: 3px solid $uniurb-gold-primary;
  outline-offset: 2px;
}

// Print styles
@media print {
  .reveal .slides section {
    background-color: white !important;
  }
}
```

---

## 6. Example Presentation Template

```qmd
---
title: "Titolo della Presentazione"
subtitle: "Sottotitolo opzionale"
author: "Nome Autore"
institute: "Università degli Studi di Urbino Carlo Bo"
date: today
date-format: "D MMMM YYYY"
format:
  revealjs:
    theme: [default, _extensions/uniurb/uniurb.scss]
    logo: assets/logo-uniurb-white.svg
    footer: "Uniurb | Nome Dipartimento"
    slide-number: c/t
    transition: fade
    width: 1920
    height: 1080
---

## Introduzione {.section-slide}

---

## Contenuto Standard

Testo normale con il font **Atkinson Hyperlegible** per massima leggibilità.

- Primo punto dell'elenco
- Secondo punto dell'elenco
- Terzo punto con [link](https://www.uniurb.it)

---

## Due Colonne

::: {.columns}
::: {.column width="50%"}
### Colonna Sinistra

Contenuto della prima colonna con testo e immagini.
:::

::: {.column width="50%"}
### Colonna Destra

Contenuto della seconda colonna.
:::
:::

---

## Codice R

```{r}
#| echo: true
#| eval: false
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "#294973") +
  theme_minimal()
```

---

## Tabella

| Categoria | Valore A | Valore B |
|-----------|----------|----------|
| Alpha     | 100      | 200      |
| Beta      | 150      | 250      |
| Gamma     | 180      | 300      |

---

## Citazione

> "L'università è il luogo dove si impara a imparare."
> 
> — Carlo Bo

---

## Grazie {.section-slide}

**Contatti**

📧 email@uniurb.it  
🌐 www.uniurb.it  
📱 @uniurb
```

---

## 7. Accessibility Requirements

Following WCAG guidelines and the brand manual's inclusive design principles:

1. **Color Contrast**: Ensure minimum 4.5:1 contrast ratio for normal text, 3:1 for large text
2. **Font Size**: Minimum 18px for body text in presentations
3. **Color Independence**: Don't rely solely on color to convey information
4. **Alt Text**: Provide alt text for all images
5. **Link Clarity**: Make links clearly distinguishable
6. **Focus Indicators**: Visible focus states for keyboard navigation

---

## 8. Implementation Notes

### For R Users
- The template works seamlessly with R code chunks
- Use `knitr` and `ggplot2` with Uniurb colors
- Create a custom ggplot theme using the palette

### Department Variants
- Create separate SCSS files for each department
- Example: `uniurb-desp.scss`, `uniurb-disb.scss`, etc.
- Each uses the department's specific color palette

### Logo Files Needed
1. `logo-uniurb-color.svg` - Full color (for white backgrounds)
2. `logo-uniurb-white.svg` - White monochrome (for dark backgrounds)
3. `logo-uniurb-blue.svg` - Blue monochrome (for light backgrounds)

---

## Summary

This template provides:
- ✅ Official Uniurb color palette
- ✅ Approved typography (Atkinson Hyperlegible + Montserrat)
- ✅ Proper logo usage
- ✅ Accessible design (WCAG compliant)
- ✅ Department color variants
- ✅ R/Quarto integration
- ✅ Responsive slide layouts
