//
//  MediaCoverageViewModel.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation
import UIKit

class MediaCoverageViewModel: ObservableObject {
    @Published var mediaCoverages: [MediaCoverage] = []
    
    private let mediaCoverageService: MediaCoverageService
    private let imageLoader: ImageLoader
    
    init(mediaCoverageService: MediaCoverageService = MediaCoverageService(), imageLoader: ImageLoader = ImageLoader()) {
        self.mediaCoverageService = mediaCoverageService
        self.imageLoader = imageLoader
    }
    
    func fetchMediaCoverages() {
        mediaCoverageService.fetchMediaCoverages { result in
            switch result {
            case .success(let coverages):
                DispatchQueue.main.async {
                    self.mediaCoverages = coverages
                }
            case .failure(let error):
                print("Failed to fetch media coverages: \(error)")
            }
        }
    }
    
    func loadImage(for mediaCoverage: MediaCoverage, completion: @escaping (UIImage?) -> Void) {
        let imageURL = mediaCoverage.imageURL
        
        imageLoader.loadImage(from: imageURL) { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    completion(image)
                }
            case .failure(let error):
                print("Failed to load image for media coverage \(mediaCoverage.id): \(error)")
                completion(nil)
            }
        }
    }
}
