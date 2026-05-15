# Instructor Guide — Assignment 1: Descriptive Statistics

**Assignment file:** `01-descriptive-stats.swift`
**Solution file:** `01-descriptive-stats-solution.swift`
**Estimated student time:** 45–60 minutes
**Difficulty:** Introductory (week 1 or 2 of an intro stats course)

## Learning outcome

After completing this assignment, a student can describe a real dataset using mean, median, standard deviation, and the five-number summary, and can explain when each summary is appropriate. The student should leave the assignment understanding that the mean and median can disagree, and that the disagreement is itself information about the shape of the distribution — not an error to fix.

## Prerequisites

- Comfort with Swift array literals and basic arithmetic
- Familiarity with the `?? 0` pattern for unwrapping optionals (introduced in the first lecture)
- No prior statistics required

## What the assignment does

The student loads a dataset of ten student exam scores, one of which (45.0) is meaningfully lower than the rest. They compute the four descriptive statistics, print them in a readable format, and answer a short reflection question about which summary best represents typical class performance.

The reflection question is the load-bearing part. A student who computes the four numbers but cannot explain why the median is preferable to the mean here has done the mechanical work without the conceptual work.

## Sample student output

```
mean:     81.10
median:   85.50
std dev:  14.27
min:      45.0
q1:       77.5
median:   85.5
q3:       90.25
max:      95.0
iqr:      12.75
```

The reflection answer should identify the 45.0 score as the cause of the mean/median gap and reason that the median is more honest because it is not pulled toward the unusual value.

## Rubric (4-tier)

**Exemplary (90–100%)**
All four statistics correct. Reflection answer explicitly identifies the 45.0 score as the cause of the mean/median gap, explains why median is more robust here, and notes that the gap is itself informative about distribution shape. Bonus credit if the student notes that the choice between mean and median is general, not specific to this dataset.

**Proficient (75–89%)**
All four statistics correct. Reflection answer correctly identifies the median as more representative but does not explain why in terms of the outlier, or explains it but does not generalize.

**Developing (50–74%)**
Most statistics correct (typically three of four). Reflection answer is present but does not engage with the mean/median disagreement, or treats the disagreement as something to fix rather than interpret.

**Unsubmitted / Not yet (below 50%)**
Statistics missing or incorrect, reflection absent, or the student did not engage with the question.

## Common student pitfalls

1. **Forgetting to unwrap the optional.** A student who writes `let mean = scores.mean()` without `?? 0` gets an `Optional(81.1)` in the output and assumes something is broken. Reinforce in the first lecture that Quiver's statistics methods return optionals because an empty array has no mean.

2. **Treating the 45.0 score as an error to remove.** Some students will filter the dataset before computing summaries, "to make the data cleaner." This is the wrong move for a descriptive task — the assignment asks what the summaries look like *with* the unusual value included. Outlier removal is a separate decision covered in assignment 2.

3. **Confusing population and sample standard deviation.** Quiver's `std()` defaults to population standard deviation (`ddof: 0`). A student who has read ahead or who uses a textbook formula by hand may compute sample standard deviation (`ddof: 1`) and get a slightly different value (≈15.04 instead of ≈14.27). Both are correct — they answer different questions. The assignment specifies the default, and sample standard deviation is introduced formally in week 7.

4. **Reflection answer that lists the numbers without interpreting them.** A response of "The mean is 81.1 and the median is 85.5, so the median is bigger" misses the conceptual point. The expected answer engages with *why* the two summaries disagree.

5. **Misreading the quartiles tuple.** Students sometimes confuse the tuple's `min` field (the minimum value of the dataset) with the tuple's first numerical entry. The named-tuple access `q.min`, `q.q1`, `q.median`, `q.q3`, `q.max`, `q.iqr` is the cleanest way to write the print statements.

## Time budget breakdown

- Reading the assignment and dataset: 5 min
- Computing the four statistics: 15 min
- Reflection question: 15–25 min — this is where the real learning happens; budget for it
- Cleanup and submission: 5 min

Students who finish in under 25 minutes have likely skipped the reflection. Read those submissions carefully.

## Problem-set extensions

Three variants for instructors who want to differentiate or extend:

1. **Different dataset, same questions.** Substitute a dataset where the mean is *higher* than the median — for example, a list of household incomes where one entry is well above the rest. Students see the mean pulled in the opposite direction and confirm that the principle is general.

2. **Add a comparison.** Provide a second dataset of the same size with no extreme value, and ask the student to compute both summaries on both datasets. The contrast between "datasets where mean and median agree" and "datasets where they disagree" forces the reflection to be comparative.

3. **Connect to z-scores.** Have students also compute the z-score of the 45.0 entry by hand: `(45.0 - mean) / stdDev`. This previews assignment 2 and gives advanced students a glimpse of how outlier detection formalizes the intuition they just developed.

## What this assignment teaches that the next one builds on

Assignment 2 (outlier detection) addresses the question this assignment leaves open: *how do we identify the 45.0 score as an outlier in a way that generalizes?* Students who finished this assignment thinking "the unusual score is obvious" need to be reminded that obvious-by-eye does not scale to ten thousand rows. The z-score method introduced in assignment 2 formalizes the intuition.

## Notes on grading time

A class of 30 students should grade in roughly 90 minutes total — about 2 minutes per submission for the numerical work plus 1 minute per reflection. Scale linearly with class size. The reflection is where grading time actually goes; the numbers are mechanical to verify against the solution file.

## Related primer sections

For the conceptual treatment of when each summary is appropriate, point students to <doc:Statistics-Primer> sections "Describing the middle" and "Describing the spread." For the broader frame of descriptive vs. inferential, the Overview of the same primer is sufficient context. The cookbook recipe [Describe a Dataset](https://github.com/waynewbishop/quiver-cookbook) (recipe 7) is optional reading for students who want a worked example in a different domain.
