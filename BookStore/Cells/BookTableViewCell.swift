//
//  BookTableViewCell.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(book: Book) {
        self.titleLabel.text = book.title
        self.descLabel.text = "\(book.displayYear) by \(book.author)"
    }
}
