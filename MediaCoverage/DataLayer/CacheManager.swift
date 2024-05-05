//
//  CacheManager.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation

class CacheManager {
    static let shared = CacheManager()
    private let memoryCache = NSCache<NSString, NSData>()
    private let fileManager = FileManager.default
    private let diskCacheDirectory: URL
    
    private init() {
        diskCacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }
    
    func getImage(for key: String) -> Data? {
        // Check memory cache first
        if let cachedData = memoryCache.object(forKey: key as NSString) {
            return Data(referencing: cachedData)
        }
        
        // If not found in memory cache, check disk cache
        let fileURL = diskCacheDirectory.appendingPathComponent(key)
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                let data = try Data(contentsOf: fileURL)
                // Update memory cache with data read from disk
                memoryCache.setObject(NSData(data: data), forKey: key as NSString)
                return data
            } catch {
                print("Error reading data from disk cache: \(error)")
            }
        }
        
        return nil
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
