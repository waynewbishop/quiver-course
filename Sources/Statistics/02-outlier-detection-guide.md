# Instructor Guide — Assignment 2: Outlier Detection with Z-Scores

**Assignment file:** `02-outlier-detection.swift`
**Solution file:** `02-outlier-detection-solution.swift`
**Estimated student time:** 45–60 minutes
**Difficulty:** Introductory (week 4)

## Learning outcome

After completing this assignment, a student can identify outliers in a dataset using the z-score method, can extract flagged values using Boolean masking, and can explain how the choice of threshold reflects a tradeoff between false alarms and missed detections.

The deeper lesson: outlier detection is a method, not a verdict. The same dataset has different "outliers" at different thresholds, and the choice of threshold encodes a judgment about how strict our definition of unusual is.

## Prerequisites

- Assignment 1 — comfort with `mean()` and `std()`
- Familiarity with Swift `zip`, `filter`, and `map` (or willingness to learn the three together as the masking pattern)

## What the assignment does

The student loads a dataset of fourteen daily commute times. Most days are 11–18 minutes; two days are dramatically longer (47 and 52 minutes). The student computes the mean and standard deviation, applies `outlierMask(threshold: 1.5)`, and extracts the flagged values.

The reflection question asks the student to re-run the analysis at thresholds 2.0 and 1.0, observe how the count of flagged values changes, and reason about what the threshold choice means.

## Sample student output

```
mean:     18.00
std dev:  12.39
outlier count: 2
outlier values: [47.0, 52.0]
```

At `threshold: 1.0`: the count rises (typically 4–6 values get flagged depending on rounding).
At `threshold: 2.0`: the count drops (the two extreme values still sit between 1.5 and 2.5 standard deviations out, so neither is flagged at 2.0).

Reflection should note that lower thresholds flag more values, higher thresholds flag fewer, and the choice depends on context.

## Rubric (4-tier)

**Exemplary (90–100%)**
All numerical results correct. Outlier extraction uses the zip/filter/map pattern correctly. Reflection explicitly engages with the false-alarm vs. missed-detection tradeoff and gives a concrete example of when a stricter threshold makes sense (e.g., quality control) versus a looser one (e.g., commute monitoring).

**Proficient (75–89%)**
All numerical results correct. Reflection notes that lower thresholds flag more and higher fewer, but does not explicitly engage with the tradeoff or give a domain example.

**Developing (50–74%)**
Mean and standard deviation correct but outlier extraction incomplete or buggy. Reflection is present but treats the threshold as if there were a "right answer" rather than a judgment call.

**Unsubmitted / Not yet (below 50%)**
Outlier mask not produced, reflection absent, or numerical work materially wrong.

## Common student pitfalls

1. **Trying to filter the array directly without the mask.** Some students will write `commuteTimes.filter { $0 > someThreshold }` instead of using `outlierMask`. This works for this specific dataset (because the outliers are obvious), but it does not generalize and it does not use the standardization the assignment is meant to teach. Steer students back to z-score-based detection.

2. **Confusing the mask with the values.** The mask is `[Bool]` of the same length as the input; the outlier *values* are `[Double]`. Students sometimes print the mask thinking it is the answer. The next step (zip/filter/map) is what extracts the values.

3. **Hardcoding a different `mean` or `std` value.** `outlierMask` accepts optional `mean:` and `std:` parameters that override the computed values — this is a performance optimization for processing many arrays with the same distribution. A student who passes a wrong value here will get nonsensical results. The default behavior (no overrides) is correct for this assignment.

4. **Reflection that says "the threshold of 1.5 is correct."** There is no correct threshold. The reflection should engage with the tradeoff, not justify a single choice.

5. **Trying to use the mask with a comparison operator.** `commuteTimes > mean + 1.5 * stdDev` is the manual version of what `outlierMask` does. It works for the upper tail but misses values that are unusually low. The `outlierMask` method handles both tails using absolute distance.

## Time budget breakdown

- Reading the assignment and reviewing assignment 1: 5 min
- Computing the mean and standard deviation: 5 min
- Building and applying the mask: 10 min
- Extracting the outlier values with zip/filter/map: 15 min
- Re-running at different thresholds and writing the reflection: 15–20 min
- Cleanup and submission: 5 min

The zip/filter/map pattern is the technical sticking point for most students. Be available during the lab session for that step specifically.

## Problem-set extensions

1. **A different domain.** Substitute a dataset of daily step counts from a fitness tracker, where one or two zero-step days appear from forgetting to wear the device. Same method, different domain — students see that "outlier" can mean "data quality issue" as well as "genuinely unusual."

2. **Compare detection methods.** Have students also compute the interquartile-range method by hand: flag any value below `q1 - 1.5 * iqr` or above `q3 + 1.5 * iqr`. Compare the values flagged by each method on the commute dataset. The two methods often agree but not always.

3. **Walk-through reflection.** Have students compute the z-score of the 47.0 commute by hand: `(47 - 18) / 12.39 ≈ 2.34`. Then note that 2.34 > 1.5 so it gets flagged at the 1.5 threshold. This makes the standardization step concrete.

## What this assignment teaches that the next one builds on

Assignment 3 (histograms) gives students the visual companion to the numerical detection performed here. A histogram of `commuteTimes` shows two values sitting alone in the right tail; the z-score method identifies those values as the outliers a histogram would already suggest by eye. The relationship between numerical and visual summaries is the bridge between assignment 2 and assignment 3.

## Notes on grading time

A class of 30 students should grade in roughly 75–90 minutes. The numerical work is verifiable in seconds against the solution file. The reflection takes most of the grading time — read for whether the student engages with the tradeoff, not whether they reach a particular conclusion.

## Related primer sections

For the conceptual treatment of standardization, point students to <doc:Statistics-Primer> section "The z-score." For the masking pattern itself, <doc:Boolean-Masking> covers the broader application of the same technique. Cookbook recipe 8 (Find the Outliers) is optional reading for students who want a worked example in a different domain.
