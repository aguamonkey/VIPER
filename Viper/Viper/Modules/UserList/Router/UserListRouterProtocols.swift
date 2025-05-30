//
//  UserListRouterProtocols.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import UIKit

/// Protocol defining router's navigation capabilities
protocol UserListRouterProtocol: AnyObject {
    /// Creates and returns the UserList module
    static func createModule() -> UIViewController
    
    /// Navigates to user detail screen
    func navigateToUserDetail(for user: User)
}
