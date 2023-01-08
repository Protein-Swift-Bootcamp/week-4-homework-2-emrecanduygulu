//
//  DetailViewModel.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 8.01.2023.
//

import Foundation

class DetailViewModel: DetailViewModelInput {
    func loadData() {
        fetchDetails(for: albumId)
    }
    
    
    var output: DetailViewModelOutput?
    var albumId: Int
    
    func fetchDetails(for albumId: Int) {
        output?.isLoading(true)
        
        guard let url = URL(string: "https://itunes.apple.com/lookup?id=\(albumId)")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
                self.output?.showError(errorMessage: "Error")
            } else if let  data = data {
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        self.output?.isLoading(false)
                        self.output?.showDetails(details: result.results.first)
                    }
                } catch {
                    print("Decoding error")
                    self.output?.isLoading(false)
                    self.output?.showError(errorMessage: "Error")
                }
            }
        }.resume()
    }
    
    init(albumId: Int) {
        self.albumId = albumId
    }
}

protocol DetailViewModelInput {
    func loadData()
}

protocol DetailViewModelOutput {
    func showDetails(details: Album?)
    func showError(errorMessage: String)
    func isLoading(_ value: Bool)
}
