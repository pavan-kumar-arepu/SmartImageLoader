//
//  MediaCoverageListView.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation
import SwiftUI

struct MediaCoverageListView: View {
    @ObservedObject var viewModel: MediaCoverageViewModel
    
    var body: some View {
        List(viewModel.mediaCoverages, id: \.id) { mediaCoverage in
            VStack(alignment: .leading) {
                Text(mediaCoverage.title)
                    .font(.headline)
                Text(mediaCoverage.publishedBy)
                    .font(.subheadline)
                // Add more views to display additional media coverage details
            }
        }
        .onAppear {
            viewModel.fetchMediaCoverages()
        }
        .padding()
    }
}
