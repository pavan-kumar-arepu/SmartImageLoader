//
//  MediaCoverageView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import SwiftUI

struct MediaCoverageView: View {
    @ObservedObject var viewModel: MediaCoverageViewModel
    var mediaCoverage: MediaCoverage
    
    @State private var image: UIImage?

    var body: some View {
        NavigationLink(destination: ThumbnailDetailView(mediaCoverage: mediaCoverage, image: image)) {
            VStack(alignment: .leading, spacing: 8) {
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
            .background(Color.blue.opacity(0.2))
            .cornerRadius(5)
        }
        .onAppear {
            viewModel.loadImage(for: mediaCoverage) { loadedImage in
                self.image = loadedImage
            }
        }
    }
}


/*
struct MediaCoverageView: View {
    @ObservedObject var viewModel: MediaCoverageViewModel
    var mediaCoverage: MediaCoverage
    
    @State private var image: UIImage?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
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
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .onAppear {
            viewModel.loadImage(for: mediaCoverage) { loadedImage in
                self.image = loadedImage
            }
        }
    }
}
 */


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
