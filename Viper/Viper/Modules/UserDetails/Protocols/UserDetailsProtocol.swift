//
//  UserDetailsProtocol.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation
import UIKit

// MARK: - View Protocols
protocol UserDetailViewProtocol: AnyObject {
    func showUserDetails(_ user: User)
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
}

protocol UserDetailViewOutputProtocol: PresenterProtocol {
    func backButtonTapped()
    func callButtonTapped()
    func emailButtonTapped()
    func websiteButtonTapped()
}

// MARK: - Presenter Protocols
protocol UserDetailPresenterInputProtocol: AnyObject {
    func userDetailsFetched(_ user: User)
    func userDetailsFetchFailed(with error: Error)
}

protocol UserDetailPresenterOutputProtocol: AnyObject {
    func fetchUserDetails(for userId: Int)
}

// MARK: - Interactor Protocol
protocol UserDetailInteractorProtocol: UserDetailPresenterOutputProtocol {
    var presenter: UserDetailPresenterInputProtocol? { get set }
}

// MARK: - Router Protocol
protocol UserDetailRouterProtocol: AnyObject {
    static func createModule(with user: User) -> UIViewController
    func navigateBack()
    func openPhone(_ phoneNumber: String)
    func openEmail(_ email: String)
    func openWebsite(_ url: String)
}
