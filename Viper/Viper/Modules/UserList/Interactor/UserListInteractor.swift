//
//  UserListInteractor.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// UserList Interactor implementation
/// Contains business logic for fetching and managing users
class UserListInteractor: UserListInteractorProtocol {
    
    // MARK: - Properties
    weak var presenter: UserListPresenterInputProtocol?
    var dataManager: UserListDataManagerProtocol?
    
    // MARK: - Initialization
    init(dataManager: UserListDataManagerProtocol? = nil) {
        self.dataManager = dataManager
    }
    
    // MARK: - UserListInteractorProtocol
    func fetchUsers() {
        dataManager?.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.presenter?.usersFetched(users)
            case .failure(let error):
                self?.presenter?.usersFetchFailed(with: error)
            }
        }
    }
}
