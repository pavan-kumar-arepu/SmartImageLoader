//
//  ImageModel.swift
//  SmartImageLoader
//
//  Created by Pavankumar Arepu on 04/05/24.
//

import Foundation

/* Sample JSON for creating the Model
 {
     "id": "coverage-4de2b2",
     "title": "Redefining Feminism",
     "language": "english",
     "thumbnail": {
       "id": "img-c7d089b3-8be2-4b25-acdd-25b50a1d683b",
       "version": 1,
       "domain": "https://cimg.acharyaprashant.org",
       "basePath": "images/img-c7d089b3-8be2-4b25-acdd-25b50a1d683b",
       "key": "image.jpg",
       "qualities": [
         10,
         20,
         30,
         40
       ],
       "aspectRatio": 1
     },
     "mediaType": 2,
     "coverageURL": "https://cimg.acharyaprashant.org/images/img-c547ce54-1ab5-4cbb-989c-9186f663954e/40/image.jpg",
     "publishedAt": "2024-04-26",
     "publishedBy": "The New Indian Express"
   },
 */
struct ImageModel: Codable, Identifiable {
    let id: String
    let title: String
    let imageURL: URL
    let publishedAt: Date
    let publishedBy: String
    let thumbnail: Thumbnail
        
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case thumbnail
        case publishedAt
        case publishedBy
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        publishedAt = try container.decode(Date.self, forKey: .publishedAt)
        publishedBy = try container.decode(String.self, forKey: .publishedBy)
        
        // Decode thumbnail directly from the container
        thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
        
        // Construct imageURL using thumbnail data as per the given formula
        // imageURL = domain + "/" + basePath + "/0/" + key
        let imageURLString = "\(thumbnail.domain)/\(thumbnail.basePath)/0/\(thumbnail.key)"
        guard let url = URL(string: imageURLString) else {
            throw DecodingError.dataCorruptedError(forKey: .thumbnail, in: container, debugDescription: "Invalid image URL")
        }
        imageURL = url
    }
    
    struct Thumbnail: Codable {
        let domain: String
        let basePath: String
        let key: String
    }
}
