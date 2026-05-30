# TaskFlow

A lightweight iOS task manager built to demonstrate test-driven development with SwiftUI, XCTest, and CI automation.

---

## Overview

TaskFlow is a simple to-do application that lets users add, complete, and delete tasks. It exists primarily as a testing showcase — the codebase is structured to illustrate clean separation between the data model, business logic, and UI layers, making it straightforward to write meaningful unit and UI tests. It was built as a portfolio project to demonstrate iOS testing practices to technical reviewers.

---

## App Features

- **Add tasks** — create a new task by entering a title and tapping Add
- **Complete tasks** — toggle a task's completion status with a tap
- **Delete tasks** — swipe to remove tasks from the list

---

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift 5 |
| UI Framework | SwiftUI |
| Unit Testing | XCTest |
| UI Testing | XCUITest |
| CI/CD | GitHub Actions |

---

## Project Structure

```
TaskFlow/
├── TaskFlow/
│   ├── Task.swift                          # Data model
│   ├── TaskViewModel.swift                 # Business logic
│   └── ContentView.swift                   # SwiftUI UI
├── TaskFlowTests/
│   └── TaskFlowTests.swift                 # 6 unit tests
├── TaskFlowUITests/
│   └── TaskFlowUITests.swift               # 2 UI tests
└── .github/
    └── workflows/
        └── ci.yml                          # CI pipeline
```

**`Task.swift`** — defines the `Task` struct with `id`, `title`, and `isCompleted` properties. Conforms to `Identifiable` for use in SwiftUI lists.

**`TaskViewModel.swift`** — an `ObservableObject` that owns the task array and exposes `addTask(_:)`, `toggleComplete(task:)`, and `deleteTask(at:)` methods. All business logic lives here, keeping views thin.

**`ContentView.swift`** — the root SwiftUI view. Binds to `TaskViewModel` and renders the task list, a text field for new task input, and an Add button.

**`TaskFlowTests/TaskFlowTests.swift`** — six unit tests that exercise `TaskViewModel` in isolation, with no UI or simulator required.

**`TaskFlowUITests/TaskFlowUITests.swift`** — two end-to-end UI tests that launch the app in the simulator and interact with it the way a real user would.

**`.github/workflows/ci.yml`** — GitHub Actions workflow that triggers on every push to `main`, builds the project, and runs the full test suite.

---

## Test Coverage

### Unit Tests (`TaskFlowTests`)

| Test | Validates |
|---|---|
| `testAddTask` | Calling `addTask(_:)` appends a task with the correct title |
| `testAddEmptyTask` | Empty or whitespace-only input is rejected and no task is added |
| `testToggleComplete` | `toggleComplete(task:)` flips `isCompleted` from `false` to `true` |
| `testToggleCompleteTwice` | Toggling twice returns the task to its original `isCompleted` state |
| `testDeleteTask` | `deleteTask(at:)` removes the correct task and reduces the count by one |
| `testAddMultipleTasks` | Adding several tasks in sequence produces the correct count and order |

### UI Tests (`TaskFlowUITests`)

| Test | Validates |
|---|---|
| `testAddTaskAppearsInList` | Typing a title and tapping Add renders the new task in the list |
| `testAddEmptyTaskDoesNotAppear` | Submitting an empty title leaves the list unchanged |

---

## Getting Started

**Prerequisites:** Xcode 15+, iOS 17 SDK

```bash
# 1. Clone the repository
git clone https://github.com/your-username/TaskFlow.git
cd TaskFlow

# 2. Open in Xcode
open TaskFlow.xcodeproj
```

- **Run the app:** `Cmd + R`
- **Run all tests:** `Cmd + U`

No external dependencies or package manager setup required.

---

## CI

Every push to `main` triggers a GitHub Actions workflow that:

1. Checks out the repository on a macOS runner
2. Builds the app for the iOS simulator
3. Runs all 6 unit tests and 2 UI tests via `xcodebuild test`

This ensures the full test suite passes on every change without any manual intervention. Build and test status is visible directly on the repository's Actions tab.
