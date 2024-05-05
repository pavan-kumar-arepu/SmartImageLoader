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
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                ForEach(viewModel.mediaCoverages) { mediaCoverage in
                    MediaCoverageView(viewModel: viewModel, mediaCoverage: mediaCoverage)
                }
            }
            .padding()
            .onAppear {
                viewModel.fetchMediaCoverages()
            }
        }
    }
}
