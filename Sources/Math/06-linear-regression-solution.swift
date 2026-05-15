// Assignment 6 — Linear Regression — Reference Solution

import Foundation
import Quiver

let squareFootage: [Double] = [800, 1200, 1500, 1800, 2200, 2500, 2800, 3200]
let monthlyRevenue: [Double] = [42, 58, 71, 79, 95, 108, 118, 132]

// Fit the model. `fit` is throwing because the underlying solver can
// fail when features are linearly dependent — for one-feature problems
// that means a constant input, which is not the case here.
let model = try LinearRegression.fit(features: squareFootage, targets: monthlyRevenue)
print(model)
// expected: LinearRegression: 1 feature, intercept: 12.90, slope: 0.04

// Predict revenue at 2000 sqft.
let predicted = model.predict([2000.0]).first ?? 0
print("predicted revenue at 2000 sqft: \(String(format: "%.2f", predicted)) thousand")
// expected: 87.88 thousand

// Evaluate on the training data.
let predictions = model.predict(squareFootage.map { [$0] })

let r2 = predictions.rSquared(actual: monthlyRevenue)
let mse = predictions.meanSquaredError(actual: monthlyRevenue)
let rmse = predictions.rootMeanSquaredError(actual: monthlyRevenue)

print("R²:   \(String(format: "%.4f", r2))")
// expected: 0.9987 — the line fits this data extremely well
print("MSE:  \(String(format: "%.4f", mse))")
// expected: 1.1249 — small, in (thousands of dollars)²
print("RMSE: \(String(format: "%.4f", rmse))")
// expected: 1.0606 — average prediction error of about 1,060 dollars

// REFLECTION
//
// 1. The R² of about 0.998 means the linear model explains roughly
//    99.8% of the variation in monthly revenue. That is an unusually
//    high R² and reflects the fact that this dataset was constructed
//    to follow a clean linear relationship; real-world coffee shop
//    data would have lower R² because location, hours, staffing, and
//    pricing all contribute beyond square footage.
//
// 2. RMSE is in thousands of dollars (the target units). An RMSE of
//    1.5 means the model's predictions are off by about 1,500 dollars
//    on average. For a business deciding whether to expand into a
//    larger space, a 1,500-dollar uncertainty on a 100,000-dollar
//    monthly revenue prediction is small enough to be useful.
//
// 3. RMSE is more useful for communication because it is in the
//    original units. MSE is in (thousands)², which has no intuitive
//    real-world meaning. We can say "the model is off by about 1,500
//    dollars" but cannot easily say what "MSE of 2.25 thousand
//    squared" means to a non-technical audience. The square-root
//    step undoes the squaring that MSE performs to make negative
//    and positive errors comparable.
