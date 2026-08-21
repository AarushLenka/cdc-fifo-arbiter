Create a cleaned/final Word version of the patent paper. **Do not rewrite the technical substance unnecessarily.** Preserve the invention description, technical claims, numerical values, equations, tables, diagrams, captions, and terminology unless a formatting/numbering/spelling correction is required.

## Main objective

Make the document look like a polished, professionally formatted patent/IDF document and fix the issues identified by the professor.

---

## 1. Title — suggest 2–3 alternatives

The current title is:

**Edge-Fused Physiological-Emotional Monitoring Rover with Risk-Adaptive IoT Transmission and Conversational Escalation**

Please:

- Review the invention and suggest **2–3 stronger, patent-appropriate title alternatives**.
- Prefer titles that clearly emphasize the technical novelty:
  - mobile health-assistance rover,
  - multimodal physiological + emotional sensing,
  - edge-based risk fusion,
  - risk-adaptive IoT transmission,
  - conversational/caregiver escalation.
- Keep the title technically accurate and not unnecessarily broad.
- Select the strongest title for the final document, unless there is a strong reason to retain the current title.
- In the final change report, list all 2–3 suggested titles and clearly state which one was used.

Do not introduce claims that are not supported by the document.

---

## 2. Fix numbering throughout the paper

The professor wants the document to use clean direct numbering.

### Required rule

Remove letter-suffix numbering such as:

- `1a`, `1b`
- `2a`, `2b`
- `3a`, `3b`
- `6a`, `6b`
- etc.

Where these are figure/subfigure labels or section labels, convert them to **direct sequential numbering**:

`1, 2, 3, 4, 5, ...`

Do not keep `a/b` suffixes.

### Important

Inspect the **entire document**, not just the visible examples.

Normalize:

- figure numbering,
- figure captions,
- section/subsection numbering where applicable,
- references to figures inside the text,
- any `Fig. 2a`, `Fig. 3a`, `Fig. 6a`, `Fig. 6b`, `Fig. 7a`, `Fig. 7b`, `Fig. 8a`, `Fig. 8b`, `Fig. 9a`, `Fig. 9b`, `Fig. 10a`, `Fig. 10b`, etc.

If two old subfigures become two independent figures, assign them consecutive numbers and update every in-text reference consistently.

For example:

- `Fig. 1` → `Fig. 1`
- `Fig. 2a` → `Fig. 2`
- `Fig. 2b` → `Fig. 3`
- old `Fig. 3a` → next available number
- and so on.

Do **not** blindly replace text. Build a complete old-number → new-number mapping first and apply it consistently.

Tables should also have clean sequential numbering (`Table 1`, `Table 2`, etc.) where applicable.

---

## 3. Fix variable names in tables

This is important.

The document already defines variables in the normalized-input table in a mathematical style, e.g.:

- `x_HR`
- `x_SpO₂`
- `x_T`
- `x_ECG`
- `x_E`
- `x_S`

The later **Weighted Fusion** table currently has variable names rendered as text such as:

- `(x_{\mathrm{HR}})`
- `(x_{\mathrm{SpO_2}})`
- `(x_T)`
- `(x_{\mathrm{ECG}})`
- `(x_E)`
- `(x_S)`

These need to be formatted properly in the Word table.

### Required appearance

Use proper mathematical formatting:

- italic `x`
- proper subscript
- correct capitalization
- proper chemical/mathematical notation for `SpO₂`
- no raw LaTeX syntax
- no literal backslashes
- no parentheses unless they are actually mathematically required.

So the table should visually show:

- *x* with subscript **HR**
- *x* with subscript **SpO₂**
- *x* with subscript **T**
- *x* with subscript **ECG**
- *x* with subscript **E**
- *x* with subscript **S**

Use the **same mathematical style consistently throughout the document**.

Also check the weight variables:

- `w_HR`
- `w_SpO₂`
- `w_T`
- `w_ECG`
- `w_E`
- `w_S`

These should also be proper mathematical subscripts, not raw LaTeX/plain text.

---

## 4. Convert equations to proper Word mathematical equations

The weighted fusion equation and any other mathematical expressions currently appearing as raw text/LaTeX/plain text must be converted into proper editable Word equation objects.

### Key equation

The document contains the weighted fusion equation:

`R = clip[0,1](0.20xHR + 0.20xSpO2 + 0.10xT + 0.20xECG + 0.15xE + 0.15xS)`

It should appear as a professionally typeset mathematical equation with:

- `R`
- proper `clip` notation
- proper subscript formatting
- proper multiplication/term spacing
- `SpO₂` formatting
- no raw LaTeX
- no escaped underscores
- no broken Unicode formatting.

The equivalent generalized equation using the weights should also be properly typeset:

`R = clip_[0,1](w_HR x_HR + w_SpO2 x_SpO2 + w_T x_T + w_ECG x_ECG + w_E x_E + w_S x_S)`

and the example weights should be formatted mathematically.

### Implementation requirement

Use **editable Word equation objects (OMML)** or a genuine MathType-compatible equation representation available in the environment.

Do **not** merely change the font or leave LaTeX source in the document.

If true MathType insertion is technically unavailable, use native Word OMML equations as the closest fully editable professional mathematical representation and document that in the change report.

After conversion, inspect the resulting DOCX to ensure the equations render correctly.

---

## 5. Check all diagrams / figures

Inspect every figure/diagram/image in the document.

For each figure:

- check whether it is present and correctly positioned,
- check whether it is cropped,
- check whether it is stretched/distorted,
- check readability,
- check that the caption matches the figure,
- check figure numbering,
- check references to the figure in the surrounding text,
- check that no figure is accidentally duplicated,
- check that no figure is missing,
- check that figures do not overlap text,
- check that figures stay within the page margins,
- check consistent sizing/alignment.

Do not redraw or alter the technical meaning of diagrams.

If a spelling/label error is clearly visible inside a diagram and can be safely corrected without changing the technical meaning, fix it if practical. Otherwise mention it in the final report rather than inventing a correction.

---

## 6. Check spelling and terminology

Perform a full proofreading pass over the entire document.

Check:

- spelling mistakes,
- obvious typographical errors,
- capitalization inconsistencies,
- inconsistent terminology,
- spacing errors,
- duplicated words,
- malformed symbols,
- broken subscripts/superscripts,
- inconsistent use of `SpO₂`, `ECG`, `IoT`, `AI`, `ESP32`, `ESP8266`, `MAX30102`, `AD8232`, `DS18B20`, `DHT11`, `Blynk`, `DeepFace`, etc.

Do not change technical terminology merely for stylistic preference.

Correct obvious errors such as the incomplete heading currently resembling:

`8.1 . Fusion-Triggered Transmission-Mode Switching: Experimental Demonstratio`

if the intended wording is clearly supported by the surrounding text. It should read professionally, e.g. `Demonstration`.

Also check the document for any other truncated headings or accidental missing characters.

---

## 7. Alignment and formatting

Perform a complete formatting/alignment pass.

Check and standardize:

- section headings,
- subsection headings,
- paragraph alignment,
- table alignment,
- table column widths,
- cell vertical alignment,
- figure alignment,
- figure captions,
- equation alignment,
- spacing before/after headings,
- spacing around tables and figures,
- page margins,
- line spacing,
- indentation,
- header/footer consistency,
- page breaks,
- orphaned headings,
- awkward blank spaces,
- text overflowing outside margins.

Tables should have:

- consistent column alignment,
- readable column widths,
- proper row spacing,
- consistent font,
- consistent mathematical formatting,
- no unnecessary blank rows,
- no broken table borders.

Do not make the document visually over-designed. Keep it suitable for a formal patent/IDF submission.

---

## 8. Headings and hierarchy

Make the heading hierarchy consistent.

The document contains sections such as:

1. Title of the invention  
2. Field / Area of invention  
3. Prior Patents and Publications from literature  
4. Summary and background of the invention  
5. Objective(s) of Invention  
6. Working principle of the invention  
7. Description of the invention in detail  
8. Experimental validation results  
9. What aspect(s) of the invention need(s) protection?  
10. Technology readiness level

Ensure these headings are consistently styled and numbered.

For subsections such as:

- Hardware Components
- Data Acquisition and Edge Processing
- Edge Fusion Mechanism
- Network Transmission and Remote Computational Architecture
- Rover Mobility and IoT Control
- Psychological State Assessment and Conversational Chatbot Interface
- Advantages and Novelty

use a consistent heading hierarchy.

Do not unnecessarily rewrite the headings.

---

## 9. Preserve technical content

This is a formatting/editing task, not a technical rewrite.

Preserve:

- all technical descriptions,
- numerical thresholds,
- equations,
- weights,
- experimental values,
- sensor names,
- hardware specifications,
- prior-art entries,
- protection aspects,
- TRL information,
- figure content,
- table content.

Do not invent experimental results, patents, sensors, algorithms, or claims.

Do not remove technical content simply because it is repetitive unless it is clearly a duplicate created by formatting/editing.

---

## 10. Important consistency checks

Before finishing, specifically verify:

### Variables

The same notation is used everywhere:

`x_HR`, `x_SpO₂`, `x_T`, `x_ECG`, `x_E`, `x_S`

and:

`w_HR`, `w_SpO₂`, `w_T`, `w_ECG`, `w_E`, `w_S`

### Risk score

Use:

`R`

consistently, with proper mathematical formatting where appropriate.

### States

Use consistently:

- Low
- Elevated
- Critical

with the stated hysteresis thresholds:

- Low → Elevated: `R ≥ 0.40`
- Elevated → Low: `R ≤ 0.30`
- Elevated → Critical: `R ≥ 0.70`
- Critical → Elevated: `R ≤ 0.60`

Do not alter these values.

### Equation weights

Verify that:

- `w_HR = 0.20`
- `w_SpO₂ = 0.20`
- `w_T = 0.10`
- `w_ECG = 0.20`
- `w_E = 0.15`
- `w_S = 0.15`

and that they sum to 1.

---

## 11. Final quality-control pass

After making the changes:

1. Save the edited document as a new file, **do not overwrite the original**.
2. Use a clear filename such as:
   `VIT_IPR-2_Patent_Final_Formatted.docx`
3. Re-open/inspect the generated DOCX.
4. Check the actual rendered pages if possible.
5. Verify that equations, tables, figures, captions, and headings render correctly.
6. Search the final document for leftover raw LaTeX patterns such as:
   - `\mathrm`
   - `\_`
   - `\ge`
   - `\le`
   - `\clip`
   - `{...}` used as equation markup
7. Search for leftover figure labels ending in `a` or `b` where those suffixes were supposed to be removed.
8. Search for obvious numbering inconsistencies.
9. Verify no content was accidentally deleted.

---

## 12. Final change report

After editing, provide a concise report containing:

### Title
- 2–3 suggested title options
- which title was selected

### Numbering
- old → new figure/section numbering mapping

### Equation formatting
- which equations were converted to editable Word equations
- whether OMML or MathType was used

### Tables
- variable notation fixes
- alignment/formatting fixes

### Figures/diagrams
- figures checked
- any issues found
- any issues that could not safely be fixed

### Proofreading
- spelling/typographical corrections made

### Final validation
- confirm the document opens successfully
- confirm no raw LaTeX remains
- confirm the final DOCX was saved separately

---

## Hard constraints

- **Do not overwrite the original DOCX.**
- **Do not remove technical content.**
- **Do not invent facts.**
- **Do not change numerical values or thresholds.**
- **Do not leave raw LaTeX in tables or equations.**
- **Do not leave `1a/1b`, `2a/2b`, etc. where direct sequential numbering is required.**
- **Do not blindly renumber without updating in-text references.**
- **Do not distort or crop figures.**
- **Do not use screenshots of equations as a substitute for editable equations.**
- **Keep the final document professional and patent-submission appropriate.**

Start by inspecting the complete DOCX structure, tables, embedded figures, captions, headings, and equations. Then make the changes systematically and validate the final output.

