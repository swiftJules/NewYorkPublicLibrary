//
//  BookTableViewCell.swift
//  NewYorkPublicLibrary
//
//  Created by Rave Bizz on 3/28/22.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var publishYear: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell() {
        
    }
}
