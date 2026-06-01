# Contributing to Sharp Physics

Read [PHILOSOPHY.md](PHILOSOPHY.md) before anything else. Everything here assumes you have.

---

## Governance

This project follows a BDFL model. All merges go through the project lead.

- Small changes, fixes, content additions → open a PR directly
- New chapters, structural changes, anything big → open an Issue first, discuss, then PR
- `preamble.tex`, `main.tex`, `build.sh`, `Dockerfile` and anything in `src/` outside `manuscripts/` → Issue always, no exceptions

---

## File Structure

Work lives in `src/manuscripts/`. One folder per chapter.

```
src/manuscripts/chXX-name/
    main.tex        — chapter content
    assets/         — figures and assets for this chapter
    notes.md        — your notes, known issues, what the next contributor needs to know
```

Do not put files anywhere else without discussion.

---

## Writing Rules

Read `PHILOSOPHY.md`. Then write accordingly.

The standard: every word earns its place. Write for recall, not coverage. If a sentence doesn't help the student retrieve the concept under exam pressure, cut it.

Definitions and derivations are written from first principles. Not copied. Not paraphrased from the board textbook. Written from reason.

**Language**
- Bengali is the primary language. Write Bengali directly.
- Wrap inline English terms with `\textenglish{...}`
- Example: `পর্যাবৃত্তি \textenglish{(Periodicity)} বলে।`

**Math**
- Inline math: `$a = -\omega^2 x$`
- Display math: `\begin{equation} ... \end{equation}`
- Use the `physics` package for derivatives and vectors

**LaTeX**
- Write clean, readable LaTeX. Respect the markup.
- Consistent indentation. One sentence per line in source.
- No hacks. If you need something that requires a hack, open an Issue.

**Headings**
- `\chapter{}` — chapter title only
- `\section{}` — major sections
- `\subsection{}` — subsections
- Do not go deeper without discussion

---

## Technical Pitfalls

**Font loading**
Font files are in `Fonts/`. Paths are declared in `preamble.tex` with explicit `Path=` — do not move font files.

**Variable fonts**
Require explicit `RawFeature={+wght=N}` for each weight. Without it LaTeX substitutes regular weight silently.

**Filenames**
Commas in font filenames break LaTeX's option parser. Rename files before use — no commas.

**`\include` and aux files**
`build.sh` creates the required aux subdirectories automatically. If you add a new chapter, add its `mkdir -p` line to `build.sh`.

**Compiler errors**
Check `src/build/main.log` for the full log. The terminal output is filtered to errors and warnings only.