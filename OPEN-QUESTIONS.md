# Open Questions — for Wayne's review on return

This is a working list of decisions that came up during the v1 build and need Wayne's input before the pack ships publicly.

## 1. Repo name discrepancy

The repo path on disk is `quiver-instruction-pack` (singular *instruction*). The planning doc at `Planning/quiver-instructor-pack.md` and all the prose this repo links to in DocC and the planning materials use `quiver-instructor-pack` (plural-flavored *instructor*).

`Package.swift` currently uses `quiver-instruction-pack` to match the actual directory.

**Decision needed:** which name ships? The prose in the planning doc, the Substack outreach plan, and the cookbook + DocC cross-references will all need to match whatever Wayne picks. Cleanest move is probably to rename the directory to `quiver-instructor-pack` before the public push to GitHub.

## 2. Python validation pass

Wayne flagged on May 5: "we'll need to run our python validation skill against all this stuff."

The seven solution files have been verified end-to-end against Quiver 1.1.0 by running each one through the Notebook sandbox at `/Users/waynebishop/Projects/quiver-notebook/sandbox/`. The actual runtime values match the inline `// expected:` comments exactly. But cross-validation against the equivalent Python implementations is a separate guarantee — confirming that, e.g., the bootstrap interval at seed 42 produces the same `[245.90, 254.10]` it would in a NumPy-based implementation.

**Action item:** run `/quiver-python-validation` (or whatever the canonical skill is called) against:
- `01-descriptive-stats-solution.swift` — mean, median, std, quartiles
- `02-outlier-detection-solution.swift` — outlierMask
- `03-histogram-shape-solution.swift` — histogram bins
- `04-bootstrap-mean-solution.swift` — resampled + percentileCI
- `05-bootstrap-median-solution.swift` — resampled with median statistic
- `06-linear-regression-solution.swift` — fit, predict, R², MSE, RMSE
- `07-stratified-split-solution.swift` — stratifiedSplit (proportions only — exact partition contents will differ across language random number generators)

Note that bootstrap and stratified-split results are seed-dependent. The Quiver and NumPy random number generators will produce different specific resamples for the same seed, so the *exact* interval bounds will differ. The validation we want is conceptual — that both implementations produce intervals of similar width centered near the same value, that R² agrees to many decimal places, that the mean/std/median computations match exactly. Set tolerances accordingly.

## 3. Quiver version pinning

The pack's `Package.swift` declares `from: "1.1.0"`. This means `swift build` will resolve to whatever 1.1.x or 1.2.x or later is current.

For a course pinning to a specific Quiver release across a semester (the pattern the Notebook documentation explicitly supports), the instructor pack should arguably also pin to a specific release rather than a minimum version. Two options:

- **Match the Notebook's pinning behavior** — use `from: "1.1.0"` and let students/instructors pin in their fork's `Package.resolved`. This is what's in the file now.
- **Pin tightly at the pack level** — use `.exact("1.1.0")` so the pack always resolves to a specific known-good version, and bump explicitly when a new Quiver release is verified against the seven assignments.

**Decision needed:** which model? Recommend the second for v1 — the assignments have been verified end-to-end against 1.1.0 specifically, and pinning prevents an instructor from being surprised by an API change in 1.2.0 that breaks an assignment mid-semester.

## 4. The Module.swift placeholder

The package's `Statistics` target needs at least one compilable Swift file. The seven assignment `.swift` files are top-level executable Swift (with `print`, `exit(0)`, redeclared identifiers like `let mean`) and cannot compile together as a library module — they collide.

The current solution: a placeholder `Module.swift` that just imports Quiver, plus all seven assignment files declared as `exclude` entries in `Package.swift`. This means `swift build` succeeds and Xcode opens the pack as a working package, but the assignments themselves are not part of the compiled module — they are independent paste-and-run programs.

**Decision needed:** is this acceptable? Two alternatives:

1. **Wrap each assignment body in a `#Playground` macro.** This was the cookbook's solution. We deliberately removed `#Playground` from the instruction pack so assignments are paste-test-compatible with the Quiver Notebook. Reverting would compromise that design choice.
2. **Make each assignment its own `executableTarget`.** Cleaner from a Swift-package perspective but adds 14 target declarations to `Package.swift` (seven starters plus seven solutions). The current placeholder approach is lighter.

I went with the placeholder because it preserves the Notebook-first design rule. If Wayne prefers individual executable targets, the change is mechanical.

## 5. The "comparison appendix" is not in this repo

Per the May 4 planning decision, the sanctioned-exception comparison appendix (the only place the pack mentions other ecosystems by name) is distributed as a separate private gist to verified instructors. It does *not* live in this repo. Li Chen still owes that single document for the Statistics course; Astrid retains distribution veto.

**Action item for Wayne's return:** confirm the gist URL once Li ships it, and add a one-line pointer to `Docs/faculty-faq.md` saying "for the comparison-to-other-software question, see the gated appendix sent to verified instructors on request."

## 6. Adoption-stories directory is empty

`Sources/Statistics/adoption-stories/` is mentioned in the planning doc as the place pilot reports get written up after fall 2026. The directory does not exist yet because there are no pilots yet.

**Decision needed:** create the empty directory now (with a placeholder `README.md` explaining it will fill post-pilot) or wait until the first pilot lands? Recommend creating it now so the structure is visible to anyone evaluating the repo, with a one-line README explaining the convention.

## 7. Do we want assignment 8?

The planning doc lists seven assignments. Building them, the natural eighth assignment that came to mind is *the bootstrap for the difference of two means* — comparing two samples (e.g., session times for an A/B test) and bootstrapping the gap. This is the clearest application of the bootstrap to a real-world A/B-test question, and it would tie the inferential block to a use case students recognize.

**Decision needed:** keep v1 at seven assignments as planned, or add an eighth? My instinct is to keep at seven — the capstone (assignment 7, stratified split) is currently the bridge to the v2 ML pack, and adding an eighth assignment between assignment 5 (bootstrap median) and assignment 6 (regression) would make the descriptive-and-inferential block longer than the planning doc budgeted for. But it's worth a thought before locking v1.

## 8. License attribution in faculty FAQ

The CC BY-NC-SA 4.0 license requires attribution. The README links to the license, but the FAQ doesn't say what attribution looks like for a fork. A typical attribution line for an academic fork might read:

> *Course materials adapted from the Quiver Instruction Pack by Wayne Bishop, https://github.com/waynewbishop/quiver-instruction-pack, used under CC BY-NC-SA 4.0.*

**Decision needed:** add an FAQ entry with this attribution template, or rely on the LICENSE pointer alone? Adding it makes life easier for faculty who fork; not adding it keeps the FAQ shorter. I'd recommend adding it as a one-paragraph entry titled "How should I credit the pack in my course materials?"
