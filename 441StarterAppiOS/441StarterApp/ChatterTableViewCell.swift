//
//  ChatterTableViewCell.swift
//  441StarterApp
//
//  Created by Alec Goldberg on 9/13/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class ChatterTableViewCell: UITableViewCell {

    var user = UILabel()
    var timestamp = UILabel()
    var message = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.purple.withAlphaComponent(0.35)
        self.contentView.addSubview(user)
        self.contentView.addSubview(timestamp)
        self.contentView.addSubview(message)
        
        user.font = UIFont.boldSystemFont(ofSize: 16.0)
        user.lineBreakMode = .byWordWrapping
        user.numberOfLines = 0
        timestamp.lineBreakMode = .byWordWrapping
        timestamp.numberOfLines = 0
        message.lineBreakMode = .byWordWrapping
        message.numberOfLines = 0
        
        user.translatesAutoresizingMaskIntoConstraints = false;
        timestamp.translatesAutoresizingMaskIntoConstraints = false;
        message.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            
            
            user.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8.0),
            user.trailingAnchor.constraint(greaterThanOrEqualTo: self.contentView.centerXAnchor),
            user.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            user.bottomAnchor.constraint(equalTo: message.topAnchor, constant: -10.0),

            timestamp.leadingAnchor.constraint(greaterThanOrEqualTo: self.contentView.centerXAnchor),
            timestamp.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8.0),
            timestamp.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            timestamp.bottomAnchor.constraint(equalTo: message.topAnchor, constant: -10.0),

            message.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8.0),
            message.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0.0),
            message.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8.0)
        ])

    }
    
    required init?(coder aDecoder: NSCoder) {
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

}
