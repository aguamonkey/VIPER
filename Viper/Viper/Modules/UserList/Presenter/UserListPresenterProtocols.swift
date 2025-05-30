//
//  UserListPresenterProtocols.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Protocol defining presenter's input from interactor
/// The interactor uses this to send results back to presenter
protocol UserListPresenterInputProtocol: AnyObject {
    /// Called when users are successfully fetched
    func usersFetched(_ users: [User])
    
    /// Called when fetching users fails
    func usersFetchFailed(with error: Error)
}

/// Protocol defining presenter's output to interactor
/// The presenter uses this to request business logic operations
protocol UserListPresenterOutputProtocol: AnyObject {
    /// Requests to fetch users
    func fetchUsers()
}
