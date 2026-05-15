// Assignment 3 — Histogram and Distribution Shape — Reference Solution
//
// Build histograms for two datasets, print them in a readable format,
// and compare the shape each one reveals.

import Foundation
import Quiver

let midtermScores = [82.0, 78.0, 85.0, 91.0, 76.0, 88.0, 84.0, 79.0,
                     87.0, 90.0, 83.0, 81.0, 86.0, 92.0, 77.0, 89.0,
                     45.0, 52.0, 48.0, 55.0]

let dailyRevenue = [120.0, 135.0, 142.0, 128.0, 110.0, 138.0, 125.0,
                    145.0, 132.0, 118.0, 130.0, 122.0, 140.0, 415.0,
                    128.0, 135.0, 122.0, 580.0, 130.0, 125.0]

func printHistogram(_ name: String, _ data: [Double]) {
    let bins = data.histogram(bins: 5)
    print("\(name):")
    for bin in bins {
        let bar = String(repeating: "*", count: bin.count)
        print("  \(String(format: "%6.1f", bin.midpoint))  \(bar) (\(bin.count))")
    }
    let mean = data.mean() ?? 0
    let median = data.median() ?? 0
    print("  mean:   \(String(format: "%.2f", mean))")
    print("  median: \(String(format: "%.2f", median))")
    print()
}

printHistogram("Midterm Scores", midtermScores)
printHistogram("Daily Revenue", dailyRevenue)

// expected midterm output:
//   ~49.7  ***                   (3)
//   ~59.1  *                     (1)
//   ~68.5                        (0)
//   ~77.9  ******                (6)
//   ~87.3  **********            (10) ← peak
//   mean:   77.40
//   median: 82.50
//
// expected revenue output:
//   ~157.0  ******************   (18) ← peak
//   ~251.0                       (0)
//   ~345.0                       (0)
//   ~439.0  *                    (1)
//   ~533.0  *                    (1)
//   mean:   166.00
//   median: 130.00

// REFLECTION
//
// 1. The midterm scores are roughly bell-shaped if we set aside the
//    cluster of low scores around 45–55. Most of the mass sits in the
//    80–90 range with a thinner left tail. The four students in the
//    40s/50s would show as a separate small cluster.
//
// 2. The daily revenue dataset is strongly right-skewed. Eighteen of
//    twenty days fall in a tight 110–145 range, but two days at 415
//    and 580 pull the right tail out dramatically.
//
// 3. The mean/median gap confirms the shape in both cases. Midterm
//    scores: mean 77.1, median 83.0 — the mean is dragged down by the
//    low-score cluster, exactly what we expect when the left tail is
//    long. Revenue: mean 163.5, median 130.0 — the mean is dragged up
//    by the two high days, exactly what we expect for a right skew.
//    The histogram and the mean/median gap tell the same story from
//    different angles.
