//
//  BookViewModel.swift
//  NewYorkPublicLibrary
//
//  Created by Juliana Connors on 3/28/22.
//

import Foundation

class BookViewModel {
    let model: BookModel?
    
    init(model: BookModel) {
        self.model = model
    }
    
    var title: String {
        model?.title ?? "Title not available"
    }
    
    var authorName: String {
        model?.authorName?.first ?? "Author name not available"
    }
    
    var yearPublished: String {
        if let year = model?.firstPublishYear {
            return String(year)
        } else {
            return "Year published not available"
        }
    }
}
