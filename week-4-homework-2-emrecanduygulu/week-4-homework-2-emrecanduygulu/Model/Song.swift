//
//  Song.swift
//  week-4-homework-2-emrecanduygulu
//
//  Created by emre can duygulu on 2.01.2023.
//   let songResult = try? JSONDecoder().decode(SongResult.self, from: jsonData)

import Foundation

struct SongResult: Codable {
    let resultCount: Int
    let results: [Song]
}

struct Song: Codable, Identifiable {
    let wrapperType, kind: String
    let id: Int
    let artistID, trackID: Int
    let artistName, collectionName, trackName, collectionCensoredName, trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: String
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country, currency, primaryGenreName: String
    let isStreamable: Bool
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case id = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
    }
}
