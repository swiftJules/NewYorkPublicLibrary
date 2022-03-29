//
//  BookModel.swift
//  NewYorkPublicLibrary
//
//  Created by Juliana Connors on 3/28/22.
//

import Foundation

struct BookModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case firstPublishYear = "first_publish_year"
        case authorName = "author_name"
    }
    
    let title: String
    let firstPublishYear: Int?
    let authorName: [String]?
}

struct Books: Decodable {
    let docs: [BookModel]
}
