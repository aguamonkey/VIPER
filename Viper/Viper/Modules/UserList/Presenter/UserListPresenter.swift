//
//  UserListPresenter.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// UserList Presenter implementation
/// Mediates between View and Interactor, handles presentation logic
class UserListPresenter {
    
    // MARK: - Properties
    weak var view: UserListViewProtocol?
    var interactor: UserListInteractorProtocol?
    var router: UserListRouterProtocol?
    
    // MARK: - Private Methods
    private func loadUsers() {
        view?.showLoading()
        interactor?.fetchUsers()
    }
}

// MARK: - UserListViewOutputProtocol
extension UserListPresenter: UserListViewOutputProtocol {
    func viewDidLoad() {
        loadUsers()
    }
    
    func viewWillAppear() {
        // Handle any view appearance logic if needed
    }
    
    func viewWillDisappear() {
        // Handle any view disappearance logic if needed
    }
    
    func refreshUsers() {
        interactor?.fetchUsers()
    }
    
    func didSelectUser(_ user: User) {
        router?.navigateToUserDetail(for: user)
    }
}

// MARK: - UserListPresenterInputProtocol
extension UserListPresenter: UserListPresenterInputProtocol {
    func usersFetched(_ users: [User]) {
        view?.hideLoading()
        
        if users.isEmpty {
            view?.showEmptyState()
        } else {
            view?.showUsers(users)
        }
    }
    
    func usersFetchFailed(with error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
