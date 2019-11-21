//
//  PurchaseTableViewCell.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 11/14/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {
    
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
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .greenBG
        button.tintColor = .greenBG
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.setTitle("Purchase!", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPurchase))
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    static let reuseIdentifier = "purchaseReuseIdentifier"
    
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
    
    func getURL(name: String) -> String {
        var url = ""
        switch name {
        case "Button_Up_Shirt":
            url = "https://www.amazon.com/Amazon-Essentials-Regular-Fit-Long-Sleeve-Oxford/dp/B06XWLZBK3/"
        case "Chinos":
            url = "https://www.amazon.com/Amazon-Essentials-Slim-Fit-Wrinkle-Resistant-Flat-Front/dp/B07756KXN4/"
        case "Sneakers":
            url = "https://www.amazon.com/Converse-Chuck-Taylor-Classic-Sneakers/dp/B01G4AU46Y/"
        case "Cap":
            url = "https://www.amazon.com/Carhartt-Medium-Profile-Percent-Cotton/dp/B00MNLKARM/"
        default:
            url = "https://www.amazon.com"
        }
        return url
    }
    
    // Handler for tapping male button
    @objc func didTapPurchase() {
        if let url = URL(string: getURL(name: itemLabel.text ?? "nil")) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func setupUI() {
        self.contentView.addSubview(itemLabel)
        self.contentView.addSubview(itemImageView)
        self.contentView.addSubview(sizeLabel)
        self.contentView.addSubview(colorLabel)
        self.contentView.addSubview(purchaseButton)
        
        NSLayoutConstraint.activate([
            
            self.contentView.heightAnchor.constraint(equalToConstant: 60.0),
            
            itemImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            itemImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            itemImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            itemImageView.widthAnchor.constraint(equalToConstant: 60),
            
            itemLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 80),
            itemLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            itemLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -18),
            
            sizeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 80),
            sizeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 18),
            sizeLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            
            colorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 130),
            colorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 18),
            colorLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            
            purchaseButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            purchaseButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            purchaseButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            //itemImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }

}
