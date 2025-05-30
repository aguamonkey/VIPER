//
//  UserListViewProtocols.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Protocol defining view's capabilities
/// The presenter uses this protocol to update the view
protocol UserListViewProtocol: AnyObject {
    /// Shows loading indicator
    func showLoading()
    
    /// Hides loading indicator
    func hideLoading()
    
    /// Updates the view with users
    func showUsers(_ users: [User])
    
    /// Shows an error message
    func showError(_ message: String)
    
    /// Shows empty state when no users available
    func showEmptyState()
}

/// Protocol defining view's output events
/// The view uses this protocol to notify the presenter of user actions
protocol UserListViewOutputProtocol: PresenterProtocol {
    /// Called when user pulls to refresh
    func refreshUsers()
    
    /// Called when user selects a user from the list
    func didSelectUser(_ user: User)
}
