// Assignment 2 — Outlier Detection with Z-Scores
//
// In assignment 1 we noticed that one score in the class was much lower
// than the rest and that the gap pulled the mean away from the median.
// "Obvious by eye" works for ten data points. It does not scale to ten
// thousand. The z-score method formalizes the intuition: standardize
// each value, then flag any value whose absolute standardized distance
// exceeds a threshold.
//
// In this assignment we use Quiver's `outlierMask(threshold:)` to
// identify the unusual values, then use Boolean masking to extract them.

import Foundation
import Quiver

// Daily commute times in minutes for one week of work-from-home and one
// week of in-office days. Most days are short; a few are long because of
// traffic, weather, or transit delays.
let commuteTimes = [12.0, 14.0, 11.0, 13.0, 12.0, 15.0, 13.0,
                    47.0, 18.0, 14.0, 13.0, 52.0, 12.0, 16.0]

// TODO 1 — Compute the mean and population standard deviation of
//          `commuteTimes`. Print both, formatted to two decimal places.

// TODO 2 — Use `outlierMask(threshold: 1.5)` to produce a Boolean array
//          marking each commute time as `true` if it is an outlier and
//          `false` otherwise. Assign to `mask`.
let mask: [Bool] = []  // replace with the computed mask

// TODO 3 — Use Swift's `zip` to pair each commute time with its mask
//          entry, then filter to extract only the outlier values.
//          Hint: `zip(commuteTimes, mask).filter { $0.1 }.map { $0.0 }`
let outliers: [Double] = []  // replace with the extracted outliers

print("outlier count:", outliers.count)
print("outlier values:", outliers)

// REFLECTION
//
// Re-run the assignment with `threshold: 2.0` and then with
// `threshold: 1.0`. How does the number of flagged values change?
// What does the choice of threshold say about how strict our
// definition of "unusual" is? Answer in three to four sentences as
// a comment block below.
//
// Your answer:
//
//
//
