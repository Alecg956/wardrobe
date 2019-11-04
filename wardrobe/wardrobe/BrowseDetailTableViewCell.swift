//
//  BrowseTableViewCell.swift
//  wardrobe
//
//  Created by Alec Goldberg on 11/1/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class BrowseDetailTableViewCell: UITableViewCell {
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        
        return label
    }()
    
    lazy var itemImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "sample")
        
        return imageView
    }()
    
    static let reuseIdentifier = "browseDetailReuseIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // self.contentView.backgroundColor = Global.greenBG
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
        self.contentView.addSubview(itemLabel)
        self.contentView.addSubview(itemImageView)
        
        NSLayoutConstraint.activate([
            
            self.contentView.heightAnchor.constraint(equalToConstant: 60.0),
            
            itemLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            itemLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            itemLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
            itemImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            itemImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }

}
