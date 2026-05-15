# Instructor Guide — Assignment 6: Linear Regression

**Assignment file:** `06-linear-regression.swift`
**Solution file:** `06-linear-regression-solution.swift`
**Estimated student time:** 60–75 minutes
**Difficulty:** Intermediate (week 12)

## Learning outcome

After completing this assignment, a student can fit a linear regression model with `LinearRegression.fit`, predict on new inputs with `predict`, and evaluate model quality using R², MSE, and RMSE. The student should understand what each metric tells us — explained variance, average squared error, average error in original units — and why RMSE is the most communication-friendly of the three.

The deeper goal is the introduction of the fit/predict pattern, which is the same pattern every Quiver model uses. By the end of this assignment, students have met the workflow they will use for K-Means, K-Nearest Neighbors, and Naive Bayes in the v2 Machine Learning pack.

## Prerequisites

- Assignments 1–5 (especially the descriptive-statistics vocabulary)
- Comfort with Swift `try` and throwing functions — the assignment is the first place students encounter `try` in the curriculum
- Conceptual reading on least-squares regression (week 12 lecture material)

## What the assignment does

The student loads eight observations of square footage and monthly revenue, fits a one-feature linear regression model, predicts revenue at a square footage not in the training data, and evaluates the model with three metrics on the training data itself.

The reflection asks them to interpret R², connect RMSE to dollar error, and articulate why RMSE is preferable to MSE for communication.

## Sample student output

```
LinearRegression(featureCount: 1, intercept: ~12.0, coefficients: [~0.037])
predicted revenue at 2000 sqft: ~86.x thousand
R²:   ~0.9982
MSE:  ~2.x
RMSE: ~1.5
```

The reflection should connect R² ≈ 0.998 to "the line explains nearly all the variation," interpret RMSE ≈ 1.5 as "off by about 1,500 dollars on average," and explain that RMSE is in the original units while MSE is in squared units.

## Rubric (4-tier)

**Exemplary (90–100%)**
All numerical results correct. Reflection answers all three prompts substantively, gives the dollar interpretation of RMSE explicitly, and notes the unit-mismatch reason for preferring RMSE over MSE. Bonus credit if the student observes that R² ≈ 0.998 is suspiciously high for real-world data and notes that the dataset was constructed to be clean.

**Proficient (75–89%)**
All numerical results correct. Reflection gives the dollar interpretation of RMSE but does not explicitly contrast units with MSE.

**Developing (50–74%)**
Model fits and predicts correctly, but evaluation metrics are missing one of the three or computed against the wrong array (e.g., student passes `predictions` and `predictions` to `rSquared` rather than `predictions` and `actuals`). Reflection is brief or treats the metrics as interchangeable.

**Unsubmitted / Not yet (below 50%)**
Model fails to fit, evaluation absent, or reflection absent.

## Common student pitfalls

1. **Forgetting `try`.** `LinearRegression.fit` throws. A student who writes `let model = LinearRegression.fit(...)` without `try` gets a compile error. Reinforce that throwing functions need `try` and that the throw here is for a real reason — singular features cause the underlying matrix solve to fail.

2. **Confusing the predict overloads.** `model.predict([2000.0])` predicts on a single sample with one feature. `model.predict(squareFootage.map { [$0] })` predicts on the full training set. Some students will write `model.predict(squareFootage)` (without the map), which is a different overload taking 1D inputs as a single sample.

3. **Passing `actuals` and `predictions` in the wrong order.** The metric methods are called *on* the predictions array with `actual:` as the parameter — `predictions.rSquared(actual: monthlyRevenue)`. Some students reverse this and get nonsensical results. The convention is "metric on predictions, with actuals as comparison."

4. **Misreading R².** A student who reads R² = 0.998 as "99.8% accuracy" is conflating regression metrics with classification metrics. R² is the proportion of *variance* explained, not the proportion of predictions that are correct. The two are related but not interchangeable.

5. **Not noticing the constructed-clean nature of the data.** Real coffee shop data would have R² in the 0.4–0.7 range; this dataset has R² ≈ 0.998 because the targets are nearly perfect linear functions of the features. Students who do not flag this in the reflection have missed an opportunity to think critically about model evaluation.

## Time budget breakdown

- Reading the assignment and the data: 5 min
- Fitting the model and inspecting the printed summary: 10 min
- Single-point prediction: 10 min
- Evaluation on the training set: 15–20 min — the predictions and metrics step is the technical sticking point
- Reflection: 20 min
- Cleanup and submission: 5 min

The map-then-predict pattern for full-training-set evaluation is the part most students stumble on. Be available during the lab session.

## Problem-set extensions

1. **Real data.** Replace the constructed dataset with real coffee-shop or restaurant revenue data (publicly available aggregated datasets exist). R² will drop substantially and RMSE will rise — students see that real-world models are rarely as clean as textbook examples.

2. **Multiple features.** Add a second feature (e.g., average daily customers) and re-fit using the `[[Double]]` overload. R² typically rises slightly with each additional feature; this previews overfitting concerns covered in the v2 ML pack.

3. **Out-of-sample prediction.** Have students predict revenue for square footages well outside the training range (e.g., 5,000 sqft or 200 sqft). The prediction is a number, but is it trustworthy? This previews the extrapolation problem and motivates the train/test split in assignment 7.

## What this assignment teaches that the next one builds on

Assignment 7 (stratified split) introduces the data-preparation step that should always precede regression on real data. The contrast is deliberate: assignment 6 evaluates on the training data because the goal is metric mechanics, not generalization. Assignment 7 introduces the splitting step that makes generalization measurable. Both are necessary; neither is sufficient alone.

## Notes on grading time

A class of 30 students grades in roughly 100 minutes. Numerical results are mechanically verifiable. The reflection takes the most time — the unit-comparison prompt for MSE vs. RMSE is the one most students rush through.

## Related primer sections

For the conceptual treatment of regression, point students to <doc:Linear-Regression>. For evaluation metrics, <doc:Evaluation-Metrics> covers the same three metrics in more depth. Cookbook recipe 26 (Evaluate a Regression Model) is optional reading.
