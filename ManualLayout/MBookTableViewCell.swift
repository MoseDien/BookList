//
//  MBookTableViewCell.swift
//  BookStore
//
//  Created by Bell Dien on 2024/12/8.
//

import UIKit

class MBookTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: UIFont.systemFont(ofSize: 18))
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        return label
    }()
    
    let yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .callout).scaledFont(for: UIFont.systemFont(ofSize: 14))
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 1
        label.textColor = .darkGray
        return label
    }()

    let descLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.systemFont(ofSize: 16))
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 3
        return label
    }()
    
    func configCell(book: Book) {
        self.titleLabel.text = book.title
        self.yearLabel.text = book.displayYear
        self.descLabel.text = book.author
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, yearLabel, descLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
