//
//  NetworkManager.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation

// Protocol for the network layer
protocol NetworkService {
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

class NetworkManager: NetworkService {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print("**** APK: Fetch failed ****", #function)
                return
            }
            guard let data = data else {
                print("**** APK: No data ****", #function)
                completion(.failure(NetworkError.noData))
                return
            }
            print("APK: Data Received", #function)
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
    case invalidURL
}
