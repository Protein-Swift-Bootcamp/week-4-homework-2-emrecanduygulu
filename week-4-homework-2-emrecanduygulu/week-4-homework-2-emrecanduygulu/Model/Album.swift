//
//  Album.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 2.01.2023.
//
//   let albumResult = try? JSONDecoder().decode(AlbumResult.self, from: jsonData)

// APIden gelen şarkılar songCell e atılacak
// makeLabel helper olarak eklenecek


import Foundation

struct AlbumResult: Codable {
    let resultCount: Int
    let results: [Album]
}

struct Album: Codable {
    let wrapperType, collectionType: String
    let id: Int
    let artistID: Int
    let amgArtistID: Int?
    let artistName, collectionName: String
    let artistViewURL: URL?
    let collectionViewURL: URL
    let artworkUrl60, artworkUrl100: URL
    let trackCount: Int
    
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, collectionType
        case artistID = "artistId"
        case id = "collectionId"
        case amgArtistID = "amgArtistId"
        case artistName, collectionName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case artworkUrl60, artworkUrl100
        case trackCount
    }
}
