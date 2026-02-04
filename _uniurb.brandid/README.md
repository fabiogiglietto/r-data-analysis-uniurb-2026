# Uniurb Quarto Slides Template

Template Quarto per presentazioni HTML (reveal.js) seguendo il **Brand Manual** dell'Università degli Studi di Urbino Carlo Bo (Piano di Comunicazione 2024-2026).

## 📁 Struttura del Progetto

```
uniurb-quarto-slides/
├── _quarto.yml                    # Configurazione progetto Quarto
├── _extensions/
│   └── uniurb/
│       ├── _extension.yml         # Configurazione estensione
│       └── uniurb.scss            # Tema SCSS
├── assets/
│   ├── logo-uniurb-color.svg      # Logo a colori (sfondo bianco)
│   ├── logo-uniurb-white.svg      # Logo bianco (sfondi scuri)
│   └── logo-uniurb-blue.svg       # Logo blu (sfondi chiari)
├── R/
│   └── uniurb_theme.R             # Palette colori e tema ggplot2
├── examples/
│   └── example-presentation.qmd   # Presentazione di esempio
└── README.md
```

## 🚀 Installazione

### Prerequisiti

1. **R** (versione 4.0+)
2. **Quarto** (versione 1.3+)
3. **RStudio** (consigliato)

### Pacchetti R necessari

```r
install.packages(c("quarto", "ggplot2", "knitr", "rmarkdown"))
```

### Setup

1. Clona o scarica questo repository
2. Apri la cartella in RStudio come progetto
3. Aggiungi i file del logo nella cartella `assets/`
4. Crea la tua presentazione basandoti sul template

## 📝 Utilizzo

### Creare una nuova presentazione

Crea un file `.qmd` con il seguente header YAML:

```yaml
---
title: "Titolo della Presentazione"
subtitle: "Sottotitolo"
author: "Nome Cognome"
institute: "Nome Dipartimento"
date: today
format:
  revealjs:
    theme: [default, _extensions/uniurb/uniurb.scss]
    logo: assets/logo-uniurb-white.svg
    footer: "Università degli Studi di Urbino Carlo Bo"
---
```

### Renderizzare la presentazione

```bash
quarto render mia-presentazione.qmd
```

Oppure usa il pulsante "Render" in RStudio.

## 🎨 Palette Colori

### Colori Ateneo (Primari)

| Nome | HEX | RGB | Uso |
|------|-----|-----|-----|
| Blu Scuro | `#294973` | 41, 73, 115 | Colore principale |
| Blu Medio | `#49668C` | 73, 102, 140 | Testo secondario |
| Blu Chiaro | `#7289A6` | 114, 137, 166 | Accenti |
| Blu Pallido | `#A4B0BF` | 164, 176, 191 | Bordi, grid |
| Grigio Chiaro | `#F2F2F2` | 242, 242, 242 | Sfondo |
| Oro Primario | `#FAC73C` | 250, 199, 60 | Accenti, highlight |

### Colori Dipartimenti

- **DESP** (Economia): Oro/Giallo
- **DIGIUR** (Giurisprudenza): Blu-Grigio
- **DISB** (Scienze Biomolecolari): Rosso
- **DISCUI** (Comunicazione): Arancione
- **DISPEA** (Scienze Pure): Verde Acqua
- **DISTUM** (Studi Umanistici): Magenta

## 🔤 Tipografia

I font identitari dell'Ateneo sono:

1. **Atkinson Hyperlegible** - Corpo del testo (accessibilità)
2. **Montserrat** - Titoli e intestazioni
3. **DIN 2014** - Contenuti tecnici
4. **Scala Sans** - Alternativa

Fallback: Arial, Helvetica

## 📊 Uso con R e ggplot2

Carica il tema personalizzato:

```r
source("R/uniurb_theme.R")

# Grafico con colori Uniurb
ggplot(data, aes(x, y)) +
  geom_point(color = uniurb_colors$blue_dark) +
  scale_fill_uniurb(type = "mixed") +
  theme_uniurb()
```

## 🖼️ Slide Types

### Title Slide (automatica)
Prima slide, sfondo blu scuro con testo bianco/oro.

### Section Slide
```markdown
# Titolo Sezione {background-color="#294973"}
```

### Content Slide
```markdown
## Titolo Slide

Contenuto normale...
```

### Two Columns
```markdown
::: {.columns}
::: {.column width="50%"}
Colonna sinistra
:::
::: {.column width="50%"}
Colonna destra
:::
:::
```

## ⚠️ Linee Guida Logo

Secondo il Brand Manual:

- ✅ Logo a colori **solo** su sfondo bianco
- ✅ Logo bianco su sfondi scuri/colorati
- ✅ Logo blu su sfondi chiari non bianchi
- ❌ Non modificare proporzioni
- ❌ Non separare sigillo e logotipo
- ❌ Non aggiungere effetti (ombre, gradienti)

## ♿ Accessibilità

Il template segue le linee guida WCAG:

- Contrasto minimo 4.5:1
- Font ad alta leggibilità
- Focus states visibili
- Non dipendenza dal colore

## 📚 Risorse

- [Brand Manual Uniurb](https://www.uniurb.it/brand-identity)
- [Modelli Google Docs/Slides](https://drive.google.com)
- [Documentazione Quarto](https://quarto.org)
- [Reveal.js](https://revealjs.com)

## 📧 Contatti

Per richieste di utilizzo del logo:
- Email: comunicazione@uniurb.it
- Segnalazione eventi: www.uniurb.it/segnalaeventi

## 📄 Licenza

Template creato per uso interno dell'Università degli Studi di Urbino Carlo Bo.
L'utilizzo del logo e dei marchi è soggetto alle normative indicate nel Brand Manual.

---

**Università degli Studi di Urbino Carlo Bo** | 1506 | #Uniurb
