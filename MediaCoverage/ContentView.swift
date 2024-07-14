//
//  ContentView.swift
//  SmartImageLoader
//
//  Created by Pavankumar Arepu on 04/05/24.
//

/**
 The `ContentView` is the main entry point of the application, responsible for initializing the view model and displaying the UI.
 
 - Author: Arepu Pavan Kumar
 */

import SwiftUI
import APKNetworkTracker // Import your package module

struct ContentView: View {
    @ObservedObject var viewModel: MediaCoverageViewModel
    
    init(viewModel: MediaCoverageViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var isModalPresented = false
    
    var body: some View {
        VStack {
            MediaCoverageListView(viewModel: viewModel)
                .onTapGesture(count: 2) {
                    APITracker.showAPICallModal()
                }
        }
        .sheet(isPresented: $isModalPresented) {
            APICallModalView()
        }
        .onAppear {
            APITracker.isTrackingEnabled = true
            APITracker.startTracking()
        }
        .onDisappear {
            APITracker.stopTracking()
        }
    }
}


/*
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock MediaCoverageViewModel for preview
        let mockViewModel = MediaCoverageViewModel()
        // Add some dummy media coverages for preview
        mockViewModel.mediaCoverages = [
            
            /*
            MediaCoverage(id: "1",
                          title: "Sample Title 1",
                          imageURL: URL(string: "https://cimg.acharyaprashant.org/images/img-98ea7bac-444d-460e-b583-3c0f89a8863e/0/image.jpg")!,
                          publishedAt: Date(),
                          publishedBy: "Publisher 1",
                          thumbnail:
                            MediaCoverage.Thumbnail(id: "1",
                                      domain: "https://cimg.acharyaprashant.org",
                                      basePath: "images/img-98ea7bac-444d-460e-b583-3c0f89a8863e",
                                      key: "image.jpg")
                         ),
            MediaCoverage(id: "2",
                          title: "Sample Title 2",
                          imageURL: URL(string: "https://cimg.acharyaprashant.org/images/img-6026c0c4-78a6-4889-9b19-0d90a57c630d/0/image.jpg")!,
                          publishedAt: Date(),
                          publishedBy: "Publisher 2",
                          thumbnail:
                            MediaCoverage.Thumbnail(id: "2",
                                      domain: "https://cimg.acharyaprashant.org",
                                      basePath: "images/img-6026c0c4-78a6-4889-9b19-0d90a57c630d",
                                      key: "image.jpg")
                         )
             */
            // Add more dummy media coverages as needed for preview
        ]
        // Pass the mockViewModel to the ContentView for preview
        return ContentView(viewModel: mockViewModel)
    }
}

*/
