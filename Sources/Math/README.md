# Statistics Course

A 14-week introductory statistics course built on Quiver, mapping textbook concepts onto runnable Swift code.

## What this course teaches

The seven assignments in this directory cover the conceptual arc most introductory statistics courses follow: describe what we have, identify the unusual, see the shape of a distribution, then move from describing samples to inferring properties of populations. The first three assignments cover descriptive statistics. The next two cover inferential statistics through resampling. The last two cover the bridge into modeling — fitting a line to data, and preparing data for the supervised learning courses that come later.

Each assignment is small enough to fit in a single 45–60 minute student work session and large enough to require real engagement with the underlying math. None of them ask students to memorize formulas or write boilerplate; the focus is on interpretation — *what does this number mean for the data we just collected?*

## What students should know going in

- **One semester of college algebra.** Comfort with summation notation, basic algebraic manipulation, and the idea of a function.
- **No prior programming experience required.** The first lecture introduces Swift array literals, basic method calls, and the optional-unwrapping pattern (`?? 0`). Students with prior programming experience will adapt in the first lecture; students with none will need the lab session in week one to get oriented.
- **No prior statistics required.** Each assignment introduces the concept it asks students to compute, and the textbook is the conceptual reference for material the assignments touch on but do not develop in depth.

## What students should be able to do at the end

- Compute and interpret the four core descriptive statistics (mean, median, standard deviation, quartiles) on a real dataset, and explain when each is the appropriate summary
- Identify outliers using the z-score method and explain why outlier removal is a decision, not an automatic step
- Construct a histogram and read distribution shape from it (symmetric, skewed, bimodal, uniform)
- Build a 95% confidence interval for a population parameter using the bootstrap, and explain what the interval does and does not claim
- Fit a linear regression model, evaluate it with R², MSE, and RMSE, and explain when a linear fit is appropriate
- Split a dataset into training and test sets while preserving class proportions, and explain why stratification matters

## How the seven assignments build on each other

| # | Assignment | Builds on | Sets up |
|---|---|---|---|
| 1 | Descriptive Statistics | — | Vocabulary for every later assignment |
| 2 | Outlier Detection | Mean and standard deviation from #1 | Understanding why summaries can mislead |
| 3 | Histogram Shape | All of #1 and #2 | Visual intuition for distribution shape, which the bootstrap will quantify |
| 4 | Bootstrap Mean | Mean from #1 | The resampling primitive used in #5 and beyond |
| 5 | Bootstrap Median | Bootstrap from #4, median from #1 | The recognition that some statistics resist parametric methods |
| 6 | Linear Regression | Variance and correlation intuition from #1–#3 | The fit/predict pattern that runs through every Quiver model |
| 7 | Stratified Split | Linear regression from #6 | The data-preparation step every machine learning course assumes |

## How to use this directory

Each assignment is three files sharing a numeric prefix:

- **`NN-name.swift`** — the student starter. Has a dataset, a problem statement, and TODO comments where students fill in the computation. Open it in the Quiver Notebook (paste the contents into the editor) or in Xcode 26+ (run with Cmd+R).
- **`NN-name-solution.swift`** — the reference solution. Identical structure, with TODOs filled in and inline `// expected: X` comments showing verified results.
- **`NN-name-guide.md`** — the instructor guide. Learning outcome, prerequisites, sample student output, four-tier rubric, common pitfalls, time budget, problem-set extensions, grading notes.

For the week-by-week mapping of these assignments onto a 14-week course alongside the Quiver primers and cookbook recipes, see `syllabus-14-week.md`. For a 30–45 minute first-lecture outline, see `first-lecture-outline.md`.
