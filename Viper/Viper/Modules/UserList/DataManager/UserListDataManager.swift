//
//  UserListDataManager.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Concrete implementation of UserListDataManagerProtocol
/// Handles data operations for the UserList module
class UserListDataManager: UserListDataManagerProtocol {
    
    // MARK: - Properties
    private let networkService: NetworkServiceProtocol
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private let useMockData: Bool
    
    // MARK: - Initialization
    init(networkService: NetworkServiceProtocol = NetworkService(), useMockData: Bool = true) {
        self.networkService = networkService
        self.useMockData = useMockData
    }
    
    // MARK: - UserListDataManagerProtocol
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        if useMockData {
            fetchMockUsers(completion: completion)
        } else {
            fetchRemoteUsers(completion: completion)
        }
    }
    
    // MARK: - Private Methods
    private func fetchRemoteUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let endpoint = "\(baseURL)/users"
        
        networkService.get(url: endpoint, parameters: nil) { (result: Result<[User], NetworkError>) in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func fetchMockUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            // Mock users data
            let users = [
                User(
                    id: 1,
                    name: "John Doe",
                    email: "john@example.com",
                    username: "johndoe",
                    phone: "123-456-7890",
                    website: "johndoe.com",
                    company: Company(name: "Acme Inc", catchPhrase: "Innovation", bs: "Tech"),
                    address: Address(
                        street: "123 Main St",
                        suite: "Apt 4",
                        city: "New York",
                        zipcode: "10001",
                        geo: Geo(lat: "40.7128", lng: "-74.0060")
                    )
                ),
                User(
                    id: 2,
                    name: "Jane Smith",
                    email: "jane@example.com",
                    username: "janesmith",
                    phone: "098-765-4321",
                    website: "janesmith.com",
                    company: Company(name: "Tech Corp", catchPhrase: "Excellence", bs: "Software"),
                    address: Address(
                        street: "456 Oak Ave",
                        suite: "Suite 200",
                        city: "San Francisco",
                        zipcode: "94102",
                        geo: Geo(lat: "37.7749", lng: "-122.4194")
                    )
                )
            ]
            
            DispatchQueue.main.async {
                completion(.success(users))
            }
        }
    }
}
