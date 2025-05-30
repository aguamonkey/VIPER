//
//  UserDetailRouter.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import UIKit

/// UserDetail Router implementation
class UserDetailRouter: BaseRouter, UserDetailRouterProtocol {
    
    // MARK: - Module Creation
    static func createModule(with user: User) -> UIViewController {
        // Create layers
        let view = UserDetailViewController()
        let presenter = UserDetailPresenter()
        let interactor = UserDetailInteractor()
        let router = UserDetailRouter(viewController: view)
        
        // Connect layers
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.user = user
        interactor.presenter = presenter
        
        return view
    }
    
    // MARK: - Navigation
    func navigateBack() {
        pop()
    }
    
    func openPhone(_ phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
        UIApplication.shared.open(url)
    }
    
    func openEmail(_ email: String) {
        guard let url = URL(string: "mailto:\(email)") else { return }
        UIApplication.shared.open(url)
    }
    
    func openWebsite(_ urlString: String) {
        var formattedURL = urlString
        if !urlString.hasPrefix("http://") && !urlString.hasPrefix("https://") {
            formattedURL = "https://\(urlString)"
        }
        guard let url = URL(string: formattedURL) else { return }
        UIApplication.shared.open(url)
    }
}

/// UserDetail Presenter implementation
class UserDetailPresenter {
    weak var view: UserDetailViewProtocol?
    var interactor: UserDetailInteractorProtocol?
    var router: UserDetailRouterProtocol?
    var user: User?
    
    private func displayUser() {
        guard let user = user else { return }
        view?.showUserDetails(user)
    }
}

extension UserDetailPresenter: UserDetailViewOutputProtocol {
    func viewDidLoad() {
        displayUser()
    }
    
    func viewWillAppear() {}
    func viewWillDisappear() {}
    
    func backButtonTapped() {
        router?.navigateBack()
    }
    
    func callButtonTapped() {
        guard let phone = user?.phone else { return }
        router?.openPhone(phone)
    }
    
    func emailButtonTapped() {
        guard let email = user?.email else { return }
        router?.openEmail(email)
    }
    
    func websiteButtonTapped() {
        guard let website = user?.website else { return }
        router?.openWebsite(website)
    }
}

extension UserDetailPresenter: UserDetailPresenterInputProtocol {
    func userDetailsFetched(_ user: User) {
        self.user = user
        view?.hideLoading()
        view?.showUserDetails(user)
    }
    
    func userDetailsFetchFailed(with error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}

/// UserDetail Interactor implementation
class UserDetailInteractor: UserDetailInteractorProtocol {
    weak var presenter: UserDetailPresenterInputProtocol?
    
    func fetchUserDetails(for userId: Int) {
        // In a real app, this would fetch additional details from API
        // For this example, we'll just use the existing user data
    }
}

/// UserDetail View implementation (basic example)
class UserDetailViewController: UIViewController {
    var presenter: UserDetailViewOutputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoad()
    }
}

extension UserDetailViewController: UserDetailViewProtocol {
    func showUserDetails(_ user: User) {
        title = user.name
        // Implementation would show user details in UI
    }
    
    func showLoading() {
        // Show loading indicator
    }
    
    func hideLoading() {
        // Hide loading indicator
    }
    
    func showError(_ message: String) {
        // Show error alert
    }
}
