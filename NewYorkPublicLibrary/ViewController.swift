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
            let formatted = networkRequester.formatQuery(query: query)
            networkRequester.fetchBooks(query: formatted) { bookViewModels in
                self.books = bookViewModels
                self.updateTableView()
            }
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    var books: [BookViewModel] = []
    let networkRequester = NetworkRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(red: 255/255, green: 253/255, blue: 247/255, alpha: 1.0).cgColor
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
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
