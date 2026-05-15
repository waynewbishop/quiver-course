// Assignment 1 — Descriptive Statistics — Reference Solution
//
// Compute four descriptive statistics on a real dataset of student exam
// scores: the mean, the median, the standard deviation, and the quartiles.
// The dataset includes one score that is meaningfully lower than the rest,
// which makes the mean/median gap a teachable outcome.

import Foundation
import Quiver

let scores = [82.0, 91.0, 76.0, 88.0, 95.0, 73.0, 84.0, 90.0, 87.0, 45.0]

// Mean — the arithmetic average. Sensitive to extreme values.
let mean = scores.mean() ?? 0
// expected: 81.1

// Median — the middle value when the data is sorted. Robust to outliers.
let median = scores.median() ?? 0
// expected: 85.5

// Population standard deviation (ddof: 0). Measures the typical distance
// from the mean. The squared deviation of the 45.0 score is what makes
// this value larger than it would be without that observation.
let stdDev = scores.std() ?? 0
// expected: ≈13.63

// Five-number summary — minimum, first quartile, median, third quartile,
// maximum, plus the interquartile range (q3 - q1).
guard let q = scores.quartiles() else {
    print("could not compute quartiles for an empty array")
    exit(0)
}

print("mean:    ", String(format: "%.2f", mean))
print("median:  ", String(format: "%.2f", median))
print("std dev: ", String(format: "%.2f", stdDev))
print("min:     ", q.min)
print("q1:      ", q.q1)
print("median:  ", q.median)
print("q3:      ", q.q3)
print("max:     ", q.max)
print("iqr:     ", q.iqr)

// REFLECTION
//
// The median (85.5) better represents the typical performance of this
// class than the mean (81.1). The single low score of 45.0 pulls the
// mean downward by roughly four points, but only moves the median by
// one position in the sorted ordering. For a class profile we want a
// summary that tells us where most students are, not one that is
// dragged toward the most unusual result. The mean/median gap of
// 4.4 points is itself informative: it tells us the distribution is
// skewed by at least one low value, which we can confirm visually
// in assignment 3 with a histogram.
