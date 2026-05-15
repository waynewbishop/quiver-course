// Assignment 2 — Outlier Detection with Z-Scores — Reference Solution
//
// Use `outlierMask(threshold:)` to identify commute times that sit far
// from the typical day. Extract those values with Boolean masking.

import Foundation
import Quiver

let commuteTimes = [12.0, 14.0, 11.0, 13.0, 12.0, 15.0, 13.0,
                    47.0, 18.0, 14.0, 13.0, 52.0, 12.0, 16.0]

let mean = commuteTimes.mean() ?? 0
let stdDev = commuteTimes.std() ?? 0
print("mean:    ", String(format: "%.2f", mean))
// expected: ≈18.71
print("std dev: ", String(format: "%.2f", stdDev))
// expected: ≈12.72

// `outlierMask` returns a [Bool] of the same length as the input.
// `true` marks values whose distance from the mean exceeds
// `threshold * standardDeviation`.
let mask = commuteTimes.outlierMask(threshold: 1.5)

// Use `zip` to pair each value with its mask entry, then filter and map.
let outliers = zip(commuteTimes, mask).filter { $0.1 }.map { $0.0 }

print("outlier count:", outliers.count)
print("outlier values:", outliers)
// expected: 2 outliers, [47.0, 52.0]

// REFLECTION
//
// At threshold 2.0, the same dataset flags zero values — 47 and 52
// are still unusual but neither sits more than two standard deviations
// from the mean of 18. At threshold 1.0, additional values get flagged
// because the bar is lower; even moderately above-average commutes are
// considered "unusual." The choice of threshold is the choice of how
// strict we want our definition of "unusual" to be. There is no
// objectively correct value; it depends on the cost of a false alarm
// versus the cost of a missed detection. For commute monitoring a
// looser threshold (1.5) catches the genuinely bad days; for a quality
// control system on aircraft parts a stricter threshold (3.0 or higher)
// reduces false alarms.
