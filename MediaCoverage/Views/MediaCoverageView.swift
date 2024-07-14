//
//  MediaCoverageView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import SwiftUI
/**
 *  MediaCoverageView.swift
 *
 *  Represents a view displaying a media coverage item, including an image and details, with navigation to a detailed view.
 *  The MediaCoverageView struct is responsible for presenting individual media coverages in a grid layout.
 *
 *  - Author: Arepu Pavan Kumar
 */

import APKNetworkTracker

/// Represents a view displaying a media coverage item, including an image and details, with navigation to a detailed view.
struct MediaCoverageView: View {
    // MARK: - Properties
    
    /// View model responsible for managing media coverages.
    @ObservedObject var viewModel: MediaCoverageViewModel
    
    /// Media coverage item to display.
    var mediaCoverage: MediaCoverage
    
    /// Image associated with the media coverage.
    @State private var image: UIImage?
    
    // MARK: - Body
    
    var body: some View {
        NavigationLink(destination: ThumbnailDetailView(mediaCoverage: mediaCoverage, image: image)) {
            VStack(alignment: .leading, spacing: 8) {
                
//                APKNetworkTracker.API
                
                // Display image or loading indicator
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .padding(.bottom, 4)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 4)
                }
            }
            .padding(8)
            .background(Color.blue.opacity(0.2)) // Background color
            .cornerRadius(5) // Corner radius
        }
        .onAppear {
            // Load image for media coverage when the view appears
            viewModel.loadImage(for: mediaCoverage) { loadedImage in
                self.image = loadedImage
            }
        }
    }
}


//struct MediaCoverageView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = MediaCoverageViewModel()
//        let mediaCoverage = MediaCoverage(id: "1", title: "Sample Title", imageURL: URL(string: "https://someAPKURL")!, publishedAt: Date(), publishedBy: "Publisher", thumbnail: MediaCoverage.Thumbnail(id: "1", domain: "https://APK.com", basePath: "images", key: "image.jpg"))
//
//        return MediaCoverageView(viewModel: viewModel, mediaCoverage: mediaCoverage)
//            .previewLayout(.sizeThatFits)
//            .padding()
//            .background(Color.gray.opacity(0.2))
//    }
//}
