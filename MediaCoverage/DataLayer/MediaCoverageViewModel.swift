//
//  MediaCoverageViewModel.swift
//  SpiritualTeacher
//
//  Created by Pavankumar Arepu on 05/05/24.
//

import Foundation

class MediaCoverageViewModel: ObservableObject {
    @Published var mediaCoverages: [MediaCoverage] = []
    
    private let mediaCoverageService: MediaCoverageService
    
    init(mediaCoverageService: MediaCoverageService = MediaCoverageService()) {
        self.mediaCoverageService = mediaCoverageService
    }
    
    func fetchMediaCoverages() {
        mediaCoverageService.fetchMediaCoverages { result in
            switch result {
            case .success(let coverages):
                DispatchQueue.main.async {
                    self.mediaCoverages = coverages
                    print("APK", self.mediaCoverages)
                }
            case .failure(let error):
                print("Failed to fetch media coverages: \(error)")
            }
        }
    }
}
