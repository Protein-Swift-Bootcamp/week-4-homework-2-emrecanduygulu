//
//  AlbumList.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 2.01.2023.
//

import Foundation

// https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=10
// https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=10

class AlbumListViewModel {
    
     var searchTerm: String = ""
     var albums: [Album] = [Album]()
     
    
    func fetchAlbums(for searchTerm: String) {
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=25")
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("URLSession error: \(error.localizedDescription)")
            } else if let  data = data {
                do {
                    let result = try JSONDecoder().decode(AlbumResult.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = result.results
                    }
                } catch {
                    print("Decoding error")
                }
            }
        }.resume()
    }
}

    protocol AlbumListViewModelOuput {
        func showData(albums: [Album])
        func showError(errorMessage: String)
        func openAlbumDetails(album: Album)
        func isLoading(_ value: Bool)
}
