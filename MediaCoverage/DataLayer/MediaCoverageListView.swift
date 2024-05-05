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
    @State private var isNavigationBarHidden = true

    var body: some View {
        
        NavigationView {
            ZStack {
                // Background gradient
                                LinearGradient(gradient: Gradient(colors: [.orange, .green]),
                                               startPoint: .top,
                                               endPoint: .bottom)
                                .edgesIgnoringSafeArea(.vertical)
                
                ScrollView {
                    
                    Image("acharya_prashant")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
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
            .navigationBarTitle("Acharya Prashant", displayMode: .large)
        }
    }
}

struct MediaCoverageListView_Previews: PreviewProvider {
    static var previews: some View {
        MediaCoverageListView(viewModel: MediaCoverageViewModel())
            .previewDisplayName("Media Coverage List")
    }
}

