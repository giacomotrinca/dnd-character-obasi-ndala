# D&D Character — Obasi N'Dala

A printable **D&D 5th Edition character sheet** for **Obasi N'Dala**, a
level 5 **Variant Human Wizard of the Order of Scribes** (Chaotic Good),
built with the excellent **[`dndbook` LaTeX class](https://github.com/rpgtex/DND-5e-LaTeX-Template)**
from the `rpgtex/DND-5e-LaTeX-Template` repository.

The sheet is laid out as a classic **monster stat block** (`DndMonster`)
so the whole character fits on a single, clean page, with equipment,
spells, magic items, and background details following in later chapters.

## Available languages

| Language | Folder | Source | PDF |
|----------|--------|--------|-----|
| Italian  | `it/`  | `it/obasindala.tex` | `it/obasindala.pdf` |
| English  | `en/`  | `en/obasindala.tex` | `en/obasindala.pdf` |

Both versions share the portrait in `assets/ObasiNdala.jpeg`.

## Repository layout

```
.
├── README.md
├── compila.sh            # Shared build script (builds one or both languages)
├── .gitignore
├── assets/
│   └── ObasiNdala.jpeg   # Shared portrait used by both sheets
├── it/                   # Italian version
│   ├── compila.sh
│   ├── obasindala.tex
│   └── obasindala.pdf
└── en/                   # English version
    ├── compila.sh
    ├── obasindala.tex
    └── obasindala.pdf
```

## Requirements

- **TeX Live** with the following packages (Arch Linux example):
  - `texlive-bin`, `texlive-core`, `texlive-latexextra`
  - `texlive-langitalian`, `texlive-langenglish`
  - `texlive-fontsextra`, `texlive-science`
- The **`dndbook` class** and its libraries (from
  `rpgtex/DND-5e-LaTeX-Template`). If it lives in the repo root, either
  copy it into your TeX tree or run builds from a directory that can find
  it via `kpsewhich dndbook.cls`.
- `pdflatex` (from `texlive-bin`).
- An `it_IT.UTF-8` locale (used by the build script).

### Installing the `dndbook` template

Clone the template and put it in your user `TEXMFHOME` (`~/texmf` on
Arch Linux):

```bash
git clone https://github.com/rpgtex/DND-5e-LaTeX-Template.git
mkdir -p ~/texmf/tex/latex/dnd
cp -r DND-5e-LaTeX-Template/dnd/* ~/texmf/tex/latex/dnd/
# sanity check
kpsewhich dndbook.cls
```

## Building

Use the shared script at the repository root:

```bash
# Build both languages
./compila.sh all

# Build a single language
./compila.sh it
./compila.sh en

# Or, from inside a language folder
cd it && ./compila.sh
cd en && ./compila.sh
```

> **WSL / DrvFs note:** `pdflatex` crashes with
> `DumpStack.log.tmp: Permission denied` when run directly from a
> `/mnt/c` folder (a known WSL + DrvFs bug). The build script therefore
> compiles in a temporary directory on the native filesystem
> (`/tmp/obasi-build-<lang>`) and copies the resulting PDF back into the
> language folder.

Each command produces `obasindala.pdf` inside the corresponding `it/` or
`en/` folder. The build script runs `pdflatex` three times to resolve the
table of contents and cross-references.

## Character summary

| | |
|---|---|
| **Race** | Variant Human (PHB 2014) |
| **Class** | Wizard — Order of Scribes, 5th level |
| **Alignment** | Chaotic Good |
| **Proficiency bonus** | +3 |
| **AC** | 16 (Mage Armor + Cloak of Protection) |
| **HP** | 30 |
| **INT** | 20 (spell DC 16, attack +8) |
| **Magic items** | Ring of Spell Storing, Pearl of Power, Cloak of Protection, Portable Hole |

## Credits

- Character sheet layout: [`rpgtex/DND-5e-LaTeX-Template`](https://github.com/rpgtex/DND-5e-LaTeX-Template)
  (class `dndbook`).
- Rules, features, and magic item descriptions: D&D 5th Edition
  (2014) / [5e.tools](https://5e.tools).
- Character data and portrait: provided by the player.
