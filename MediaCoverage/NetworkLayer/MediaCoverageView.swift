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
