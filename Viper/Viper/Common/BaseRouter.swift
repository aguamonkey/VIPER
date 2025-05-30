//
//  BaseRouter.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import UIKit

/// Base router class that all routers inherit from
/// Implements common navigation functionality
class BaseRouter {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    /// Presents a view controller modally
    func present(_ module: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController?.present(module, animated: animated, completion: completion)
    }
    
    /// Pushes a view controller onto the navigation stack
    func push(_ module: UIViewController, animated: Bool = true) {
        guard let navigationController = viewController?.navigationController else {
            print("Warning: No navigation controller found")
            return
        }
        navigationController.pushViewController(module, animated: animated)
    }
    
    /// Dismisses the current view controller
    func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController?.dismiss(animated: animated, completion: completion)
    }
    
    /// Pops the current view controller from navigation stack
    func pop(animated: Bool = true) {
        viewController?.navigationController?.popViewController(animated: animated)
    }
}
