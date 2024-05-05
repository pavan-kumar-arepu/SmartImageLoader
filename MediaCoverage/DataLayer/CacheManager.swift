//
//  CacheManager.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 The `CacheManager` class handles caching of data in memory and on disk.
 
 - Author: Arepu Pavan Kumar
 */

import Foundation

/// Protocol defining the requirements for a cache service.
protocol CacheService {
    /// Retrieves an image from the cache for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key associated with the cached image.
    ///   - completion: A closure to be executed upon completion of the retrieval operation, containing the cached image data, if available.
    func getImage(for key: String, completion: @escaping (Data?) -> Void)
    
    /// Caches the provided image data for the specified key.
    ///
    /// - Parameters:
    ///   - data: The image data to be cached.
    ///   - key: The key associated with the cached image.
    func cacheImage(data: Data, for key: String)
}

class CacheManager: CacheService {
    
    // MARK: - Properties
    static let shared = CacheManager()
    private let memoryCache = NSCache<NSString, NSData>()
    private let fileManager = FileManager.default
    private let diskCacheDirectory: URL
    
    // MARK: - Initialization

    /**
       Initializes the CacheManager.
       */
      private init() {
          diskCacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
      }
      
    
    // MARK: - Methods
    
    /**
     Retrieves an image data from cache for the specified key.
     
     - Parameters:
        - key: The key associated with the cached image data.
        - completion: A closure to be called once the image data is retrieved, providing the data as an optional parameter.
     */
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
            #if DEBUG
                print("APK: Data Written to Cache after retrived from Disk, successfully", #function)
            #endif
                completion(data)
                return
            } catch {
            #if DEBUG
                print("**** APK: Error reading data from disk cache: \(error) ****")
            #endif
            }
        }
        
        // If not found in memory or disk cache, fetch from API
        let networkManager: NetworkService = NetworkManager.shared
        networkManager.fetchData(from: URL(string: key)!) { result in
            switch result {
            case .success(let data):
                self.cacheImage(data: data, for: key)
            #if DEBUG
                print("APK: Data Found from Cache ready to send to VM -> View", #function)
            #endif
                completion(data)
            case .failure(let error):
            #if DEBUG
                print("**** APK: Error fetching image from API: \(error) ****")
            #endif
                completion(nil)
            }
        }
    }
    
    /**
     Caches image data for the specified key.
     
     - Parameters:
        - data: The image data to be cached.
        - key: The key associated with the image data.
     */
    func cacheImage(data: Data, for key: String) {
        // Cache in memory
        memoryCache.setObject(NSData(data: data), forKey: key as NSString)
        
        // Cache in disk
        let fileURL = diskCacheDirectory.appendingPathComponent(key)
        do {
            try data.write(to: fileURL)
        #if DEBUG
            print("APK: Data Cached successfully", #function)
        #endif
        } catch {
        #if DEBUG
            print("**** APK: Error caching data to disk: \(error) ****")
        #endif
        }
    }
}
