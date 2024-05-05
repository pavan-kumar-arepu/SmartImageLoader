//
//  NetworkManager.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 *  NetworkManager.swift
 *
 *  Provides network services for fetching data from remote servers.
 *  The NetworkManager class conforms to the NetworkService protocol, defining methods for fetching data from a URL and handling network-related errors.
 *
 *  - Author:  Arepu Pavan Kumar
 */

import Foundation

/// Protocol for the network layer.
protocol NetworkService {
    /// Fetches data from the specified URL.
    ///
    /// - Parameters:
    ///   - url: The URL from which to fetch the data.
    ///   - completion: A closure to be executed upon completion of the data fetch operation, containing a result with either the fetched data or an error.
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

/// Provides network services for fetching data from remote servers.
class NetworkManager: NetworkService {
    // MARK: - Properties
    
    /// Shared instance of the NetworkManager.
    static let shared = NetworkManager()
    
    // MARK: - Initialization
    
    private init() {}
    
    // MARK: - Methods
    
    /// Fetches data from the specified URL using a URLSession data task.
    ///
    /// - Parameters:
    ///   - url: The URL from which to fetch the data.
    ///   - completion: A closure to be executed upon completion of the data fetch operation, containing a result with either the fetched data or an error.
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            #if DEBUG
                print("**** APK: Fetch failed ****", #function)
            #endif
                return
            }
            guard let data = data else {
                
            #if DEBUG
                print("**** APK: No data ****", #function)
            #endif
                completion(.failure(NetworkError.noData))
                return
            }
        #if DEBUG
            print("APK: Data Received", #function)
        #endif
            
            let jsonData = String(data: data, encoding: .utf8) ?? ""
        #if DEBUG
            print("APK: Data", jsonData)
        #endif
            completion(.success(data))
        }.resume()
    }
}

/// Enumeration representing network-related errors.
enum NetworkError: Error {
    /// Indicates that no data was received from the server.
    case noData
    /// Indicates that the provided URL is invalid.
    case invalidURL
}
