# Quiver Instruction Pack — Statistics

A faculty-facing companion to the [Quiver](https://github.com/waynewbishop/quiver) Swift package, built for an introductory statistics course. The pack ships seven graded assignments, a 14-week syllabus mapping, a first-lecture outline, and a faculty FAQ — everything an instructor needs to drop a Swift-based statistics unit into an existing course without writing the prep work from scratch.

## What this is

A Swift Package that mirrors the structure of the [Quiver Cookbook](https://github.com/waynewbishop/quiver-cookbook). Each assignment is a single `.swift` file paired with a reference solution and an instructor guide. The pack is the "instructor's manual" half of the textbook + manual model — the [Quiver Notebook](https://github.com/waynewbishop/quiver-notebook) is where students run the code, and this repo is what a faculty member uses to teach with it.

## Who this is for

- **Instructors** teaching an introductory statistics course who want a Swift-based computational layer alongside their existing curriculum
- **Teaching assistants** grading assignments, who need rubrics and common-pitfall notes to grade consistently
- **Curriculum coordinators** evaluating Swift as a language for statistical computing in undergraduate courses

The pack does not replace a textbook. It runs alongside one — students learn the concepts from whatever statistics textbook the course already uses, and Quiver becomes the tool they reach for when computation is needed.

## How to use it

1. **Clone the repo:**

   ```bash
   git clone https://github.com/waynewbishop/quiver-instruction-pack.git
   ```

2. **Open in Xcode 26+** for full IDE support — autocomplete, inline errors, and the ability to run any assignment with a click. Quiver resolves automatically as a package dependency on first build.

3. **Or paste assignments into the [Quiver Notebook](https://github.com/waynewbishop/quiver-notebook)** for the student-facing browser editor. Every `.swift` file in this pack is plain top-level Swift — no `#Playground` macros — so it pastes into the Notebook editor and runs without modification. This is the recommended path for student work.

## What's in the pack

```
Sources/Statistics/
├── README.md                     course overview
├── syllabus-14-week.md           week-by-week mapping to primers, recipes, and assignments
├── first-lecture-outline.md      30–45 minute first-lecture outline
├── 01-descriptive-stats          mean, median, standard deviation, quartiles
├── 02-outlier-detection          z-scores and outlier masking
├── 03-histogram-shape            histograms and the shape of a distribution
├── 04-bootstrap-mean             confidence intervals via resampling
├── 05-bootstrap-median           confidence intervals when the distribution is skewed
├── 06-linear-regression          fitting a line, R², MSE, RMSE
└── 07-stratified-split           preserving class proportions for downstream modeling

Docs/
├── faculty-faq.md                questions instructors ask before adopting
└── installation-guide.md         three install paths — Xcode, swift run, the Notebook
```

Each assignment is three files sharing a numeric prefix:

- `NN-name.swift` — the student starter, with TODOs to fill in
- `NN-name-solution.swift` — the reference solution
- `NN-name-guide.md` — the instructor guide (learning outcome, rubric, common pitfalls, time budget, extensions)

## License

This work is licensed under [Creative Commons Attribution-NonCommercial-ShareAlike 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) (CC BY-NC-SA 4.0). Faculty are free to fork, adapt, and add their own materials — slide decks, lecture videos, supplemental readings, course-specific datasets, anything that fits the course. The upstream repo ships Markdown and Swift only as a maintenance commitment, not as a constraint on derivative work.

## Related

- **[Quiver](https://github.com/waynewbishop/quiver)** — the underlying Swift package
- **[Quiver Notebook](https://github.com/waynewbishop/quiver-notebook)** — the browser-based Swift editor for student work
- **[Quiver Cookbook](https://github.com/waynewbishop/quiver-cookbook)** — 59 worked examples spanning vectors, statistics, and machine learning
- **[Swift Algorithms & Data Structures](https://waynewbishop.github.io/swift-algorithms/)** — the companion book

## Roadmap

This is v1 — statistics only. Two future packs will follow once the underlying Quiver APIs stabilize through the 1.2.0 and later releases:

- **v2 — Machine Learning** (target late September 2026): K-Means, K-Nearest Neighbors, Naive Bayes, evaluation metrics
- **v3 — Linear Algebra** (target late January 2027): vectors, matrices, transformations, projections, the geometric foundations

Each pack will land as a new top-level target inside this repo (`Sources/MachineLearning/`, `Sources/LinearAlgebra/`) so existing forks gain the new courses on `git pull` without restructuring.
