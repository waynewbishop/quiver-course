// Assignment 6 — Linear Regression
//
// We have eight observations of two variables: the size of a coffee
// shop in square feet, and its monthly revenue. We suspect the two are
// related — bigger shops should generate more revenue — but we want
// to fit a line, predict revenue at a size we haven't measured, and
// evaluate how well the line actually captures the relationship.
//
// Linear regression is the simplest predictive model and the
// foundation of nearly every more sophisticated method. The fit/
// predict pattern we use here is the same pattern every Quiver
// model uses.

import Foundation
import Quiver

// Square footage (the feature) and monthly revenue in thousands
// of dollars (the target) for eight coffee shops.
let squareFootage: [Double] = [800, 1200, 1500, 1800, 2200, 2500, 2800, 3200]
let monthlyRevenue: [Double] = [42, 58, 71, 79, 95, 108, 118, 132]

// TODO 1 — Fit a linear regression model with `LinearRegression.fit`.
//          The 1D-features overload accepts `[Double]` directly, so
//          there is no need to wrap each value in an inner array.
//          Note: `fit` throws, so use `try`.
//          Print the model summary using `print(model)`.

// TODO 2 — Predict the monthly revenue for a hypothetical 2000-sqft
//          shop using `model.predict([2000.0])`. The predict method
//          takes a [Double] and returns a [Double], so unwrap with
//          `.first ?? 0` for the single prediction.

// TODO 3 — Compute predictions for the original `squareFootage` array,
//          then evaluate the model with three metrics:
//          - rSquared(actual:)         — explained variance, 0 to 1
//          - meanSquaredError(actual:) — squared error in target units²
//          - rootMeanSquaredError(actual:) — square root of MSE,
//                                            in target units (thousands)
//
//          Print all three.

// REFLECTION
//
// Look at R², MSE, and RMSE together. Answer in three to four sentences:
//
// 1. What does R² tell us about how well the line fits these points?
// 2. RMSE is in the same units as the target. What does the RMSE
//    value mean as a real-dollar prediction error?
// 3. Why is RMSE often more useful for communication than MSE,
//    even though they convey the same underlying information?
//
// Your answer:
//
//
//
