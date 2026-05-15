// Assignment 4 — Bootstrap Confidence Interval for the Mean — Reference Solution

import Foundation
import Quiver

let sessionTimes = [245.0, 252.0, 238.0, 261.0, 247.0,
                    255.0, 249.0, 258.0, 244.0, 251.0]

let sampleMean = sessionTimes.mean() ?? 0
print("sample mean: \(String(format: "%.2f", sampleMean))")
// expected: 250.00

// Draw 1,000 bootstrap resamples. For each one, compute the mean and
// keep the result. The closure receives one resample at a time.
let bootstrapMeans = sessionTimes.resampled(iterations: 1000, seed: 42) { resample in
    resample.mean() ?? 0.0
}

// Read the 95% interval directly from the percentiles of the resampled
// distribution. `percentileCI(level: 0.95)` returns the 2.5th and 97.5th
// percentiles of `bootstrapMeans`.
guard let interval = bootstrapMeans.percentileCI(level: 0.95) else {
    print("could not compute confidence interval")
    exit(0)
}

print("95% interval: [\(String(format: "%.2f", interval.lower)), \(String(format: "%.2f", interval.upper))]")
// expected: [245.90, 254.10] with seed 42 — centered on 250 with a
//           width of about 8 seconds

// REFLECTION
//
// The 95% confidence interval is not "a 95% probability the population
// mean lies between 246 and 253." The population mean is fixed; it
// either lies in this interval or it does not. The 95% describes the
// procedure: if we repeated this resampling many times with fresh
// samples of size 10, about 95% of the intervals we built would
// contain the true population mean. In practice we say "we estimate
// the population mean is around 250, plausibly between 246 and 253" —
// not "there is a 95% chance the true mean is between 246 and 253."
