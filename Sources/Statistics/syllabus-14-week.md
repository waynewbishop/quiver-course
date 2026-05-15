# 14-Week Syllabus — Introductory Statistics with Quiver

A week-by-week mapping of an introductory statistics course onto Quiver methods, primer sections, cookbook recipes, and Notebook examples. Designed for a 14-week semester with two lectures and one lab session per week. Adjust the week-by-week pacing as needed for shorter or longer terms.

## How to read this table

- **Topic** — the conceptual material covered that week, drawn from the textbook used in the course
- **Quiver methods** — the API surface introduced or reinforced
- **Cookbook recipe** — referenced by number from the [Quiver Cookbook](https://github.com/waynewbishop/quiver-cookbook). Recipes are optional reading; they show the same methods applied in different domains
- **Primer section** — the conceptual treatment in the Quiver DocC primers (Statistics-Primer or Inferential-Statistics-Primer). The primers are not assigned reading on their own — they are reference material students dip into when a concept needs reinforcement
- **Notebook example** — a runnable example file in the [Quiver Notebook](https://github.com/waynewbishop/quiver-notebook) that demonstrates the week's methods
- **Assignment** — the graded assignment from this instruction pack that lands that week, when applicable

| Week | Topic | Quiver methods | Cookbook | Primer section | Notebook | Assignment |
|---|---|---|---|---|---|---|
| 1 | Why descriptive statistics? Center and spread | `mean()`, `median()` | 7 | "Describing the middle" | 05-summary-statistics | — |
| 2 | Standard deviation and variance | `std(ddof:)`, `variance(ddof:)` | 7 | "Describing the spread" | 05-summary-statistics | **Assignment 1** |
| 3 | The five-number summary and quartiles | `quartiles()` | 7 | "The five-number summary" | 08-describe-a-dataset | — |
| 4 | Z-scores and standardization | `outlierMask(threshold:)` | 8 | "The z-score" | 06-find-outliers | **Assignment 2** |
| 5 | Histograms and distribution shape | `histogram(bins:)` | 10 | "Finding the unusual ones" | — | **Assignment 3** |
| 6 | Samples and populations | `Panel`, `panel.head(n:)`, `panel.summary()` | — | "Samples and populations" | 08-describe-a-dataset | — |
| 7 | The sampling distribution and standard error | `mean()`, `std(ddof: 1)` | — | "The sampling distribution of the mean" | — | — |
| 8 | The Central Limit Theorem | `Distributions.normal.pdf`, `cdf` | 55 | "Standard error" | — | — |
| 9 | The bootstrap, part one — confidence intervals for the mean | `resampled(iterations:seed:statistic:)`, `percentileCI(level:)` | 56 | "Resampling" | — | **Assignment 4** |
| 10 | The bootstrap, part two — when the distribution is skewed | `resampled` with `median()` statistic | 57 | "Confidence intervals from resampling" | — | **Assignment 5** |
| 11 | Hypothesis testing and the p-value | `Distributions.normal.cdf` | — | "Hypothesis testing" | — | — |
| 12 | Linear regression and the line of best fit | `LinearRegression.fit(features:targets:)`, `predict(_:)` | 26 | "From summaries to models" (in Inferential Primer) | — | **Assignment 6** |
| 13 | Evaluating a regression — R², MSE, RMSE | `rSquared(actual:)`, `meanSquaredError(actual:)`, `rootMeanSquaredError(actual:)` | 26 | — | — | — |
| 14 | Preparing data for the next course — train/test splits | `Array.stratifiedSplit(labels:testRatio:seed:)` | 32 | — | 10-train-test-split | **Assignment 7** |

## Pacing notes

- **Weeks 1–5 cover descriptive statistics.** Assignments 1, 2, and 3 land in this block. The pace is comfortable — students are simultaneously learning Swift basics and the conceptual material, so the assignments are calibrated to a 45–60 minute work session each.
- **Weeks 6–8 are conceptual transition.** No graded assignment in this window. The textbook covers samples vs. populations, the sampling distribution, and the Central Limit Theorem — material that is essential for the bootstrap to make sense but does not require a new computational primitive students have not already met.
- **Weeks 9–11 cover the bootstrap and hypothesis testing.** Assignments 4 and 5 land here. This is the conceptually densest block; the bootstrap is a powerful but unfamiliar idea, and assignment 5 in particular asks students to recognize when a parametric approach would fail.
- **Weeks 12–14 are the bridge to modeling.** Assignments 6 and 7 land here. By the end of week 14, students have fitted a linear regression model, evaluated it, and prepared a stratified train/test split — the three steps every supervised learning course in the v2 ML pack will assume.

## When to deviate from this pacing

Some courses run faster on the descriptive material because students arrive with stronger backgrounds. In that case, pull assignment 1 forward to week 1 and use the freed week for an extension exercise — recipe 27 (Correlation Matrix) is a good fit, since it bridges descriptive and inferential ideas without being on the critical path.

Other courses run slower because students need more time on the conceptual material before the computation lands. In that case, push assignments 4 and 5 back by a week each, and use the freed weeks for additional bootstrap practice on different datasets — the recipe library provides the variety.

The graded assignments are anchored to the conceptual transitions — week 2 (descriptive), week 4 (z-scores), week 5 (histogram), week 9 (bootstrap mean), week 10 (bootstrap median), week 12 (regression), week 14 (stratified split). Hold those positions even when reordering the surrounding lecture content.
