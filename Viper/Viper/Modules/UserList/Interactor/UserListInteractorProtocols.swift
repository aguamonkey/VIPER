//
//  UserListInteractorProtocols.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Protocol defining interactor's capabilities
/// Inherits from presenter output to maintain contract
protocol UserListInteractorProtocol: UserListPresenterOutputProtocol {
    var presenter: UserListPresenterInputProtocol? { get set }
}

/// Protocol for data manager/service layer
/// Abstracts the data source from the interactor
protocol UserListDataManagerProtocol: AnyObject {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
