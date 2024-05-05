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
    
    var body: some View {
//        Text("Hello")
        VStack {
            Text(mediaCoverage.title)
                .font(.headline)
            Text(mediaCoverage.publishedBy)
                .font(.subheadline)
        }
    }
}


/*
 VStack(alignment: .leading, spacing: 8) {
     if let image = mediaCoverage.image {
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
             .onAppear {
                 viewModel.loadImage(for: mediaCoverage) { image in
                     // No need to update UI here, as @ObservedObject will automatically refresh
                 }
             }
     }
     Text(mediaCoverage.title)
         .font(.headline)
     Text(mediaCoverage.publishedBy)
         .font(.subheadline)
 }
 .padding(8)
 .background(Color.gray.opacity(0.1))
 .cornerRadius(8)
 */

/*
 VStack(alignment: .leading, spacing: 8) {
     if let image = mediaCoverage.image {
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
             .onAppear {
                 viewModel.loadImage(for: mediaCoverage) { image in
                     // No need to update UI here, as @ObservedObject will automatically refresh
                 }
             }
     }
     Text(mediaCoverage.title)
         .font(.headline)
     Text(mediaCoverage.publishedBy)
         .font(.subheadline)
 }
 .padding(8)
 .background(Color.gray.opacity(0.1))
 .cornerRadius(8)
 */
