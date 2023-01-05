//
//  SongListViewModel.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 3.01.2023.
//
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=10

import Foundation

class SongListViewModel {
    
    var searchTerm: String = ""
    var songs: [Song] = [Song]()
    
    
    func fetchSongs(for searchTerm: String) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=song&limit=25")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
            } else if let  data = data {
                do {
                    let result = try JSONDecoder().decode(SongResult.self, from: data)
                    DispatchQueue.main.async {
                        self.songs = result.results
                    }
                } catch {
                    print("Decoding error")
                }
            }
        }.resume()
    }
}

protocol SongListViewModelOuput {
    func showData(albums: [Album])
    func showError(errorMessage: String)
    func isLoading(_ value: Bool)
}
