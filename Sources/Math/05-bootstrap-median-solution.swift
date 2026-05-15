// Assignment 5 — Bootstrap Confidence Interval for the Median — Reference Solution

import Foundation
import Quiver

let incomes = [42.0, 38.0, 45.0, 51.0, 39.0, 48.0, 44.0, 50.0,
               41.0, 47.0, 43.0, 46.0, 42.0, 380.0, 49.0]

let sampleMean = incomes.mean() ?? 0
let sampleMedian = incomes.median() ?? 0

print("sample mean:   \(String(format: "%.2f", sampleMean))")
// expected: ≈67.00 — pulled upward by the single 380 value
print("sample median: \(String(format: "%.2f", sampleMedian))")
// expected: 45.00 — the 8th of 15 sorted values

// Same `resampled` API, different statistic. The closure now returns
// the median of each resample.
let bootstrapMedians = incomes.resampled(iterations: 1000, seed: 42) { resample in
    resample.median() ?? 0.0
}

guard let interval = bootstrapMedians.percentileCI(level: 0.95) else {
    print("could not compute confidence interval")
    exit(0)
}

print("95% interval for the median: [\(String(format: "%.2f", interval.lower)), \(String(format: "%.2f", interval.upper))]")
// expected: [42.00, 48.00] with seed 42 — centered on 45 and about
//           six thousand dollars wide

// REFLECTION
//
// 1. The median (45) better represents typical household income for
//    this community. The mean (67) is dragged upward by a single
//    household earning 380 thousand — that household is real and the
//    income is real, but its presence makes the mean a poor summary
//    of how a "typical" household lives.
//
// 2. The confidence interval for the median is roughly (42, 49) —
//    about seven thousand dollars wide. This tells us the population
//    median is plausibly anywhere in that range; we are not in a
//    position to claim a precise value of "45" from this sample alone.
//    The interval width comes from the small sample size and the
//    inherent step-like nature of the median (which only changes when
//    a resample crosses certain values).
//
// 3. A parametric confidence interval for the mean assumes the
//    sampling distribution of the mean is approximately normal. With
//    n=15 and a strongly right-skewed population, that assumption is
//    suspect — the Central Limit Theorem helps, but slowly for skewed
//    populations. The bootstrap makes no such assumption; it uses the
//    data itself to describe the variability of the estimate. For
//    skewed data, especially with small samples, the bootstrap is the
//    more honest tool.
