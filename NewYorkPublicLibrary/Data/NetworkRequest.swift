//
//  NetworkRequest.swift
//  NewYorkPublicLibrary
//
//  Created by RBS70 on 3/30/22.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    func formatQuery(query: String) -> String {
        query.lowercased().replacingOccurrences(of: " ", with: "+")
    }
    
    func fetchBooks(query: String, closure: @escaping ([BookViewModel]) -> Void) {
        let url = "https://openlibrary.org/search.json?title=" + query
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Books.self, from: data)
                var bookModels: [BookViewModel] = []
                for bookModel in response.docs {
                    let viewModel = BookViewModel(model: bookModel)
                    bookModels.append(viewModel)
                }
                closure(bookModels)
            } catch {
                print(error)
            }
        }.resume()
    }
}
