//
//  CacheManager.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation


// Protocol for the cache manager
protocol CacheService {
    func getImage(for key: String, completion: @escaping (Data?) -> Void)
    func cacheImage(data: Data, for key: String)
}

class CacheManager: CacheService {
    static let shared = CacheManager()
    private let memoryCache = NSCache<NSString, NSData>()
    private let fileManager = FileManager.default
    private let diskCacheDirectory: URL
    
    private init() {
        diskCacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    func getImage(for key: String, completion: @escaping (Data?) -> Void) {
        // Check memory cache first
        if let cachedData = memoryCache.object(forKey: key as NSString) {
            completion(Data(referencing: cachedData))
            return
        }
        
        // If not found in memory cache, check disk cache
        let fileURL = diskCacheDirectory.appendingPathComponent(key)
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                // Update memory cache with data read from disk
                memoryCache.setObject(NSData(data: data), forKey: key as NSString)
                completion(data)
                return
            } catch {
                print("Error reading data from disk cache: \(error)")
            }
        }
        
        // If not found in memory or disk cache, fetch from API
        let networkManager: NetworkService = NetworkManager.shared
        networkManager.fetchData(from: URL(string: key)!) { result in
            switch result {
            case .success(let data):
                self.cacheImage(data: data, for: key)
                completion(data)
            case .failure(let error):
                print("Error fetching image from API: \(error)")
                completion(nil)
            }
        }
    }
    
    func cacheImage(data: Data, for key: String) {
        // Cache in memory
        memoryCache.setObject(NSData(data: data), forKey: key as NSString)
        
        // Cache in disk
        let fileURL = diskCacheDirectory.appendingPathComponent(key)
        do {
            try data.write(to: fileURL)
        } catch {
            print("Error caching data to disk: \(error)")
        }
    }
}
