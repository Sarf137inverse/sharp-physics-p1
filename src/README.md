# Sharp Physics 1st Paper
⚠️ README under construction

BDFL

## Project Structure

```
main.tex                        — Master file, stitches all chapters
preamble.tex                    — All packages and font setup (touch only with BDFL approval)
manuscripts/
    ch08-periodic-motion/
        main.tex                — Chapter content
        assets/                 — Chapter-specific assets and figures
        notes.md                — Contributor notes for this chapter
Fonts/
	English/
		SourceSerif4-Variable.ttf
    Bangla/
        NotoSerifBengali-Variable.ttf
```

## Building

**Compiler: LuaLaTeX — required. Do not use pdfLaTeX or XeLaTeX.**

### Overleaf
1. Open the project
2. Menu → Compiler → select **LuaLaTeX**
3. Hit Recompile

### Local
```bash
lualatex main.tex
```

## Language

- Bengali is the main language. Write Bengali text directly. There's no wrapper commands needed.
- Wrap English terms with `\textenglish{...}` when they appear inline in Bengali text. Sarf hates wrapping, we'll resolve this shit soon.
- You love math in latex, don't you?

## Fonts

- Bengali: Noto Serif Bengali (variable font, weight axis 300–900)
- English: FreeSerif
- Font files live in `Fonts/`
- **Font choices are provisional.** Final typography requires expert Bengali typography review before publication. This shit requires a lot of research, we'll do it.

## Contributing

Read `CONTRIBUTING.md` before making any changes.
