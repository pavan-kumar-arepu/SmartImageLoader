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
        ScrollView {
            VStack {
                // Header Image (AcharyaPrasanth)
                GeometryReader { geometry in
                    Image("acharya_prashant.png")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200) // Adjust height as needed
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY)
                        .onAppear {
                            self.isNavigationBarHidden = geometry.frame(in: .global).minY > 0
                        }
                }
                
                // Grid of Media Coverages
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                    ForEach(viewModel.mediaCoverages) { mediaCoverage in
                        MediaCoverageView(viewModel: viewModel, mediaCoverage: mediaCoverage)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Acharya Prasanth", displayMode: .inline)
        .navigationBarHidden(isNavigationBarHidden)
    }
}
