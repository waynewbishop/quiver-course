# Faculty FAQ

Questions instructors ask before adopting Swift and Quiver in a statistics course.

## Why Swift in a statistics course?

Swift was designed to be readable. The methods we reach for in an introductory statistics course — `mean()`, `median()`, `std()`, `quartiles()`, `outlierMask()` — read in code the way they read in a textbook. A student who has just learned that the standard deviation measures the typical spread around the mean writes `data.std()`, and the code reads exactly the same way the concept does in their head.

The other reason is platform. Swift runs natively on every Apple device a student already owns — laptops, phones, watches, tablets. Once a student has fitted a model in the classroom, the same code drops into an iOS or watchOS app for a final project, a capstone, or a portfolio piece. The bridge from "I learned this in class" to "I built something with this" is shorter than it usually is for an introductory computational tool.

Quiver itself is a pure Swift library with no external dependencies. Installation is one `git clone` and one `swift run`. There is no environment to manage, no virtual environment to activate, no package manager to learn alongside the math.

## How do students install on department machines?

Three install paths, in order of friction:

1. **The Quiver Notebook** — the recommended student path. Browser-based editor with Quiver and a library of bundled datasets pre-imported. Students clone one repo, run `swift run`, and a tab opens at `http://localhost:8080`. No Xcode required, runs on any Mac with the Swift toolchain installed.

2. **Xcode 26+** — for students who already have it installed and prefer an IDE. The instruction pack opens as a Swift Package; assignments run with a click.

3. **`swift run` from the command line** — for students on Linux or those who prefer a terminal workflow.

For department-managed machines, the lightest install is the Swift toolchain via [`swiftly`](https://swift.org/install/), Swift's official toolchain installer. It runs as a normal Mac installer and does not require Homebrew, Xcode, or admin rights for ongoing use.

## What if I'm using a textbook that uses other software?

The instruction pack is designed to slot into an existing course rather than replace the textbook. Most introductory statistics textbooks are software-agnostic in their core content — the formulas for mean, variance, regression, and confidence intervals are the same regardless of the tool a student computes them with.

We use the textbook for the conceptual material and the assignments in this pack as the computational practice. A student reads the textbook chapter on the Central Limit Theorem, then opens an assignment and runs a bootstrap to see the theorem's prediction land in the output pane. The textbook explains why; the assignment shows that.

For instructors who want to map textbook chapters onto Quiver methods directly, the syllabus mapping in `Sources/Statistics/syllabus-14-week.md` does that mapping for a typical 14-week course.

## Can students who already know one programming language pick up Swift in a stats class?

Yes, in roughly the first two weeks. The features Swift uses heavily in this pack — array literals, optional unwrapping with `?? 0`, function calls, basic control flow — are familiar in some form to anyone who has written code before. The `?? 0` pattern for unwrapping `Optional` returns is the one piece of Swift-specific syntax that needs a brief introduction in the first lecture; the rest reads close enough to most modern languages that students adapt quickly.

For students with no programming background at all, the first lecture outline allocates fifteen minutes to introducing the Notebook environment and walking through a complete snippet line-by-line. That window is usually sufficient because the math we ask students to compute does not require constructing complex programs — most assignments are 30–60 lines of code, much of it dataset literals.

## Will my department chair accept this?

The case for adoption rests on three points:

- **The math is correct.** Every Quiver method is validated against industry-standard implementations through a separate cross-validation suite. The mean is the mean; the bootstrap interval is the bootstrap interval. Computational results are reproducible.
- **The license is permissive.** This pack is published under CC BY-NC-SA 4.0. A department can fork it, adapt assignments, add lecture notes, and use the result in any non-commercial course without negotiating terms.
- **The platform is durable.** Swift is Apple's long-supported native language and is also widely used outside Apple's ecosystem in server and Linux contexts. A course built on it does not depend on a single vendor's roadmap to remain teachable.

For the comparative-tools question — how does this stack up against what we currently use? — the request goes through the project lead and is handled separately as a private document distributed to verified instructors. The public materials in this pack describe what Quiver does; the private appendix is where comparisons live.

## What does class time look like — lecture, lab, or both?

Both, with the split tilting toward lab time. The recommended cadence is two 50-minute lectures plus one 75-minute lab session per week. Lectures cover the conceptual material from the textbook; the lab session is where students open the Notebook and work through the week's assignment with the instructor or a TA available for questions.

In a course without a dedicated lab slot, the assignments work as homework. Each assignment is sized to a 45–60 minute student work session, with the time budgets called out in each instructor guide.

## How do students submit work?

Students download their completed assignment from the Notebook editor (⋮ → "Download .swift") and submit the resulting file through the course's normal channel — the campus learning management system, an email attachment, or a forked GitHub repository. The Notebook is the authoring surface; the filesystem is the submission surface.

For courses that want to grade against the reference solution, the `NN-name-solution.swift` file in the instructor pack is the canonical answer key. A teaching assistant compares the student submission to the solution file in any text editor; numerical outputs should match within the tolerances called out in the rubric.
