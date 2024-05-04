//
//  ImageModel.swift
//  SmartImageLoader
//
//  Created by Pavankumar Arepu on 04/05/24.
//

import Foundation

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
