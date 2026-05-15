# Instructor Guide — Assignment 5: Bootstrap Confidence Interval for the Median

**Assignment file:** `05-bootstrap-median.swift`
**Solution file:** `05-bootstrap-median-solution.swift`
**Estimated student time:** 60 minutes
**Difficulty:** Intermediate (week 10)

## Learning outcome

After completing this assignment, a student can apply the bootstrap to a statistic other than the mean (specifically the median), can recognize when the median is the more honest summary for a dataset, and can articulate why the bootstrap is more general than parametric (normal-approximation) methods. The assignment cements two ideas at once: the bootstrap is closure-driven, and statistic choice is a substantive decision, not an arbitrary one.

## Prerequisites

- Assignment 4 — comfort with `resampled`, `percentileCI`, and the closure-as-statistic pattern
- Conceptual reading on robust statistics and the limits of parametric methods (week 10 lecture material)

## What the assignment does

The student loads fifteen household incomes — fourteen in a normal range and one substantially higher (380, in thousands). They compute both the sample mean and median to make the right-skew visible, then run a 1,000-iteration bootstrap with the median as the statistic, and compute the 95% confidence interval.

The reflection asks three questions: which summary is more representative, what the interval width tells us, and why the bootstrap is more appropriate than a parametric method for this data.

## Sample student output

```
sample mean:   67.00
sample median: 45.00
95% interval for the median: [42.x, 49.x]
```

The reflection should identify the median as the more honest summary, recognize that the interval width reflects sampling uncertainty, and connect the choice of bootstrap (over parametric methods) to the right-skewed shape of the data.

## Rubric (4-tier)

**Exemplary (90–100%)**
Numerical results correct. Reflection answers all three prompts substantively, connects bootstrap appropriateness to the data's skew, and uses the actual interval bounds in the answer. Bonus credit if the student notes that the median's resampled distribution is "lumpy" because the median is a step function — only certain values can be the median of a resample of size 15.

**Proficient (75–89%)**
Numerical results correct. Reflection answers two of three prompts substantively. The "why bootstrap over parametric" prompt is the most commonly weak — students may say "because the data is skewed" without explaining why skew matters for parametric inference.

**Developing (50–74%)**
Bootstrap runs but the reflection treats this assignment as a repeat of #4 without engaging with the median-vs-mean distinction or the parametric-vs-resampling distinction.

**Unsubmitted / Not yet (below 50%)**
Bootstrap fails to run or reflection absent.

## Common student pitfalls

1. **Replacing only the print statements, not the closure.** A student who copies their assignment 4 solution and replaces `mean` with `median` in the prints — but leaves `mean()` inside the closure — gets a confidence interval for the mean despite labeling it as the median. The closure is what determines the statistic, not the label.

2. **Surprised by the discrete nature of bootstrap medians.** The median of an n=15 resample can only take certain values (specifically, values that appear in the original sample, possibly with adjustments for ties). Students sometimes notice the resampled distribution is "stepped" rather than smooth and assume their code is wrong. It isn't — that is a real property of the median statistic.

3. **Reflection that defends the mean.** Some students will argue the mean is correct because "the 380 household is part of the data." This conflates two questions: is the data accurate (yes), and is the mean the right summary (no, for this purpose). The mean is correct *as a calculation* but misleading as a representation of the typical household.

4. **Misunderstanding why the bootstrap is preferable.** Some students will say "the bootstrap is better because it does not require a normal distribution." That is true but incomplete. The deeper reason is that the parametric methods rely on the *sampling distribution of the statistic* being approximately normal — which the Central Limit Theorem delivers for the mean of large samples but does not deliver for medians or for small samples of skewed populations.

5. **Comparing the wrong intervals.** The assignment asks for a confidence interval for the median. Some students will also compute one for the mean (a reasonable thing to do) and then reflect on which interval is "narrower." This is not the point — the comparison the assignment cares about is *median (good summary, bootstrap interval)* versus *mean (bad summary, would-be parametric interval)*.

## Time budget breakdown

- Reading the assignment and reviewing assignment 4: 10 min
- Computing sample mean and median: 5 min
- Modifying the bootstrap from #4 (closure change is the main edit): 10 min
- Reading the interval: 5 min
- Reflection: 25–30 min — three prompts, each requires real thought
- Cleanup and submission: 5 min

The reflection is longer than #4's because it asks three questions instead of one. Students who finish in under 45 minutes have likely under-engaged with the third prompt.

## Problem-set extensions

1. **Different right-skewed dataset.** Replace incomes with house prices, executive salaries, or social-media follower counts. Same lesson, different domain.

2. **Bootstrap a third statistic.** Have students bootstrap the *trimmed mean* (mean after dropping the top and bottom 10% of values). The trimmed mean sits between the mean and the median in robustness; comparing all three intervals on the same data shows the spectrum of options.

3. **Connect to assignment 4.** Run the bootstrap mean on this dataset (using the same `resampled` call but with `mean()` as the statistic). Compare the resulting interval to the mean's value and to the median's interval. The mean's interval will be wide and centered well above the median's interval — visual evidence that the mean is the wrong tool.

## What this assignment teaches that the next one builds on

Assignment 6 (linear regression) shifts from describing samples to predicting from data. The conceptual bridge is that regression coefficients are themselves statistics estimated from a sample — the bootstrap could equally well be applied to them. We do not pursue that in assignment 6 (the parametric approach via R² is the standard), but students who finish assignment 5 with the closure-as-statistic intuition will recognize regression coefficients as another example of "things we estimate from data, with uncertainty."

## Notes on grading time

A class of 30 students grades in roughly 100–120 minutes. The numerical work is fast to verify; the three-prompt reflection takes 3–4 minutes per submission to read carefully. This is the longest single grading exercise in the descriptive-and-inferential block.

## Related primer sections

For the conceptual treatment, point students to <doc:Inferential-Statistics-Primer> sections "Resampling" and "Confidence intervals from resampling." Cookbook recipe 57 (Confidence Interval for the Median) is optional reading and uses a similar dataset shape.
