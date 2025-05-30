//
//  NetworkServiceProtocol.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Protocol defining network service capabilities
/// Follows Interface Segregation Principle
protocol NetworkServiceProtocol: AnyObject {
    /// Performs a GET request
    func get<T: Decodable>(
        url: String,
        parameters: [String: Any]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
    
    /// Performs a POST request
    func post<T: Decodable>(
        url: String,
        body: Data?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

/// Network error types
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    case unknown(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingError:
            return "Failed to decode response"
        case .serverError(let code):
            return "Server error: \(code)"
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
