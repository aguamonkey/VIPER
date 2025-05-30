//
//  NetworkService.swift
//  Viper
//
//  Created by Joshua Browne on 30/05/2025.
//

import Foundation

/// Concrete implementation of NetworkServiceProtocol
/// Handles actual network requests
class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Properties
    private let session: URLSession
    private let decoder: JSONDecoder
    
    // MARK: - Initialization
    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    // MARK: - NetworkServiceProtocol
    func get<T: Decodable>(
        url: String,
        parameters: [String: Any]?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard var urlComponents = URLComponents(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        // Add query parameters if provided
        if let parameters = parameters {
            urlComponents.queryItems = parameters.map { key, value in
                URLQueryItem(name: key, value: "\(value)")
            }
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            self?.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    func post<T: Decodable>(
        url: String,
        body: Data?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        let task = session.dataTask(with: request) { [weak self] data, response, error in
            self?.handleResponse(data: data, response: response, error: error, completion: completion)
        }
        
        task.resume()
    }
    
    // MARK: - Private Methods
    private func handleResponse<T: Decodable>(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        if let error = error {
            completion(.failure(.unknown(error)))
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            completion(.failure(.unknown(NSError(domain: "Invalid response", code: 0))))
            return
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            completion(.failure(.serverError(httpResponse.statusCode)))
            return
        }
        
        guard let data = data else {
            completion(.failure(.noData))
            return
        }
        
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(.decodingError))
        }
    }
}
