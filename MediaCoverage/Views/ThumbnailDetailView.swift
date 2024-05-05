//
//  MediaCoverageDetailView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

/**
 *  ThumbnailDetailView.swift
 *
 *  Represents a detailed view for displaying a media coverage item with its associated thumbnail image and details.
 *  The ThumbnailDetailView struct presents the selected media coverage item, including its title, publisher, publication date, language, and thumbnail image.
 *
 *  - Author: Arepu Pavan kumar
 */

import SwiftUI

/// Represents a detailed view for displaying a media coverage item with its associated thumbnail image and details.
struct ThumbnailDetailView: View {
    // MARK: - Properties
    
    /// Media coverage item to display.
    let mediaCoverage: MediaCoverage
    
    /// Thumbnail image associated with the media coverage.
    let image: UIImage?
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Display the thumbnail image
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(Color.gray) // Background color
                    .border(Color.black, width: 1) // Border
            } else {
                // Placeholder image or loading indicator can be added here
                // For now, I am just using a placeholder color
                Color.gray
                    .frame(height: 200)
            }
            
            Divider() // Add a horizontal divider
            
            // Display other details
            Text(mediaCoverage.title)
                .font(.title)
            
            Text("Published by: \(mediaCoverage.publishedBy)")
                .font(.subheadline)
            
            Text("Published at: \(mediaCoverage.publishedAt)")
                .font(.subheadline)
            
            Text("Language: \(mediaCoverage.language)")
                .font(.subheadline)
            
            Spacer() // Spacer to push content to the top
        }
        .padding() // Add padding around the content
        .navigationBarTitle(mediaCoverage.title) // Set navigation bar title
    }
}
