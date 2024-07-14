//
//  MediaCoverageService.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

// MediaCoverageService.swift

import Foundation
/**
 *  MediaCoverageService.swift
 *
 *  Provides methods for fetching media coverages from a remote API and caching them locally for efficient retrieval.
 *  The MediaCoverageService class encapsulates network requests for fetching data and caching mechanisms for storing retrieved media coverages.
 *
 *  - Author: Arepu Pavan Kumar
 */

/// Protocol defining the requirements for a media coverage service.
protocol MediaCoverageServiceProtocol {
    /// Fetches media coverages from the remote API.
    ///
    /// - Parameter completion: A closure to be executed upon completion of the fetch operation, containing a result with either the fetched media coverages or an error.
    func fetchMediaCoverages(completion: @escaping (Result<[MediaCoverage], Error>) -> Void)
}

/// Provides methods for fetching media coverages from a remote API and caching them locally for efficient retrieval.
class MediaCoverageService: MediaCoverageServiceProtocol {
    // MARK: - Properties
    
    /// The network service responsible for fetching data from the remote API.
    private let networkService: NetworkService
    
    /// The cache service responsible for storing and retrieving cached media coverages.
    private let cacheService: CacheService
    
    // MARK: - Initialization
    
    /// Initializes a MediaCoverageService object with optional network and cache services.
    ///
    /// - Parameters:
    ///   - networkService: The network service to use for fetching data. Default value is an instance of NetworkManager.
    ///   - cacheService: The cache service to use for storing and retrieving cached media coverages. Default value is an instance of CacheManager.
    init(networkService: NetworkService = NetworkManager.shared, cacheService: CacheService = CacheManager.shared) {
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    // MARK: - Methods
    
    /// Fetches media coverages from the remote API and caches them locally if not found in the cache.
    ///
    /// - Parameter completion: A closure to be executed upon completion of the fetch operation, containing a result with either the fetched media coverages or an error.
    func fetchMediaCoverages(completion: @escaping (Result<[MediaCoverage], Error>) -> Void) {
        // Try to fetch media coverages from cache first
        cacheService.getImage(for: "mediaCoverages") { data in


            if let data = data,
               let mediaCoverages = try? JSONDecoder().decode([MediaCoverage].self, from: data) {
                completion(.success(mediaCoverages))
                return
            }
            
            // If not found in cache, fetch from API
            var url: URL = URL(string:  Constants.serverURL )!

            if let formattedURL = URL(string: Constants.serverURL + "?limit=\(Constants.limit)") {
                url = formattedURL
            }
            
            
            self.networkService.fetchData(from: url) { result in
                print(url)

                switch result {
                case .success(let data):
                    do {
                        let mediaCoverages = try JSONDecoder().decode([MediaCoverage].self, from: data)
                    #if DEBUG
                        print("APK: MediaCoverage successfully parsed!", #function)
                    #endif
                        // Cache the fetched media coverages
                        self.cacheService.cacheImage(data: data, for: Constants.mediaCoverages)
                    #if DEBUG
                        print("APK: MediaCoverage successfully cached!", #function)
                    #endif
                        completion(.success(mediaCoverages))
                    } catch {
                    #if DEBUG
                        let jsonData = String(data: data, encoding: .utf8) ?? ""
                        
                        print("**** APK: Oops! MediaCoverage parse failed! ***", #function, jsonData)
                    #endif
                        completion(.failure(error))
                    }
                case .failure(let error):
                    #if DEBUG
                        print("**** APK: Oops! MediaCoverage network fetch failed! ***", #function)
                    #endif
                    completion(.failure(error))
                }
            }
        }
    }
}
