//
//  BrowseTableViewCell.swift
//  wardrobe
//
//  Created by Alec Goldberg on 11/1/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class BrowseTableViewCell: UITableViewCell {
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .green
        
        return label
    }()
    
    static let reuseIdentifier = "browseReuseIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.contentView.addSubview(categoryLabel)
        
        NSLayoutConstraint.activate([
            
            self.contentView.heightAnchor.constraint(equalToConstant: 44.0),
            
            categoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            categoryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            categoryLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)
            
            
        ])
    }

}
