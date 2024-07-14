//
//  HighLevelDesign.h
//  SmartImageLoader
//
//  Created by Pavankumar Arepu on 04/05/24.
//

/* HighLevelDesign_h */

/*
High-Level Design (HLD):
 
User Interface Layer(Views): This layer includes SwiftUI views responsible for displaying the image grid and handling user interactions such as scrolling.
Networking Layer: Manages API requests for fetching image data asynchronously.
Caching Layer: Handles caching of images in both memory and disk for efficient retrieval.
Error Handling: Deals with network errors and image loading failures gracefully.
 
Folder Structure:
Models: Define structs/classes to represent data models such as Image, Thumbnail, etc. based on the sample response mentioned below:
Networking: Contains networking-related classes for API communication.
Services: Includes caching service for managing image caching.
Utilities: Utility classes or extensions for common functionalities like image loading, error handling, etc.
Views: SwiftUI views for displaying images and handling user interactions.
 
Application Modules:
Image Model: Define a model to represent an image with properties like imageURL, title, etc.
API Service: Implement a service to handle API requests for fetching image data.
Image Cache: Develop a caching mechanism to store images retrieved from the API in both memory and disk cache.
Image Loader: Implement an asynchronous image loader to load images lazily as the user scrolls through the grid.
Error Handler: Create a module to handle network errors and image loading failures gracefully, providing informative error messages or placeholders.
Image Grid View: SwiftUI view to display the grid of images fetched from the API, utilizing lazy loading and efficient memory management.
 
Architecture Pattern:
MVVM (Model-View-ViewModel): Utilize the MVVM architecture pattern to separate concerns and improve testability. Views interact with ViewModels, which handle the presentation logic and communicate with the Model layer to fetch and manipulate data.
 
Overall Approach:
Networking: Use URLSession(which is a Propritory of Apple) for making asynchronous API requests to fetch image data from the provided URL.
Caching: Implement a caching mechanism using NSCache for memory caching and FileManager for disk caching. When an image is fetched from the API, store it in both memory and disk cache. If an image is missing from memory cache, check disk cache, and update memory cache accordingly.
Image Loading: Load images lazily as the user scrolls through the grid. Implement cancellation of ongoing image loading tasks when the user quickly scrolls through pages to ensure optimal performance.
Error Handling: Implement error handling to gracefully handle network errors and image loading failures, providing informative feedback to the user.
 
*/

