# Installation Guide

Three paths to running the instruction pack, in order of recommendation for the student-facing case.

## Path 1 — The Quiver Notebook (recommended for students)

The Notebook is a browser-based Swift editor with Quiver and a library of bundled datasets pre-imported. Students clone one repo, run one command, and arrive at the same editor as everyone else in the class.

### Prerequisites

A Mac running macOS 15 (Sequoia) or newer with the Swift command-line toolchain. The lightest way to install Swift is [`swiftly`](https://swift.org/install/), Swift's official toolchain installer:

1. Download `swiftly-1.1.1.pkg` from [download.swift.org/swiftly/darwin/swiftly-1.1.1.pkg](https://download.swift.org/swiftly/darwin/swiftly-1.1.1.pkg)
2. Double-click the installer and follow the prompts
3. Open a new terminal tab and run:

   ```bash
   ~/.swiftly/bin/swiftly init
   ```

4. Confirm the install:

   ```bash
   swift --version
   ```

### Running the Notebook

```bash
git clone https://github.com/waynewbishop/quiver-notebook
cd quiver-notebook
swift run
```

Open `http://localhost:8080` in a browser. The first launch compiles the libraries and the editor, which takes a minute or two on most machines. Every launch after that starts in seconds.

### Running an instruction-pack assignment in the Notebook

After cloning the instruction pack separately:

```bash
git clone https://github.com/waynewbishop/quiver-instruction-pack.git
```

Open the assignment file (e.g. `Sources/Statistics/01-descriptive-stats.swift`) in any text editor, copy the contents, paste into the Notebook editor, and press Cmd+Enter. The assignment compiles and runs against Quiver as if it were a Notebook example.

## Path 2 — Xcode 26+ (recommended for instructors and TAs)

Xcode gives instructors full IDE support — autocomplete, inline errors, jump-to-definition, source-control diff. This is the most efficient path for authoring new assignments, debugging reference solutions, or comparing student submissions against the answer key.

### Steps

1. Install Xcode 26 or newer from the Mac App Store
2. Clone the instruction pack:

   ```bash
   git clone https://github.com/waynewbishop/quiver-instruction-pack.git
   ```

3. Open `Package.swift` in Xcode (File → Open, select the `Package.swift` file)
4. Wait for Xcode to resolve the Quiver package dependency on first open
5. Open any assignment file in `Sources/Statistics/` and run it with the Run button or Cmd+R

The instruction pack and the Quiver Notebook can both live on the same machine without conflict — the Notebook is one repo, the instruction pack is a separate one, and they share the same Quiver dependency.

## Path 3 — `swift run` from the command line

For instructors or students on Linux, or those who prefer a terminal workflow over an IDE:

```bash
git clone https://github.com/waynewbishop/quiver-instruction-pack.git
cd quiver-instruction-pack
swift build
```

Each assignment file is plain top-level Swift, so it can be run directly with `swift` once the Statistics target is configured. The cleanest pattern for a terminal workflow is to copy an assignment file into a temporary script and run it:

```bash
cp Sources/Statistics/01-descriptive-stats.swift /tmp/run.swift
swift /tmp/run.swift
```

Or, for instructors authoring new assignments, edit a file in `Sources/Statistics/` directly and run `swift build` to confirm it compiles before distributing it to a class.

## What if `swift run` fails on first launch?

The most common cause is a Swift toolchain version mismatch. Confirm the version:

```bash
swift --version
```

The instruction pack and the Quiver Notebook both require Swift 5.9 or newer. If `swiftly` was installed but the shell does not pick up the new `swift` binary, open a new terminal tab — `swiftly init` configures the shell, but only new shells inherit the configuration.

For department-managed machines where students cannot install a custom Swift toolchain, the IT-friendly path is to install Xcode (which bundles the Swift toolchain) and use Path 2. Xcode does not require admin rights for daily use after the initial install.
