// Assignment 5 — Bootstrap Confidence Interval for the Median
//
// In assignment 4 we built a bootstrap interval for the mean. The same
// resampling procedure works for any statistic — the median, the
// trimmed mean, the standard deviation, anything we can express as
// a closure on a [Double].
//
// In this assignment we apply the bootstrap to the median, on a dataset
// where the median is the more honest summary. Income data is famously
// right-skewed: most households cluster in a normal range, a few earn
// dramatically more. The mean of such data is dragged upward; the
// median better represents the typical household.

import Foundation
import Quiver

// Annual household income in thousands of dollars for fifteen
// households in a small community.
let incomes = [42.0, 38.0, 45.0, 51.0, 39.0, 48.0, 44.0, 50.0,
               41.0, 47.0, 43.0, 46.0, 42.0, 380.0, 49.0]

// TODO 1 — Compute and print both the sample mean and the sample
//          median. Format each to two decimal places.

// TODO 2 — Use `resampled(iterations:seed:statistic:)` to draw 1,000
//          bootstrap samples. The statistic this time is the median,
//          not the mean. Use seed 42.
let bootstrapMedians: [Double] = []  // replace

// TODO 3 — Build the 95% confidence interval for the population median
//          and print the bounds.

// REFLECTION
//
// Compare the sample mean and the sample median. They differ by a
// substantial margin. Then look at the confidence interval for the
// median you just computed. Answer in three to four sentences:
//
// 1. Which summary — mean or median — better represents typical
//    household income in this community, and why?
// 2. What does the width of the median's confidence interval tell us
//    about the precision of that estimate?
// 3. Why is the bootstrap a more honest tool than a parametric
//    (normal-approximation) method for this particular dataset?
//
// Your answer:
//
//
//
