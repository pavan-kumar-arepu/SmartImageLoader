//
//  MediaCoverageService.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

// MediaCoverageService.swift

import Foundation

class MediaCoverageService {
    private let networkService: NetworkService
    private let cacheService: CacheService
    
    init(networkService: NetworkService = NetworkManager.shared, cacheService: CacheService = CacheManager.shared) {
        self.networkService = networkService
        self.cacheService = cacheService
    }
    
    func fetchMediaCoverages(completion: @escaping (Result<[MediaCoverage], Error>) -> Void) {
        // Try to fetch media coverages from cache first
        cacheService.getImage(for: "mediaCoverages") { data in
            if let data = data,
               let mediaCoverages = try? JSONDecoder().decode([MediaCoverage].self, from: data) {
                completion(.success(mediaCoverages))
                return
            }
            
            // If not found in cache, fetch from API
            
            var url: URL = URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=5")!
            if let formatedURL = URL(string: Constants.serverURL + "?limit=\(Constants.limit)") {
                url = formatedURL
            }
                        
            self.networkService.fetchData(from: url) { result in
                switch result {
                case .success(let data):
                    do {
                        let mediaCoverages = try JSONDecoder().decode([MediaCoverage].self, from: data)
                        print("APK: MediaCoverage successfully Parsed!", #function)
                        // Cache the fetched media coverages
                        self.cacheService.cacheImage(data: data, for: Constants.mediaCoverages)
                        print("APK: MediaCoverage successfully Cached also!", #function)
                        completion(.success(mediaCoverages))
                    } catch {
                        print("**** APK: Oops! MediaCoverage Parse Failed!***", #function)
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print("**** APK: Oops! MediaCoverage network fetch Failed***", #function)
                    completion(.failure(error))
                }
            }
        }
    }
}
