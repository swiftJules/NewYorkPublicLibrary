//
//  BookTableViewCell.swift
//  NewYorkPublicLibrary
//
//  Created by Juliana Connors on 3/28/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    static let identifier = String(describing: BookTableViewCell.self)

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var year: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(book: BookViewModel) {
        title.text = book.title
        authorName.text = book.authorName
        year.text = book.yearPublished
    }
}
