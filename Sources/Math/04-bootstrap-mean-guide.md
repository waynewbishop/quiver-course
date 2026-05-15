# Instructor Guide — Assignment 4: Bootstrap Confidence Interval for the Mean

**Assignment file:** `04-bootstrap-mean.swift`
**Solution file:** `04-bootstrap-mean-solution.swift`
**Estimated student time:** 60 minutes
**Difficulty:** Intermediate (week 9)

## Learning outcome

After completing this assignment, a student can construct a 95% confidence interval for a population mean using the bootstrap, can read the interval from the resampled distribution using `percentileCI`, and can articulate the correct frequentist interpretation of the interval — in plain language, without falling into the common "95% probability the true mean lies in this interval" misinterpretation.

The deeper lesson: the bootstrap turns the abstract idea of sampling distribution into something the student computes directly from their own data, in the output pane, with one closure.

## Prerequisites

- Assignments 1–3, especially the recognition that summaries are estimates, not certainties
- Conceptual reading on sampling distributions and the Central Limit Theorem (typically week 7–8 lecture material)
- Comfort with Swift closures — the `resampled` API takes a closure that computes a statistic from one resample

## What the assignment does

The student loads ten session times averaging 250 seconds, computes the sample mean, draws 1,000 bootstrap resamples with `resampled(iterations: 1000, seed: 42)`, applies the mean as the statistic, and reads the 95% percentile interval from the resampled distribution.

The reflection asks them to write the *correct* interpretation of the resulting interval — the assignment's headline learning goal is the interpretation, not the computation.

## Sample student output

```
sample mean: 250.00
95% interval: [246.x, 253.x]
```

(The exact lower and upper depend on the seed, but the interval is centered close to 250 and roughly 6–7 seconds wide.)

The reflection should explicitly reject the "95% probability" framing, give the procedure-level interpretation correctly, and use language like "we estimate the mean is around 250, plausibly between 246 and 253."

## Rubric (4-tier)

**Exemplary (90–100%)**
Numerical results correct. Reflection rejects the wrong interpretation explicitly, gives the procedure-level interpretation in clear language, and uses the actual computed bounds in the answer. Bonus credit if the student notes that the population mean is *fixed* (not random), which is the deepest piece of the reframe.

**Proficient (75–89%)**
Numerical results correct. Reflection gives a correct procedure-level interpretation but does not explicitly contrast it with the wrong one.

**Developing (50–74%)**
Bootstrap runs and produces a sensible interval, but the reflection states or implies the "95% probability" misinterpretation, or describes the interval as "where the true mean is likely to be" without engaging with the procedure framing.

**Unsubmitted / Not yet (below 50%)**
Bootstrap fails to run, interval missing, or reflection absent.

## Common student pitfalls

1. **Forgetting the seed.** `resampled` requires a seed (no default). A student who omits it gets a compile error. Reinforce that the seed is for reproducibility — the same seed produces the same resamples every time, which is essential for grading.

2. **Confusing the resampled distribution with the original sample.** Some students will call `percentileCI` on `sessionTimes` directly. That is wrong — `percentileCI` reads percentiles from whatever array it is called on, and on the original sample those percentiles are descriptive, not inferential. The bootstrap confidence interval is the percentiles *of the resampled distribution*.

3. **The "95% probability" misinterpretation in the reflection.** This is the deepest pitfall and the one the assignment is designed to catch. Some students will write something like "there is a 95% chance the population mean is between 246 and 253." This is incorrect and should drop the rubric to Developing regardless of how clean the computation is. The correct interpretation is about the procedure across many repetitions, not about this one interval.

4. **Closure return type.** The `statistic` closure must return a `Double`, not `Double?`. A student who writes `{ resample in resample.mean() }` (without `?? 0.0`) gets a type error. The pattern `{ resample in resample.mean() ?? 0.0 }` is the cleanest fix.

5. **Iteration count too low.** With 100 iterations the percentile interval is noisy; with 1,000 it stabilizes. The assignment specifies 1,000. Students who reduce it to "test things faster" will get inconsistent results.

## Time budget breakdown

- Reading the assignment and the prompt block on interpretation: 10 min
- Computing the sample mean and writing the bootstrap call: 15 min
- Reading the percentile interval and printing it: 10 min
- Reflection: 20–25 min — the interpretation is the hardest part
- Cleanup and submission: 5 min

The reflection takes longer than students expect because writing the correct interpretation in plain language is genuinely hard, even after the lecture. Budget for it.

## Problem-set extensions

1. **Different seed, same data.** Have students re-run with seeds 0, 100, and 1000. The interval shifts slightly each time but stays close to (246, 253). The shifts are the bootstrap's own simulation noise; the underlying interval estimate is stable.

2. **Different sample size.** Have students truncate the dataset to the first 5 or 6 observations and re-run. The interval widens substantially because smaller samples produce less precise estimates. This previews the relationship between n and standard error.

3. **Confidence level sweep.** Have students compute the 90%, 95%, and 99% intervals on the same resampled distribution. The intervals nest — the 99% contains the 95% contains the 90% — and the width grows with confidence level. This makes the cost of higher confidence visible.

## What this assignment teaches that the next one builds on

Assignment 5 (bootstrap median) extends the same procedure to a different statistic. The lesson is that the bootstrap is not specific to the mean — it works for any statistic expressible as a closure on a `[Double]`. Students who finished this assignment understanding the closure-as-statistic pattern will move to assignment 5 with the right mental model.

## Notes on grading time

A class of 30 students grades in roughly 90 minutes. Numerical results are mechanically verifiable; the reflection is where grading time concentrates. Read for whether the student rejects the wrong interpretation explicitly, not just whether they describe the interval.

## Related primer sections

For the conceptual treatment of resampling, point students to <doc:Inferential-Statistics-Primer> sections "Resampling" and "Confidence intervals from resampling." The interpretation pitfall is covered explicitly in the same primer's `> Important:` callout on confidence intervals. Cookbook recipe 56 (Confidence Interval for a Sample Mean) is optional reading.
