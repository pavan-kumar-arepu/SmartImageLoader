//
//  ImageLoader.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//


import UIKit

class ImageLoader {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func loadImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
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
