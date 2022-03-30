//
//  BookTableViewCell.swift
//  NewYorkPublicLibrary
//
//  Created by Juliana Connors on 3/28/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(book: BookModel) {
        title.text = book.title
        if let yearPublished = book.firstPublishYear, let name = book.authorName?.first {
            authorName.text = name
            year.text = String(yearPublished)
        }
    }
}
