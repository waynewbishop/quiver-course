# First Lecture Outline — 30 to 45 Minutes

A first-lecture outline for instructors introducing Swift and Quiver to a statistics class. The goal is to land three things in the first session:

1. Swift is readable — the code looks like the math
2. The Notebook is alive — we paste, we run, we see output
3. The course is about interpretation, not memorization

The outline runs roughly 30 minutes for a class with prior programming exposure, 45 minutes for a class that needs more time on the basics. Adjust by trimming or expanding the "Setup and orientation" block.

## Outline

### 0:00 — Why this course works the way it works (5 minutes)

Open with the frame: this is a statistics course, not a programming course. The textbook is still the textbook, the lectures still cover the math, and the homework still asks students to compute summaries and interpret them. What changes is the tool — instead of a calculator or a spreadsheet, students use a Swift environment that runs in any web browser and shows the results inline.

The reason for this choice: the methods we reach for in statistics — `mean`, `median`, `standard deviation`, `quartiles` — read in code the way they read in the textbook. A student who has just learned that the standard deviation measures the typical distance from the mean writes `data.std()` and the code does what the words say.

Briefly mention what we are not asking of students: no installation of complicated software, no command-line wrestling, no separate language to learn alongside the math. One clone, one command, one browser tab.

### 0:05 — Setup and orientation (10 minutes)

Walk through the Notebook environment live. Either project the laptop screen or have students follow along on their own machines.

```bash
git clone https://github.com/waynewbishop/quiver-notebook
cd quiver-notebook
swift run
```

Open `http://localhost:8080` in a browser. Show students:

- The editor pane where code goes
- The output pane where results appear
- The sidebar listing bundled examples
- Cmd+Enter (or Ctrl+Enter on Linux) to compile and run

Click `05-summary-statistics` in the sidebar. Cmd+Enter. Output appears below. Pause for a moment so students see that the code already in the editor produced numbers without anyone typing anything new.

### 0:15 — A first computation (10 minutes)

Clear the editor (the New button at the top) and type a small example live. The dataset can be invented on the spot — recent quiz scores, say, or daily temperatures from a forecast app.

```swift
let scores = [82.0, 91.0, 76.0, 88.0, 95.0, 73.0, 84.0, 90.0]

print("mean:    ", scores.mean() ?? 0)
print("std dev: ", scores.std() ?? 0)
print("median:  ", scores.median() ?? 0)
```

Cmd+Enter. The output:

```
mean:     84.875
std dev:  7.197
median:   86.0
```

Three things to point out:

1. **The code reads like the math.** `scores.mean()` is the average of the scores. No formula, no loop, no boilerplate.
2. **The `?? 0` part is Swift-specific.** Quiver's statistics methods return an `Optional` because an empty array has no mean. The `?? 0` says "use 0 if the array is empty." Students will see this pattern throughout the course.
3. **The mean and the median disagree.** The mean is 84.875, the median is 86.0. That gap is not an error — it is information. We will spend the next several weeks learning to read that gap.

### 0:25 — Show, do not tell (5–10 minutes)

Add one more line to the editor:

```swift
let outliers = scores.outlierMask(threshold: 1.5)
print("outliers:", outliers)
```

Cmd+Enter. The output flags `73.0` as an outlier — `[false, false, true, false, false, true, false, false]` (or similar; exact depends on the threshold).

Pause. Ask the class: *Is 73 actually an outlier? Does it deserve to be flagged?* Do not answer. The point of the question is to plant the seed for assignment 2 — outlier detection is a method, not a verdict.

### 0:35 — What's coming up (5 minutes)

Sketch the arc of the course:

- **Weeks 1–5: describe what we have.** Mean, median, standard deviation, quartiles, outliers, histograms.
- **Weeks 6–11: infer from samples.** Sampling distributions, the bootstrap, confidence intervals, hypothesis tests.
- **Weeks 12–14: predict from data.** Linear regression, evaluation metrics, the bridge into machine learning.

Mention the seven graded assignments and where they land in the schedule. Point students at the syllabus mapping for the full week-by-week plan.

Close with the homework for next class:

1. Install the Quiver Notebook (link to the installation guide)
2. Open the editor and re-run the `scores` example from today, with a different dataset of the student's choice (recent quiz scores, daily commute times, anything numeric and at least eight values long)
3. Bring three observations about the output to the next class

The point of the homework is not to compute anything specific — it is to confirm that every student has the Notebook running on their own machine before the first graded assignment lands.

## Live-demo moments worth holding for

Three points in this outline benefit from waiting on the room:

- **The `?? 0` introduction.** This is the one Swift-specific syntax students need to remember. Walking through it slowly the first time saves explaining it five times in office hours.
- **The mean/median disagreement.** Watching students realize the two summaries can differ and that the difference means something is the moment the course starts working. Hold the silence after the question.
- **The outlier-detection question.** Same dynamic. The point is to provoke disagreement in the room — some students will say 73 is an outlier, others will say it is just a low score. The disagreement is the lesson.

## What not to do in the first lecture

- **Do not introduce optionals as a Swift concept.** They are introduced when needed. The `?? 0` pattern is enough syntactic vocabulary for the first month.
- **Do not run a regression in the first lecture.** Save it for week 12. Showing too much in the first session reduces the impact of each piece.
- **Do not show Xcode.** The Notebook is the student-facing surface. Faculty using Xcode for grading is a separate workflow that does not need to be in the first lecture.
