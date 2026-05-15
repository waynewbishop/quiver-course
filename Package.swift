// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "quiver-instruction-pack",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/waynewbishop/quiver.git", from: "1.1.0")
    ],
    targets: [
        // The Statistics target compiles a placeholder Module.swift so the
        // Quiver dependency resolves on `swift build` and Xcode opens the
        // pack as a working Swift Package. The assignment .swift files
        // themselves are excluded from compilation — each one is an
        // independent top-level program designed to be pasted into the
        // Quiver Notebook editor (or run individually with
        // `swift /path/to/01-descriptive-stats.swift`), not compiled
        // together as a single module.
        .target(
            name: "Statistics",
            dependencies: [
                .product(name: "Quiver", package: "quiver")
            ],
            exclude: [
                "README.md",
                "syllabus-14-week.md",
                "first-lecture-outline.md",
                "01-descriptive-stats.swift",
                "01-descriptive-stats-solution.swift",
                "01-descriptive-stats-guide.md",
                "02-outlier-detection.swift",
                "02-outlier-detection-solution.swift",
                "02-outlier-detection-guide.md",
                "03-histogram-shape.swift",
                "03-histogram-shape-solution.swift",
                "03-histogram-shape-guide.md",
                "04-bootstrap-mean.swift",
                "04-bootstrap-mean-solution.swift",
                "04-bootstrap-mean-guide.md",
                "05-bootstrap-median.swift",
                "05-bootstrap-median-solution.swift",
                "05-bootstrap-median-guide.md",
                "06-linear-regression.swift",
                "06-linear-regression-solution.swift",
                "06-linear-regression-guide.md",
                "07-stratified-split.swift",
                "07-stratified-split-solution.swift",
                "07-stratified-split-guide.md"
            ]
        )
    ]
)
