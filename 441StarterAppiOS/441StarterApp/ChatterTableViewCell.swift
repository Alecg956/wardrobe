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
        
        self.contentView.backgroundColor = .green
        self.contentView.addSubview(user)
        self.contentView.addSubview(timestamp)
        self.contentView.addSubview(message)
        
        user.translatesAutoresizingMaskIntoConstraints = false;
        timestamp.translatesAutoresizingMaskIntoConstraints = false;
        message.translatesAutoresizingMaskIntoConstraints = false;
        
        NSLayoutConstraint.activate([
            
            
            user.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            user.trailingAnchor.constraint(greaterThanOrEqualTo: timestamp.leadingAnchor, constant: -100),
            user.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            user.bottomAnchor.constraint(equalTo: message.topAnchor, constant: -8.0),

            timestamp.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0),
            timestamp.topAnchor.constraint(equalTo: self.topAnchor, constant: 8.0),
            timestamp.bottomAnchor.constraint(equalTo: message.topAnchor, constant: -8.0),

            message.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0),
            message.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0),
            message.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8.0)
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
