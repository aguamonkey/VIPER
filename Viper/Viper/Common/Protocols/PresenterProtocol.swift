//
//  PresenterProtocol.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Base protocol for all presenters in the application
/// Adheres to the Interface Segregation Principle by defining minimal required functionality
protocol PresenterProtocol: AnyObject {
    /// Called when the view has loaded
    func viewDidLoad()
    
    /// Called when the view will appear
    func viewWillAppear()
    
    /// Called when the view will disappear
    func viewWillDisappear()
}
