//
//  MediaCoverageDetailView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import SwiftUI

struct ThumbnailDetailView: View {
    let mediaCoverage: MediaCoverage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Display the image
            Image("acharya_prashant")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
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
