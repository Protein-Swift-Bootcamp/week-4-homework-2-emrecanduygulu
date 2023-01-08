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
    
    var albums: [Album] = [Album]()
    var output: AlbumListViewModelOutput?
    
    
    func fetchAlbums(for searchTerm: String) {
        output?.isLoading(true)
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(searchTerm)&entity=album&limit=25")
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
                        self.albums = result.results
                        self.output?.isLoading(false)
                        self.output?.showData()
                    }
                } catch {
                    print("Decoding error")
                    self.output?.isLoading(false)
                    self.output?.showError(errorMessage: "Error")
                }
            }
        }.resume()
    }
}



protocol AlbumListViewModelInput {
    func loadAlbumList(searchTerm: String)
    func openAlbumDetails(indexPath: IndexPath)
}

protocol AlbumListViewModelOutput {
    func showData()
    func showError(errorMessage: String)
    func openAlbumDetails(album: Album)
    func isLoading(_ value: Bool)
}

extension AlbumListViewModel: AlbumListViewModelInput {
    func openAlbumDetails(indexPath: IndexPath) {
        let album = albums[indexPath.row]
        output?.openAlbumDetails(album: album)
    }
    
    func loadAlbumList(searchTerm: String) {
        fetchAlbums(for: searchTerm)
    }
}
