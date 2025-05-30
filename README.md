🏗️ VIPER Architecture Pattern for iOS
Show Image
Show Image
Show Image
Show Image
A comprehensive example of VIPER architecture implementation in Swift, demonstrating clean architecture principles and SOLID design patterns.
📱 What You'll See When Running
When you run this app, you'll see:

Launch Screen → Navigation Controller with UserList
User List Screen:

Table view showing a list of users
Pull-to-refresh functionality
Loading indicator during data fetch
Each cell shows user name and email


User Selection:

Tap any user to navigate to detail screen
Currently shows basic alert (ready for full detail implementation)



Screenshots Flow:
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   Loading...    │ --> │   User List     │ --> │  User Details   │
│                 │     │ ┌─────────────┐ │     │                 │
│       ⟳         │     │ │ John Doe    │ │     │  Name: John     │
│                 │     │ │ john@...    │ │     │  Email: ...     │
│                 │     │ ├─────────────┤ │     │  [Call] [Email] │
└─────────────────┘     │ │ Jane Smith  │ │     └─────────────────┘
                        │ │ jane@...    │ │
                        │ └─────────────┘ │
                        └─────────────────┘
🎯 Overview
VIPER stands for:

View: UI layer (UIViewController, UIView)
Interactor: Business logic layer
Presenter: Presentation logic & formatting
Entity: Data models
Router: Navigation & module assembly

🚀 Getting Started
Requirements

Xcode 14.0+
iOS 13.0+
Swift 5.0+

Installation

Clone the repository:

bashgit clone https://github.com/yourusername/VIPER.git
cd VIPER

Open in Xcode:

bashopen Viper.xcodeproj

Build and run (⌘+R)

📁 Complete File Structure
Create the following folder structure in your Xcode project:
VIPER/
├── 📂 Common/
│   ├── 📂 Protocols/
│   │   └── 📄 PresenterProtocol.swift
│   └── 📄 BaseRouter.swift
│
├── 📂 Modules/
│   ├── 📂 UserList/
│   │   ├── 📂 Entity/
│   │   │   └── 📄 User.swift
│   │   ├── 📂 Interactor/
│   │   │   ├── 📄 UserListInteractor.swift
│   │   │   └── 📄 UserListInteractorProtocols.swift
│   │   ├── 📂 Presenter/
│   │   │   ├── 📄 UserListPresenter.swift
│   │   │   └── 📄 UserListPresenterProtocols.swift
│   │   ├── 📂 View/
│   │   │   ├── 📄 UserListViewController.swift
│   │   │   └── 📄 UserListViewProtocols.swift
│   │   ├── 📂 Router/
│   │   │   ├── 📄 UserListRouter.swift
│   │   │   └── 📄 UserListRouterProtocols.swift
│   │   └── 📂 DataManager/
│   │       └── 📄 UserListDataManager.swift
│   │
│   └── 📂 UserDetail/
│       ├── 📂 Router/
│       │   └── 📄 UserDetailRouter.swift
│       └── 📂 Protocols/
│           └── 📄 UserDetailProtocols.swift
│
├── 📂 Services/
│   ├── 📄 NetworkService.swift
│   └── 📄 NetworkServiceProtocol.swift
│
├── 📂 Tests/
│   └── 📄 UserListPresenterTests.swift
│
├── 📂 Supporting Files/
│   ├── 📄 AppDelegate.swift
│   ├── 📄 SceneDelegate.swift
│   └── 📄 Info.plist
│
└── 📄 README.md
📝 File Placement Guide
Step 1: Create the folder structure

Right-click on your project in Xcode
Select "New Group" for each folder
Name them according to the structure above

Step 2: Add files to correct locations
Place each file in its corresponding folder:
Common Layer:

Common/Protocols/PresenterProtocol.swift
Common/BaseRouter.swift

UserList Module:

Modules/UserList/Entity/User.swift
Modules/UserList/Interactor/UserListInteractor.swift
Modules/UserList/Interactor/UserListInteractorProtocols.swift
Modules/UserList/Presenter/UserListPresenter.swift
Modules/UserList/Presenter/UserListPresenterProtocols.swift
Modules/UserList/View/UserListViewController.swift
Modules/UserList/View/UserListViewProtocols.swift
Modules/UserList/Router/UserListRouter.swift
Modules/UserList/Router/UserListRouterProtocols.swift
Modules/UserList/DataManager/UserListDataManager.swift

UserDetail Module:

Modules/UserDetail/Router/UserDetailRouter.swift
Modules/UserDetail/Protocols/UserDetailProtocols.swift

Services:

Services/NetworkService.swift
Services/NetworkServiceProtocol.swift

Tests:

Tests/UserListPresenterTests.swift

Supporting Files:

Supporting Files/AppDelegate.swift
Supporting Files/SceneDelegate.swift

🔧 Architecture Benefits
✅ Advantages

Separation of Concerns: Each component has a single responsibility
Testability: All components can be tested in isolation
Scalability: Easy to add features without affecting existing code
Reusability: Components can be reused across modules
Team Collaboration: Clear boundaries enable parallel development

⚠️ Considerations

Complexity: More files and protocols than simpler architectures
Learning Curve: Requires understanding of all components
Boilerplate: Initial setup requires more code

💡 SOLID Principles Implementation
1️⃣ Single Responsibility Principle
Each component has one job:

View: Display data & capture user input
Presenter: Format data for display
Interactor: Execute business logic
Router: Handle navigation

2️⃣ Open/Closed Principle

Components are open for extension via protocols
Closed for modification (changes don't break existing code)

3️⃣ Liskov Substitution Principle

All components depend on protocols, not concrete implementations
Any implementation conforming to protocol can be substituted

4️⃣ Interface Segregation Principle

Focused protocols for each component's needs
No "fat" interfaces with unused methods

5️⃣ Dependency Inversion Principle

High-level modules don't depend on low-level modules
Both depend on abstractions (protocols)

🏭 Production Use Cases
1. E-Commerce App
Modules/
├── ProductList/      # Browse products
├── ProductDetail/    # View details
├── Cart/            # Shopping cart
├── Checkout/        # Payment flow
└── UserProfile/     # Account management
2. Banking App
Modules/
├── Dashboard/       # Account overview
├── Transactions/    # Transaction history
├── Transfer/        # Money transfers
├── Cards/          # Card management
└── Settings/       # App preferences
3. Social Media App
Modules/
├── Feed/           # Content feed
├── Profile/        # User profiles
├── Messages/       # Direct messaging
├── Stories/        # Story viewer
└── Settings/       # Privacy controls
🧪 Testing
Setting up Tests

File → New → Target → Unit Testing Bundle
Name it "VIPERTests"
Ensure the test file imports: @testable import Viper

Run tests with ⌘+U or:
bashxcodebuild test -scheme Viper -destination 'platform=iOS Simulator,name=iPhone 14'
Test Coverage

✅ Presenter logic
✅ Interactor business rules
✅ Router navigation
✅ View updates

📚 Best Practices
Do's ✅

Keep Views passive (no business logic)
Use dependency injection
Write tests first (TDD)
Keep protocols focused
Use weak references to avoid retain cycles

Don'ts ❌

Don't put business logic in Views
Don't let components know about non-adjacent layers
Don't create "God" classes
Don't skip writing tests

🛠️ Extending the Architecture
Adding a New Module

Create module folder structure:

bashModules/NewFeature/
├── Entity/
├── Interactor/
├── Presenter/
├── View/
└── Router/

Define protocols for each component
Implement concrete classes
Connect via Router's createModule()
Write unit tests

Adding Services

Create protocol in Services/
Implement concrete class
Inject via initializer
Mock for testing

🔄 Mock vs Real Data
The UserListDataManager supports both mock and real API data:
swift// For development/testing (mock data)
let dataManager = UserListDataManager(useMockData: true)

// For production (real API)
let dataManager = UserListDataManager(useMockData: false)
🤝 Contributing

Fork the repository
Create your feature branch (git checkout -b feature/AmazingFeature)
Commit changes (git commit -m 'Add some AmazingFeature')
Push to branch (git push origin feature/AmazingFeature)
Open a Pull Request

📖 Resources

VIPER Architecture
Clean Architecture
SOLID Principles
iOS Architecture Patterns

📝 License
This project is available under the MIT license. See the LICENSE file for more info.

Built with ❤️ for the iOS community
