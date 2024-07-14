//
//  ImageLoader.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 *  ImageLoader.swift
 *
 *  Provides functionality for asynchronously loading images from remote URLs.
 *  The ImageLoader class encapsulates URLSession data tasks for fetching image data and converting it into UIImage objects.
 *
 *  - Author:  Arepu Pavan Kumar
 */

import UIKit

/// Provides functionality for asynchronously loading images from remote URLs.
class ImageLoader {
    // MARK: - Properties
    
    /// The URLSession used for data tasks.
    private let session: URLSession
    
    // MARK: - Initialization
    
    /// Initializes an ImageLoader object with a URLSession.
    ///
    /// - Parameter session: The URLSession to use for data tasks. Default value is URLSession.shared.
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    // MARK: - Methods
    
    /// Asynchronously loads an image from the specified URL.
    ///
    /// - Parameters:
    ///   - url: The URL from which to load the image.
    ///   - completion: A closure to be executed upon completion of the image loading operation, containing a result with either the loaded UIImage or an error.
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        print("ImageURL", url)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                let decodingError = NSError(domain: "com.example.ImageLoader", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to decode image data"])
                completion(.failure(decodingError))
                return
            }
            
            completion(.success(image))
        }
        task.resume()
    }
}
