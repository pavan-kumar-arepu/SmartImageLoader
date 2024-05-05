//
//  MediaCoverageDetailView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import SwiftUI

struct ThumbnailDetailView: View {
    let mediaCoverage: MediaCoverage
    let image: UIImage?
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Display the image
            if let image = image {
                          Image(uiImage: image)
                              .resizable()
                              .aspectRatio(contentMode: .fit)
                              .frame(maxWidth: .infinity)
                              .frame(height: 200)
                              .background(Color.gray)
                              .border(Color.black, width: 1)
                      } else {
                          // Placeholder image or loading indicator can be added here
                          // For now, let's just use a placeholder color
                          Color.gray
                              .frame(height: 200)
                      }
            
            // Display other details
            Text(mediaCoverage.title)
                .font(.title)
            
            Text("Published by: \(mediaCoverage.publishedBy)")
                .font(.subheadline)
            
            Text("Published at: \(mediaCoverage.publishedAt)")
                .font(.subheadline)
            
            Text("Language: \(mediaCoverage.language)")
                .font(.subheadline)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(mediaCoverage.title)
    }
}
