//
//  MediaCoverageService.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation

class MediaCoverageService {
    private let networkManager = NetworkManager.shared
    
    func fetchMediaCoverages(completion: @escaping (Result<[MediaCoverage], Error>) -> Void) {
        guard let url = URL(string: "https://acharyaprashant.org/api/v2/content/misc/media-coverages?limit=100") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        networkManager.fetchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let mediaCoverages = try JSONDecoder().decode([MediaCoverage].self, from: data)
                    completion(.success(mediaCoverages))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
