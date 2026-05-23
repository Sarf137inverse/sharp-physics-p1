⚠️ CONTRIBUTING.md under construction
# Contributing to Sharp Physics 1st Paper

## Governance

This project follows a BDFL structure. All final decisions go through the project lead, SARFARAAAAAAAAAZZ!. There lived a certain man...
Seniors review and draft changes. Contributors propose via GitHub issues.

---

## Compiler

**LuaLaTeX only.** Not pdfLaTeX. Not XeLaTeX.

---

## File Structure

- One folder per chapter under `chapters/`
- Each chapter folder contains:
  - `main.tex` — chapter content
  - `figures/` — figures used in this chapter
  - `notes.md` — your notes, known issues, source references
- Do not dump files in the project root

---

## Writing Content

### Bengali and English
- Write Bengali directly — no wrapper needed
- Wrap inline English with `\textenglish{...}`
- Example: `পর্যাবৃত্তি \textenglish{(Periodicity)} বলে।`

### Math
- Inline math: `$a = -\omega^2 x$`
- Display math: `\begin{equation} ... \end{equation}`
- Use the `physics` and other fancy package for derivatives, vectors, graphs, etc. aani ma shons too

### Structure
- `\chapter{}` — chapter title
- `\section{}` — major section
- `\subsection{}` — subsection
- Do not go deeper than `\subsubsection{}` without discussion

---

## preamble.tex

**Do not edit preamble.tex without BDFL approval.**

If you need a new package or custom command:
1. Open a GitHub issue describing what you need and why
2. A senior member will draft it
3. BDFL approves and merges

This protects everyone from one contributor breaking another's chapter.

---

## Fonts

Font files live in `Fonts/`. Do not move them.
Do not add new fonts without approval.
Font choices are provisional — final typography will be reviewed by an expert before publication. The expert surely is our dear BDFL.

### Available Bengali font weights
The Bengali font (Noto Serif Bengali Variable) supports weights 300–900.
Custom weight shortcuts can be added to `preamble.tex` when needed — propose via issue.

---

## Known Pitfalls (learned the hard way)

### LuaLaTeX font loading
- Font files referenced in `preamble.tex` must either be in the project root OR use `Path=` in the `\newfontfamily` declaration
- Example: `Path=Fonts/Bangla/` in the font options
- Without `Path=`, LuaLaTeX cannot resolve fonts in subdirectories
- Do NOT use `\directlua{luaotfload.add_location(...)}` — it runs before the loader initializes and does nothing

### Variable fonts
- Variable fonts (`.ttf` with weight/width axes) require explicit `RawFeature={+wght=N}` for each weight variant
- Bold headings require `BoldFeatures={RawFeature={+wght=700}}` — without it LaTeX substitutes the regular weight and throws a warning

### Compiler errors
- "Illegal unit of measurement" spam — almost always caused by a font not loading. Fix the font error first, the rest disappears.
- "Font shape undefined" warnings — usually means bold/italic variant not declared. Warnings only, PDF still compiles.

### Filenames
- Commas in font filenames (e.g. `NotoSerifBengali-VariableFont_wdth,wght.ttf`) break LaTeX's option parser
- Rename such files before uploading — remove the comma

---

## Chapter notes.md format

Each chapter should have a `notes.md` with:
- Source(s) used
- What's complete vs placeholder
- Known content issues
- Anything the next contributor needs to know