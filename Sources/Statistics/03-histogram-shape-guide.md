# Instructor Guide — Assignment 3: Histogram and Distribution Shape

**Assignment file:** `03-histogram-shape.swift`
**Solution file:** `03-histogram-shape-solution.swift`
**Estimated student time:** 45–60 minutes
**Difficulty:** Introductory (week 5)

## Learning outcome

After completing this assignment, a student can build a histogram, read distribution shape from it (symmetric, skewed, bimodal), and explain how the mean/median gap confirms the shape numerically. This is the pivot point of the descriptive-statistics block — students stop computing summaries one at a time and start seeing the data as a *distribution* with structure.

## Prerequisites

- Assignments 1 and 2
- Comfort building Swift functions (the assignment uses one helper to print histograms)
- Familiarity with the `String(repeating:count:)` and `String(format:)` patterns from assignment 1

## What the assignment does

The student loads two datasets — midterm scores with a low-performing subgroup, and daily revenue with two extreme high days. They build a 5-bin histogram for each, print it as an ASCII bar chart, and compute the mean and median alongside.

The reflection asks them to characterize the shape of each distribution and reason about how the mean/median gap confirms or contradicts the visual shape.

## Sample student output

```
Midterm Scores:
   ~50.6  ****                  (4)
   ~62.1                        (0)
   ~73.6  *                     (1)
   ~85.1  ************          (12)
   ~96.6  ***                   (3)
  mean:   77.10
  median: 83.00

Daily Revenue:
  ~157.0  ******************    (18)
  ~251.0                        (0)
  ~345.0                        (0)
  ~439.0  *                     (1)
  ~533.0  *                     (1)
  mean:   163.50
  median: 130.00
```

The reflection should identify midterm scores as roughly bell-shaped with a small low-performing cluster, revenue as strongly right-skewed, and connect the mean/median gap to the shape in both cases.

## Rubric (4-tier)

**Exemplary (90–100%)**
Both histograms render correctly with the helper function. Reflection identifies the bimodal-leaning shape of midterm scores (the low cluster matters), the right skew of revenue, and connects the mean/median gap to the shape direction in both cases. Bonus credit if the student notes that the midterm distribution might be better described as "bimodal" than "left-skewed" because the low cluster is a separate group, not a tail.

**Proficient (75–89%)**
Histograms correct. Reflection identifies the symmetric vs. skewed distinction and connects mean/median to shape in at least one of the two cases.

**Developing (50–74%)**
Histograms produced but with formatting issues that obscure the shape. Reflection is present but does not connect the visual and numerical evidence.

**Unsubmitted / Not yet (below 50%)**
Histograms missing, reflection absent, or material errors.

## Common student pitfalls

1. **Choosing the wrong bin count.** Quiver's `histogram(bins:)` is sensitive to bin count for small datasets. With 20 data points and 5 bins, each bin holds an average of 4 values. With 10 bins on the same data, most bins are empty and the shape disappears into noise. The assignment specifies 5 bins for both datasets; students who experiment with different counts will find that the shape is most legible at the recommended setting.

2. **Reading the histogram tuple incorrectly.** `histogram(bins:)` returns `[(midpoint: Double, count: Int)]`. Some students try to access `.first` or `.lower` thinking the bin is described by its boundaries. The named-tuple access `bin.midpoint` and `bin.count` is the correct pattern.

3. **Forgetting to handle the empty bin.** The midterm-scores dataset has at least one bin with zero values (the 60s range, between the low cluster and the main mass). A histogram printer that uses `String(repeating: "*", count: bin.count)` handles this correctly because `count: 0` produces an empty string. Students who use a `for` loop with manual counting may print spurious characters in empty bins.

4. **Reflection that describes shape without using it.** A response like "the first dataset is bell-shaped and the second is skewed" is true but leaves the connection to the mean/median gap unexplored. The exemplary reflection ties shape to the gap in both cases.

5. **Confusing right-skew with left-skew.** A right-skewed distribution has its long tail on the *right* (high values), which pulls the mean *up* relative to the median. Some students mistakenly call the midterm distribution "right-skewed" because the mean is below the median; the correct term is "left-skewed" or, more accurately for the midterm case, "bimodal with a low cluster."

## Time budget breakdown

- Reading the assignment: 5 min
- Building the histogram helper function: 10–15 min
- Running on both datasets and verifying output: 5 min
- Computing means and medians: 5 min
- Reflection: 15–20 min
- Cleanup and submission: 5 min

The helper function is the technical sticking point. Some students will write the histogram printing inline twice; encourage them to factor it into a function on their second pass — it is a useful refactoring exercise.

## Problem-set extensions

1. **Bimodal dataset.** Substitute a clearly bimodal dataset — for example, a list of arrival times at a coffee shop with a morning rush and an afternoon rush. Students see two peaks and learn that "shape" can mean more than "skewed in one direction."

2. **Bin-count sensitivity.** Have students re-run the same midterm dataset with 3, 5, 10, and 20 bins. The shape is most legible at one bin count and disappears at the others. This previews the bias-variance tradeoff students will see again in machine learning.

3. **Connect to confidence intervals.** Have students predict, before running assignment 4, whether a parametric (normal-approximation) confidence interval would work well on each of these two datasets. The right answer (yes for midterm, no for revenue) follows directly from the shape they characterize here.

## What this assignment teaches that the next one builds on

Assignment 4 (bootstrap mean) builds directly on the shape recognition this assignment introduces. The bootstrap is the right tool for the revenue dataset — the right skew makes a parametric interval suspect. For the midterm dataset, either tool would work, but the bootstrap remains correct without the symmetry assumption. Students who have characterized shape here will arrive at assignment 4 understanding why the bootstrap is the more general tool.

## Notes on grading time

A class of 30 students grades in roughly 75–90 minutes. Histogram output is mechanically verifiable; the reflection is where grading time goes. Read for whether the student connects shape to the mean/median gap, not whether they reach a textbook conclusion.

## Related primer sections

For the conceptual treatment of distribution shape, point students to <doc:Statistics-Primer> sections "The five-number summary" and "Finding the unusual ones." Cookbook recipe 10 (Build a Histogram) is optional reading.
