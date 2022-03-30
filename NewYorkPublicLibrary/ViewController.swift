//
//  ViewController.swift
//  NewYorkPublicLibrary
//
//  Created by Juliana Connors on 3/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let query = searchBar.text
        if let query = query {
            let formatted = formatQuery(query: query)
            fetchBooks(query: formatted)
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    var books: [BookModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.rowHeight = UITableView.automaticDimension
        searchBar.backgroundColor = .clear
    }
    
    func fetchBooks(query: String) {
        let url = "https://openlibrary.org/search.json?title=" + query
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Books.self, from: data)
                books = response.docs
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func formatQuery(query: String) -> String {
        query.lowercased().replacingOccurrences(of: " ", with: "+")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as? BookTableViewCell else { fatalError() }
        cell.configureCell(book: books[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
