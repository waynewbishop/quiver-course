// Assignment 1 — Descriptive Statistics
//
// Compute four descriptive statistics on a real dataset of student exam
// scores: the mean, the median, the standard deviation, and the quartiles.
// Then answer one short reflection question about which summary best
// represents "typical" performance.
//
// The dataset is a class of eight students who took the same midterm.
// One score is meaningfully lower than the rest. Read all four summaries,
// compare them, and decide what each one is telling us about the class.

import Foundation
import Quiver

let scores = [82.0, 91.0, 76.0, 88.0, 95.0, 73.0, 84.0, 90.0, 87.0, 45.0]

// TODO 1 — Compute the mean of `scores` and assign to `mean`.
//          Quiver returns Optional, so use `?? 0` to unwrap for printing.
let mean: Double = 0  // replace 0 with the computed mean

// TODO 2 — Compute the median of `scores` and assign to `median`.
let median: Double = 0  // replace 0 with the computed median

// TODO 3 — Compute the population standard deviation of `scores`.
//          (Use the default `ddof: 0`. Sample standard deviation, with
//          `ddof: 1`, is introduced in week 7 when we move from
//          describing samples to inferring population properties.)
let stdDev: Double = 0  // replace 0 with the computed standard deviation

// TODO 4 — Compute the five-number summary using `quartiles()`.
//          Use `?? (...)` with a default tuple to unwrap, or guard let.

print("mean:    ", mean)
print("median:  ", median)
print("std dev: ", stdDev)
// TODO 5 — Print the quartiles in a labeled, readable format.

// REFLECTION
//
// Look at the mean and the median. They are not equal. Which of the two
// better represents the "typical" performance of this class, and why?
// Answer in two to three sentences as a comment block below.
//
// Your answer:
//
//
//
