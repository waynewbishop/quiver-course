// Assignment 7 — Stratified Train/Test Split (Capstone)
//
// Every machine learning workflow starts with the same step: split
// the data into a training set (which the model learns from) and a
// test set (which the model is evaluated against). A model's
// performance on its training data is the easy case — what matters
// is how it performs on data it has never seen.
//
// Random splitting can fail when classes are imbalanced. If only 20%
// of samples belong to the smaller class, a random split might leave
// most of those samples in either the training or the test set,
// producing a misleading evaluation. Stratified splitting preserves
// class proportions in both partitions.
//
// In this capstone we apply `Array.stratifiedSplit` to a small
// classification dataset, confirm class proportions are preserved,
// and reflect on why this matters for the supervised learning
// course that follows.

import Foundation
import Quiver

// Twenty observations of a single feature with two-class labels.
// Class 0 represents the typical case (15 samples) and class 1 the
// less common case (5 samples) — a 75/25 split.
let features: [Double] = [
    1.2, 1.4, 1.5, 1.3, 1.7, 1.8, 1.6, 1.4, 1.5, 1.3,
    1.6, 1.7, 1.4, 1.5, 1.2,         // class 0: 15 samples
    3.8, 4.1, 3.9, 4.2, 4.0          // class 1: 5 samples
]

let labels: [Int] = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1
]

// TODO 1 — Use `Array.stratifiedSplit(labels:testRatio:seed:)` to
//          divide the data into 80% training and 20% test sets while
//          preserving class proportions. Use seed 42.
//
//          The result is a named tuple of
//          (trainFeatures, testFeatures, trainLabels, testLabels).

// TODO 2 — Print the size of each partition.

// TODO 3 — Compute and print the class proportions in the training
//          set and the test set. The expectation: both partitions
//          should be roughly 75% class 0, 25% class 1, matching
//          the original dataset.
//
//          Hint: `trainLabels.filter { $0 == 0 }.count` gives the
//          count of class 0 in the training set. Divide by
//          `trainLabels.count` for the proportion.

// REFLECTION
//
// Answer in three to four sentences:
//
// 1. Why does preserving class proportions matter for evaluating a
//    classifier on this dataset? What could go wrong with a random
//    (non-stratified) split?
// 2. The smaller class has only five samples in total. After splitting,
//    how many class-1 samples are in the training set and how many
//    are in the test set? Is that enough to train and evaluate
//    reliably?
// 3. What would change if we ran the split with a different seed?
//    What would stay the same?
//
// Your answer:
//
//
//
