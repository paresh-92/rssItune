//
//  ModelClass.swift
//  DemoRSSItunes
//
//  Created by Paresh Thakkar on 25/07/21.
//
import Foundation

// MARK: - ModelClass
class ModelClass: Codable {
    let feed: Feed

    init(feed: Feed) {
        self.feed = feed
    }
}

// MARK: - Feed
class Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright, country: String
    let icon: String
    let updated: String
    let results: [Result]

    init(title: String, id: String, author: Author, links: [Link], copyright: String, country: String, icon: String, updated: String, results: [Result]) {
        self.title = title
        self.id = id
        self.author = author
        self.links = links
        self.copyright = copyright
        self.country = country
        self.icon = icon
        self.updated = updated
        self.results = results
    }
}

// MARK: - Author
class Author: Codable {
    let name: String
    let uri: String

    init(name: String, uri: String) {
        self.name = name
        self.uri = uri
    }
}

// MARK: - Link
class Link: Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate
    }

    init(linkSelf: String?, alternate: String?) {
        self.linkSelf = linkSelf
        self.alternate = alternate
    }
}

// MARK: - Result
class Result: Codable {
    let artistName, id, releaseDate, name: String
    let kind: Kind
    let copyright, artistID: String
    let contentAdvisoryRating: ContentAdvisoryRating?
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case contentAdvisoryRating
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }

    init(artistName: String, id: String, releaseDate: String, name: String, kind: Kind, copyright: String, artistID: String, contentAdvisoryRating: ContentAdvisoryRating?, artistURL: String, artworkUrl100: String, genres: [Genre], url: String) {
        self.artistName = artistName
        self.id = id
        self.releaseDate = releaseDate
        self.name = name
        self.kind = kind
        self.copyright = copyright
        self.artistID = artistID
        self.contentAdvisoryRating = contentAdvisoryRating
        self.artistURL = artistURL
        self.artworkUrl100 = artworkUrl100
        self.genres = genres
        self.url = url
    }
}

enum ContentAdvisoryRating: String, Codable {
    case explicit = "Explicit"
}

// MARK: - Genre
class Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }

    init(genreID: String, name: String, url: String) {
        self.genreID = genreID
        self.name = name
        self.url = url
    }
}

enum Kind: String, Codable {
    case album = "album"
}
