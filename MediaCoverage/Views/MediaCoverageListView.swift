//
//  MediaCoverageListView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//
/**
 *  MediaCoverageListView.swift
 *
 *  Displays a list of media coverages in a scrollable view, along with a header image and a button to open a webview modal.
 *  The MediaCoverageListView struct is responsible for presenting media coverages fetched from the view model in a grid layout.
 *
 *  - Author: Arepu Pavan Kumar
 */

import SwiftUI

/// Displays a list of media coverages in a scrollable view, along with a header image and a button to open a webview modal.
struct MediaCoverageListView: View {
    // MARK: - Properties
    
    /// View model responsible for managing media coverages.
    @ObservedObject var viewModel: MediaCoverageViewModel
    
    /// Flag indicating whether the webview modal is presented.
    @State private var isWebViewPresented = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(gradient: Gradient(colors: [.orange, .green]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                ScrollView {
                    // Header image with button to open webview modal
                    Image("acharya_prashant")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .overlay(
                            Button(action: {
                                // Open the webview modal
                                isWebViewPresented = true
                            }) {
                                Image("meditation")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                            .padding(),
                            alignment: .topTrailing
                        )
                    
                    // Spacer for layout
                    Spacer();Spacer();Spacer()
                    
                    // Divider line
                    Divider()
                    
                    // Grid of media coverages
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                        ForEach(viewModel.mediaCoverages) { mediaCoverage in
                            MediaCoverageView(viewModel: viewModel, mediaCoverage: mediaCoverage)
                        }
                    }
                    .padding()
                    .onAppear {
                        // Fetch media coverages when the view appears
                        viewModel.fetchMediaCoverages()
                    }
                }
            }
            .navigationBarTitle("Acharya Prashant", displayMode: .large)
            .sheet(isPresented: $isWebViewPresented) {
                // Present webview modal when flag is true
                WebViewModal(showModal: $isWebViewPresented, url: URL(string: Constants.website)!)
            }
        }
    }
}

/// Preview provider for MediaCoverageListView.
struct MediaCoverageListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCoverageListView(viewModel: MediaCoverageViewModel())
            .previewDisplayName("Media Coverage List")
    }
}
