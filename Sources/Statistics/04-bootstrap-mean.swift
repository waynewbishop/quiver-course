// Assignment 4 — Bootstrap Confidence Interval for the Mean
//
// We have a sample of session times from a small group of users. We
// computed the sample mean. The sample mean is an estimate of the
// population mean (the average across all users), but it is not the
// population mean itself — a different sample of the same size would
// produce a slightly different number.
//
// The bootstrap quantifies that uncertainty without assuming the
// population follows any particular distribution. We resample from
// our data with replacement many times, compute the mean of each
// resample, and read the confidence interval directly from the
// percentiles of the resampled distribution.

import Foundation
import Quiver

// Session times in seconds for ten users of a new app feature.
let sessionTimes = [245.0, 252.0, 238.0, 261.0, 247.0,
                    255.0, 249.0, 258.0, 244.0, 251.0]

// TODO 1 — Print the sample mean of `sessionTimes`.
//          Format to two decimal places.

// TODO 2 — Use `resampled(iterations:seed:statistic:)` to draw 1,000
//          bootstrap samples and compute the mean of each. The
//          `statistic` closure receives one resample and returns one
//          number. Use seed 42 for reproducibility.
//
//          Hint: `let bootstrapMeans = sessionTimes.resampled(
//                    iterations: 1000, seed: 42
//                ) { resample in resample.mean() ?? 0.0 }`
let bootstrapMeans: [Double] = []  // replace

// TODO 3 — Compute the 95% percentile confidence interval for the
//          population mean by calling `percentileCI(level: 0.95)`
//          on the resampled distribution.
//          The result is `(lower: Double, upper: Double)?`.

// TODO 4 — Print the interval in a readable format, formatted to two
//          decimal places.

// REFLECTION
//
// A 95% confidence interval is not "a 95% probability the population
// mean lies in this interval." Read the prompt at the bottom of this
// file and write a two- to three-sentence response that gives the
// correct interpretation in plain language. Use this specific result
// in your answer.
//
// Your answer:
//
//
//
