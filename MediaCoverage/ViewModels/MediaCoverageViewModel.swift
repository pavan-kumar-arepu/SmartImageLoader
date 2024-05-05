//
//  MediaCoverageViewModel.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 *  MediaCoverageViewModel.swift
 *
 *  Manages the data and business logic related to media coverages in the application.
 *  The MediaCoverageViewModel class conforms to the ObservableObject protocol, making it suitable for use as a SwiftUI view model.
 *  It provides methods for fetching media coverages from a service, as well as loading images for each media coverage.
 *
 *  - Author: Arepu Pavan Kumar
 */

import Foundation
import UIKit

/// Manages the data and business logic related to media coverages in the application.
class MediaCoverageViewModel: ObservableObject {
    // MARK: - Properties

    /// Published array of media coverages fetched from the service.
    @Published var mediaCoverages: [MediaCoverage] = []
    
    /// Service responsible for fetching media coverages.
    private let mediaCoverageService: MediaCoverageService
    
    /// Loader for fetching images associated with media coverages.
    private let imageLoader: ImageLoader
    
    // MARK: - Initialization
    
    /// Initializes the view model with optional parameters for the media coverage service and image loader.
    /// - Parameters:
    ///   - mediaCoverageService: Service responsible for fetching media coverages.
    ///   - imageLoader: Loader for fetching images associated with media coverages.
    init(mediaCoverageService: MediaCoverageService = MediaCoverageService(),
         imageLoader: ImageLoader = ImageLoader()) {
        self.mediaCoverageService = mediaCoverageService
        self.imageLoader = imageLoader
    }
    
    // MARK: - Public Methods
    
    /// Fetches media coverages from the service and updates the `mediaCoverages` array.
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
    
    /// Loads the image associated with the provided media coverage.
    /// - Parameters:
    ///   - mediaCoverage: The media coverage for which to load the image.
    ///   - completion: A closure to be called when the image loading is complete, passing the loaded UIImage or nil if an error occurs.
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
