# 🏗️ VIPER Architecture Pattern for iOS

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)  [![iOS](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)  [![Architecture](https://img.shields.io/badge/Architecture-VIPER-green.svg)](https://www.objc.io/issues/13-architecture/viper/)  [![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

A comprehensive example of VIPER architecture in Swift, demonstrating clean architecture principles and SOLID design patterns.

---

## 📖 Table of Contents

1. [Overview](#%EF%B8%8F-overview)
2. [Screens & Flow](#--screens--flow)
3. [Getting Started](#-getting-started)
4. [Project Structure](#-project-structure)
5. [Folder & File Guide](#-folder--file-guide)
6. [Architecture Benefits](#-architecture-benefits)
7. [SOLID Principles](#-solid-principles)
8. [Use Cases](#-use-cases)
9. [Testing](#-testing)
10. [Best Practices](#-best-practices)
11. [Extending the Architecture](#-extending-the-architecture)
12. [Contributing](#-contributing)
13. [Resources](#-resources)
14. [License](#-license)

---

## 🎯 Overview

**VIPER** stands for:

* **View**: UI layer (UIViewController, UIView)
* **Interactor**: Business logic layer
* **Presenter**: Presentation logic & formatting
* **Entity**: Data models
* **Router**: Navigation & module assembly

Clean architecture with strong separation of concerns.

---

## 🖼️ Screens & Flow

When you run the app, you’ll see:

1. **Launch Screen** → Navigation to User List
2. **User List**

   * Table view of users
   * Pull-to-refresh
   * Loading indicator
3. **User Detail**

   * Tap to view details
   * Basic alert ready for full detail implementation

---

## 🚀 Getting Started

### Requirements

* Xcode 14.0+
* iOS 13.0+
* Swift 5.0+

### Installation

```bash
git clone https://github.com/yourusername/VIPER.git
cd VIPER
open Viper.xcodeproj
```

Build and run (`⌘+R`).

---

## 📁 Project Structure

```
.
├── LICENSE
├── README.md
└── Viper
    ├── Viper
    │   ├── Assets.xcassets
    │   │   ├── AccentColor.colorset
    │   │   │   └── Contents.json
    │   │   ├── AppIcon.appiconset
    │   │   │   └── Contents.json
    │   │   └── Contents.json
    │   ├── Common
    │   │   ├── BaseRouter.swift
    │   │   └── Protocols
    │   │       └── PresenterProtocol.swift
    │   ├── Modules
    │   │   ├── UserDetails
    │   │   │   ├── Protocols
    │   │   │   │   └── UserDetailsProtocol.swift
    │   │   │   └── Router
    │   │   │       └── UserDetailRouter.swift
    │   │   └── UserList
    │   │       ├── DataManager
    │   │       │   └── UserListDataManager.swift
    │   │       ├── Entity
    │   │       │   └── User.swift
    │   │       ├── Interactor
    │   │       │   ├── UserListInteractor.swift
    │   │       │   └── UserListInteractorProtocols.swift
    │   │       ├── Presenter
    │   │       │   ├── UserListPresenter.swift
    │   │       │   └── UserListPresenterProtocols.swift
    │   │       ├── Router
    │   │       │   ├── UserListRouter.swift
    │   │       │   └── UserListRouterProtocols.swift
    │   │       └── View
    │   │           ├── UserListViewController.swift
    │   │           └── UserListViewProtocols.swift
    │   ├── Services
    │   │   ├── NetworkService.swift
    │   │   └── NetworkServiceProtocol.swift
    │   ├── Supporting Files
    │   │   ├── AppDelegate.swift
    │   │   └── SceneDelegate.swift
    │   └── Tests
    │       └── UserListPresenterTests.swift
    ├── Viper.xcodeproj
    │   ├── project.pbxproj
    │   ├── project.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   ├── xcshareddata
    │   │   │   └── swiftpm
    │   │   │       └── configuration
    │   │   └── xcuserdata
    │   │       └── aguamonkey.xcuserdatad
    │   │           └── UserInterfaceState.xcuserstate
    │   └── xcuserdata
    │       └── aguamonkey.xcuserdatad
    │           ├── xcdebugger
    │           │   └── Breakpoints_v2.xcbkptlist
    │           └── xcschemes
    │               └── xcschememanagement.plist
    └── VIPERTests
        └── VIPERTests.swift
```

---

## 📝 Folder & File Guide

1. **Common Layer**

   * `Viper/Common/Protocols/PresenterProtocol.swift`
   * `Viper/Common/BaseRouter.swift`
2. **UserDetails Module**

   * `Viper/Modules/UserDetails/Protocols/UserDetailsProtocol.swift`
   * `Viper/Modules/UserDetails/Router/UserDetailRouter.swift`
3. **UserList Module**

   * DataManager, Entity, Interactor, Presenter, Router, View files per above structure
4. **Services**
5. **Supporting Files**
6. **Tests**

---

## ⚙️ Architecture Benefits

* **Separation of Concerns**
* **Testability**
* **Scalability**
* **Reusability**
* **Parallel Development**

---

## 💡 SOLID Principles

1. **SRP**: Single responsibility per component
2. **OCP**: Open for extension, closed for modification
3. **LSP**: Protocol-driven substitution
4. **ISP**: Focused, minimal protocols
5. **DIP**: Depend on abstractions

---

## 🏭 Use Cases

Examples: E-Commerce, Banking, Social Media apps with individual VIPER modules.

---

## 🧪 Testing

Run tests with `⌘+U` or:

```bash
xcodebuild test -scheme Viper -destination 'platform=iOS Simulator,name=iPhone 14'
```

---

## 📏 Best Practices

* Keep Views passive
* Use DI
* TDD first
* Focused protocols
* Weak references

---

## 🔧 Extending Architecture

1. Create new module folder
2. Define protocols
3. Implement classes
4. Assemble with Router
5. Write tests

---

## 🤝 Contributing

1. Fork & branch
2. Commit & push
3. Open PR

---

## 📚 Resources

* [VIPER on objc.io](https://www.objc.io/issues/13-architecture/viper/)
* [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)

---

## 📝 License

MIT © aguamonkey
