//
//  User.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// User entity representing a user in the system
/// Follows Single Responsibility Principle - only holds user data
struct User: Codable, Equatable {
    let id: Int
    let name: String
    let email: String
    let username: String
    let phone: String?
    let website: String?
    let company: Company?
    let address: Address?
}

/// Company information for a user
struct Company: Codable, Equatable {
    let name: String
    let catchPhrase: String?
    let bs: String?
}

/// Address information for a user
struct Address: Codable, Equatable {
    let street: String
    let suite: String?
    let city: String
    let zipcode: String
    let geo: Geo?
}

/// Geographic coordinates
struct Geo: Codable, Equatable {
    let lat: String
    let lng: String
}
