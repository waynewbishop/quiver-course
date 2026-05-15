// Assignment 7 — Stratified Train/Test Split (Capstone) — Reference Solution

import Foundation
import Quiver

let features: [Double] = [
    1.2, 1.4, 1.5, 1.3, 1.7, 1.8, 1.6, 1.4, 1.5, 1.3,
    1.6, 1.7, 1.4, 1.5, 1.2,
    3.8, 4.1, 3.9, 4.2, 4.0
]

let labels: [Int] = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1
]

// `stratifiedSplit` is an Array extension. It returns a named tuple
// with four arrays.
let split = features.stratifiedSplit(labels: labels, testRatio: 0.2, seed: 42)

let trainFeatures = split.trainFeatures
let testFeatures  = split.testFeatures
let trainLabels   = split.trainLabels
let testLabels    = split.testLabels

print("training set size: \(trainFeatures.count)")
// expected: 16 (80% of 20)
print("test set size:     \(testFeatures.count)")
// expected: 4 (20% of 20)

// Compute class proportions in each partition.
let trainClass0 = trainLabels.filter { $0 == 0 }.count
let trainClass1 = trainLabels.filter { $0 == 1 }.count
let testClass0  = testLabels.filter { $0 == 0 }.count
let testClass1  = testLabels.filter { $0 == 1 }.count

print()
print("training set class 0: \(trainClass0) (\(String(format: "%.0f%%", Double(trainClass0) / Double(trainLabels.count) * 100)))")
print("training set class 1: \(trainClass1) (\(String(format: "%.0f%%", Double(trainClass1) / Double(trainLabels.count) * 100)))")
print("test set class 0:     \(testClass0) (\(String(format: "%.0f%%", Double(testClass0) / Double(testLabels.count) * 100)))")
print("test set class 1:     \(testClass1) (\(String(format: "%.0f%%", Double(testClass1) / Double(testLabels.count) * 100)))")
// expected:
//   training set class 0: 12 (75%)
//   training set class 1: 4  (25%)
//   test set class 0:     3  (75%)
//   test set class 1:     1  (25%)
//
// Both partitions match the original 75/25 class balance.

// REFLECTION
//
// 1. Class proportions matter because evaluation accuracy is only
//    meaningful if the test set looks like the data the model will
//    see in production. With a random split on this dataset, a bad
//    draw could leave all five class-1 samples in the training set
//    and zero in the test set — meaning we evaluate on class 0 only
//    and have no idea how the model handles the smaller class. A
//    classifier that always predicts "class 0" would score 100% on
//    that test set despite being useless.
//
// 2. After the stratified 80/20 split, the training set has four
//    class-1 samples and the test set has one. Four samples is
//    barely enough to train a meaningful classifier on the smaller
//    class; one sample is far too few to evaluate reliably. The
//    real lesson here is that a 20-sample dataset is too small for
//    serious supervised learning regardless of how it is split.
//    Stratification is necessary but not sufficient.
//
// 3. A different seed would produce different specific samples in
//    each partition — the indices that end up in the test set would
//    change. What would stay the same is the class proportion: 75/25
//    in both partitions, every time. That preservation is the
//    guarantee stratified splitting provides.
