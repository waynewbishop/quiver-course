# Instructor Guide — Assignment 7: Stratified Train/Test Split (Capstone)

**Assignment file:** `07-stratified-split.swift`
**Solution file:** `07-stratified-split-solution.swift`
**Estimated student time:** 60 minutes
**Difficulty:** Intermediate (week 14, capstone)

## Learning outcome

After completing this assignment, a student can apply `Array.stratifiedSplit` to a labeled classification dataset, can confirm that class proportions are preserved across both partitions, and can explain why stratification matters for honest model evaluation. The capstone ties the descriptive-and-inferential statistics covered in the course to the supervised-learning course that follows.

The deeper lesson is that data preparation is not a footnote — it is the load-bearing step every honest model evaluation depends on.

## Prerequisites

- All previous assignments
- Conceptual reading on training/test splits, generalization, and class imbalance (week 13–14 lecture material)
- The bridge concept that a classifier predicts categories rather than continuous values (mentioned but not built in earlier assignments)

## What the assignment does

The student loads a 20-sample classification dataset with a 75/25 class imbalance, applies an 80/20 stratified split, and verifies that class proportions are preserved in both the training and test partitions. The reflection asks them to explain why preservation matters, recognize that the smaller class has only enough samples to demonstrate the concept (not enough for serious modeling), and articulate what stays constant across different random seeds.

## Sample student output

```
training set size: 16
test set size:     4

training set class 0: 12 (75%)
training set class 1: 4  (25%)
test set class 0:     3  (75%)
test set class 1:     1  (25%)
```

The reflection should explain the random-split failure mode (class-1 samples ending up entirely in one partition), recognize that one class-1 sample in the test set is too few for reliable evaluation, and note that the seed determines the specific samples but not the proportions.

## Rubric (4-tier)

**Exemplary (90–100%)**
Numerical results correct. Reflection answers all three prompts substantively, names the random-split failure mode concretely, and acknowledges that the dataset is too small for serious modeling regardless of the split strategy. Bonus credit if the student explicitly connects this assignment to assignment 6 — noting that R² and RMSE on the training data alone (which assignment 6 used) is a different evaluation than the test-set evaluation a stratified split enables.

**Proficient (75–89%)**
Numerical results correct. Reflection answers two of three prompts substantively. The "is four/one samples enough" prompt is the most commonly weak — students may not engage with it.

**Developing (50–74%)**
Split runs and partition sizes are correct, but proportion calculation is buggy or absent. Reflection is brief or treats stratification as a nice-to-have rather than a necessary step.

**Unsubmitted / Not yet (below 50%)**
Split fails to run or reflection absent.

## Common student pitfalls

1. **Calling `stratifiedSplit` on the wrong array.** The method is on the *features* array, with `labels:` as a parameter — `features.stratifiedSplit(labels: labels, ...)`. Some students will try to call it on `labels` or pass features and labels in the wrong order.

2. **Mismatched lengths.** `features` and `labels` must be the same length. The provided dataset has 20 of each; if a student edits the data and forgets to keep the lengths in sync, the call will fail at runtime. The error message is clear but does not point at "you edited the data wrong" directly.

3. **Confusing class proportions with class counts.** The reflection asks about preservation of *proportions*. Some students will report counts (12 vs. 4 in training, 3 vs. 1 in test) without computing the percentages. Both representations are valid evidence for the reflection, but the percentage form makes the preservation property visible at a glance.

4. **Assuming the seed determines the partition contents.** It does — but the *proportions* are determined by the stratification logic, not the seed. Students sometimes write reflections that imply a different seed could break the proportion guarantee. It cannot.

5. **Not engaging with the "small sample" critique.** The dataset has only 5 samples in the smaller class total. After splitting, 4 are in training and 1 in test. The reflection's second prompt explicitly invites the student to notice that this is insufficient for serious modeling. Students who skip past this prompt have missed the point that stratification is necessary but not sufficient.

## Time budget breakdown

- Reading the assignment and reviewing the dataset: 5 min
- Calling `stratifiedSplit` and inspecting the result tuple: 10 min
- Computing partition sizes: 5 min
- Computing class proportions: 15 min
- Reflection: 20 min
- Cleanup and submission: 5 min

The proportion calculation is the technical sticking point — students need to remember that `Double(count) / Double(total) * 100` produces a percentage, and that integer division would silently produce zeros for the smaller class.

## Problem-set extensions

1. **Re-run with a non-stratified split.** Have students compute a random split (e.g., shuffle the indices and take the first 16 for training) and observe that the proportions in both partitions vary widely from one seed to the next. This makes the value of stratification concrete by contrast.

2. **More extreme imbalance.** Modify the dataset to be 18 class-0 and 2 class-1. After an 80/20 split, the test set may contain zero class-1 samples (depending on the seed). This is the failure mode the assignment talks about but does not produce; students see it directly with this variant.

3. **Multi-class extension.** Add a third class (a few samples) and re-run. The stratification logic generalizes — every class with at least two samples gets at least one in each partition (subject to test-ratio constraints). This previews multi-class classification covered in the v2 ML pack.

## What this assignment teaches that the next course builds on

This assignment is the bridge to the v2 Machine Learning pack. Every supervised learning model in that pack — K-Nearest Neighbors, Naive Bayes, logistic-style classification — assumes the data has been split into training and test partitions before any model fitting happens. Students who finish this capstone with the stratification habit will arrive at the next course ready to evaluate models honestly.

The capstone also closes the descriptive-and-inferential arc with a forward look. The course taught students to summarize, infer, and predict from data. The next course teaches them to learn from data automatically, and the stratified split is the ritual that begins every such workflow.

## Notes on grading time

A class of 30 students grades in roughly 90 minutes. The numerical work is mechanically verifiable; the three-prompt reflection takes 3 minutes per student to read carefully. As the capstone, this assignment is also where teaching assistants should write a brief summative comment per student noting where they are in the descriptive-and-inferential progression and what to focus on for the ML course.

## Related primer sections

For the conceptual treatment of train/test splitting, point students to <doc:Train-Test-Split>. The broader frame of features, labels, training, and evaluation lives in <doc:Machine-Learning-Primer>. Cookbook recipe 32 (Stratified Split) is optional reading.
