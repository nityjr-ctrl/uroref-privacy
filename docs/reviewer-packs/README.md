# UroRef Reviewer Packs

Short, specialty-specific review documents sent to consultant reviewers as PDFs.

One PDF per reviewer. One specialty domain per PDF. Reviewers assess only their
domain, not the whole app.

## Structure

- `packs/` &mdash; one markdown file per specialty domain. These are the source of truth.
- `build.sh` &mdash; renders every pack in `packs/` to a PDF in `out/` using pandoc.
- `out/` &mdash; generated PDFs (gitignored by default; regenerate on demand).

## Workflow

1. Pick the pack for the reviewer's domain.
2. Fill in the **Reviewer details** section at the top (name, date sent, etc.).
3. Paste or attach the relevant in-app clinical content under each listed section.
4. Render to PDF (`./build.sh` or export from a markdown editor).
5. Send the PDF to the reviewer with a short covering note.
6. When the review comes back, update UroRef and record the reviewer’s name
   against the domain in the **Clinical review by domain** page.

## Rendering to PDF

Requires [pandoc](https://pandoc.org/) and a LaTeX engine (e.g. `xelatex` from
TeX Live or MacTeX).

```bash
cd docs/reviewer-packs
./build.sh                              # render every pack
./build.sh 01_upper_tract_endourology   # render a single pack by filename stem
```

Alternative if you don’t have pandoc installed:

- Open the `.md` file in a markdown editor (Typora, Obsidian, VS Code with a
  markdown PDF extension, iA Writer) and export to PDF.
- Or paste into Word/Pages and export to PDF.

## Packs

| # | Pack | Reviewer role shown in app |
|---|------|---------------------------|
| 01 | Upper tract endourology | Consultant Endourologist |
| 02 | Lower tract & bladder outlet endourology | Consultant Endourologist |
| 03 | Andrology — ED & hypogonadism | Consultant Andrologist |
| 04 | Andrology — male infertility | Consultant Andrologist |
| 05 | Andrology — emergency andrology | Consultant Andrologist |
| 06 | Urodynamics & functional urology | Consultant Urologist (Functional) |
| 07 | Uro-oncology — prostate | Consultant Urological Oncologist |
| 08 | Uro-oncology — bladder & upper tract | Consultant Urological Oncologist |
| 09 | Female urology & recurrent UTI | Consultant Urologist (Female & FPMRS) |
| 10 | Paediatric urology | Consultant Paediatric Urologist |

## Attribution rules

- A reviewer’s name is **only** added to the app after they have returned a
  signed-off review for that specific domain.
- Reviewers may choose named, named + institution, or anonymous domain sign-off.
- Attribution can be withdrawn at any time.
