// Assignment 3 — Histogram and Distribution Shape
//
// A histogram groups data into equal-width bins and counts how many
// values fall in each. The picture that emerges — the "shape" of the
// distribution — tells us things no single summary can. A bell-shaped
// histogram says values cluster around the center. A skewed histogram
// says they pile up on one side. A bimodal histogram says there are
// actually two underlying groups in the data.
//
// In this assignment we build histograms for two datasets and read
// the shape of each.

import Foundation
import Quiver

// Dataset A — student midterm scores from a class with mostly average
// performance and a small group of struggling students.
let midtermScores = [82.0, 78.0, 85.0, 91.0, 76.0, 88.0, 84.0, 79.0,
                     87.0, 90.0, 83.0, 81.0, 86.0, 92.0, 77.0, 89.0,
                     45.0, 52.0, 48.0, 55.0]

// Dataset B — daily app revenue in dollars from a small business app
// with most days in a normal range and rare high-revenue days.
let dailyRevenue = [120.0, 135.0, 142.0, 128.0, 110.0, 138.0, 125.0,
                    145.0, 132.0, 118.0, 130.0, 122.0, 140.0, 415.0,
                    128.0, 135.0, 122.0, 580.0, 130.0, 125.0]

// TODO 1 — Build a 5-bin histogram of `midtermScores` using
//          `histogram(bins: 5)`. Each entry is a tuple of
//          (midpoint: Double, count: Int).

// TODO 2 — Print the histogram in a readable format. One row per bin,
//          showing the midpoint and the count.

// TODO 3 — Build a 5-bin histogram of `dailyRevenue` and print it.

// TODO 4 — For each dataset, compute the mean and median and print them
//          alongside the histogram. The mean/median gap is part of how
//          we read distribution shape.

// REFLECTION
//
// Look at the two histograms and answer in three to four sentences:
//
// 1. Which dataset is roughly bell-shaped (symmetric)?
// 2. Which is right-skewed (a few values much higher than the rest)?
// 3. How does the mean/median gap confirm or contradict the shape
//    you read from the histogram?
//
// Your answer:
//
//
//
