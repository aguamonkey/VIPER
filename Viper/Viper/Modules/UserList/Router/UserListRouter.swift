//
//  UserListRouter.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//
import UIKit

/// UserList Router implementation
/// Handles module creation and navigation
class UserListRouter: BaseRouter, UserListRouterProtocol {
    
    // MARK: - Module Creation
    static func createModule() -> UIViewController {
        // Create layers
        let view = UserListViewController()
        let presenter = UserListPresenter()
        let interactor = UserListInteractor()
        let router = UserListRouter(viewController: view)
        
        // Create data manager (using a mock implementation for now)
        let dataManager = UserListDataManager()
        
        // Connect layers
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        
        return view
    }
    
    // MARK: - Navigation
    func navigateToUserDetail(for user: User) {
        // Create UserDetail module with the selected user
        let userDetailModule = UserDetailRouter.createModule(with: user)
        push(userDetailModule)
    }
}
