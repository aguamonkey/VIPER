# 🏗️ VIPER Architecture Pattern for iOS


A comprehensive example of VIPER architecture in Swift, demonstrating clean architecture principles and SOLID design patterns through a User Management app.

---

## 📖 Table of Contents

1. [Overview](#overview)
2. [What This App Does](#what-this-app-does)
3. [VIPER Components Explained](#viper-components-explained)
4. [Getting Started](#getting-started)
5. [Project Structure](#project-structure)
6. [How VIPER Works in This App](#how-viper-works-in-this-app)
7. [Key Implementation Details](#key-implementation-details)
8. [Testing](#testing)
9. [When to Use VIPER](#when-to-use-viper)
10. [Extending the App](#extending-the-app)
11. [Common Issues & Solutions](#common-issues--solutions)
12. [Resources](#resources)

---

## 🎯 Overview

VIPER is an architecture pattern that enforces separation of concerns by dividing your app into five distinct layers:

* **View**: Displays content and handles user input (passive, no logic)
* **Interactor**: Contains business logic independent of the UI
* **Presenter**: Mediates between View and Interactor, formats data for display
* **Entity**: Basic data models used by the Interactor
* **Router**: Handles navigation and module creation

This sample implements a user management system with a list and detail screen.

---

## 📱 What This App Does

**User List Screen**

* Shows a list of users (e.g. John Doe, Jane Smith)
* Pull-to-refresh functionality
* Loading indicator during fetch
* Tap a user to open details

**User Detail Screen**

* Displays selected user information
* Back navigation
* Ready for expansion (call/email actions)

**Data Flow**

```text
User taps refresh → View → Presenter → Interactor → DataManager
               ← results ←       ←       ←
View updates with new user list
```

---

## 🔧 VIPER Components Explained

* **View** (`UserListViewController.swift`)

  * Renders UI, handles gestures, forwards events
* **Interactor** (`UserListInteractor.swift`)

  * Contains business logic, fetches users
* **Presenter** (`UserListPresenter.swift`)

  * Orchestrates data flow, prepares data for display
* **Entity** (`User.swift`)

  ```swift
  struct User {
      let id: Int
      let name: String
      let email: String
  }
  ```
* **Router** (`UserListRouter.swift`)

  * Builds modules, handles navigation

---

## 🚀 Getting Started

### Requirements

* Xcode 14.0+
* iOS 13.0+
* Swift 5.0+

### Installation

```bash
git clone https://github.com/yourusername/VIPER.git
cd VIPER
open Viper.xcodeproj
⌘ R  # Build & run
```

### First Run

1. App opens to **User List**
2. Loading indicator appears
3. Sample users displayed
4. Tap for details
5. Pull down to refresh

---

## 📁 Project Structure

```
Viper/
├── Common/
│   ├── BaseRouter.swift
│   └── Protocols/
│       └── PresenterProtocol.swift
├── Modules/
│   ├── UserList/
│   │   ├── Entity/User.swift
│   │   ├── Interactor/
│   │   │   ├── UserListInteractor.swift
│   │   │   └── UserListInteractorProtocols.swift
│   │   ├── Presenter/
│   │   │   ├── UserListPresenter.swift
│   │   │   └── UserListPresenterProtocols.swift
│   │   ├── View/
│   │   │   ├── UserListViewController.swift
│   │   │   └── UserListViewProtocols.swift
│   │   ├── Router/
│   │   │   ├── UserListRouter.swift
│   │   │   └── UserListRouterProtocols.swift
│   │   └── DataManager/
│   │       └── UserListDataManager.swift
│   └── UserDetails/
│       ├── Protocols/UserDetailsProtocol.swift
│       └── Router/UserDetailRouter.swift
├── Services/
│   ├── NetworkService.swift
│   └── NetworkServiceProtocol.swift
├── Supporting Files/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   └── Info.plist
└── Tests/
    └── UserListPresenterTests.swift
```

---

## 🔄 How VIPER Works in This App

```swift
static func createModule() -> UIViewController {
    let view = UserListViewController()
    let presenter = UserListPresenter()
    let interactor = UserListInteractor()
    let router = UserListRouter(viewController: view)
    let dataManager = UserListDataManager()

    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    interactor.presenter = presenter
    interactor.dataManager = dataManager

    return view
}
```

---

## 🔑 Key Implementation Details

### Protocols

```swift
protocol UserListViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showUsers(_ users: [User])
}
```

### Dependency Injection

```swift
init(dataManager: UserListDataManagerProtocol = UserListDataManager()) { ... }
```

---

## 🧪 Testing

```bash
# Xcode
⌘ U
# CLI
xcodebuild test -scheme Viper -destination 'platform=iOS Simulator,name=iPhone 14'
```

Example:

```swift
func testViewDidLoad_CallsInteractorToFetchUsers() {
  // Given presenter with mock interactor
}
```

---

## 📊 When to Use VIPER

* ✅ Large apps, teams, high test coverage
* ❌ Prototypes, small apps, solo work

---

## 🔨 Extending the App

1. Create new module folder
2. Define protocols & classes
3. Wire in Router
4. Add tests

---

## 🐛 Common Issues & Solutions

* Black Screen: verify Info.plist, delegate setup
* Retain Cycles: use `weak` refs
* Cross-module calls: always use Router

---

## 📚 Resources

* [VIPER Architecture](https://www.objc.io/issues/13-architecture/viper/)
* [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)

---

*Built with ❤️ by YourName*
