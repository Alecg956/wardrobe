//
//  PurchaseViewController.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 11/2/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = Global.greenBG
        button.tintColor = Global.greenBG
        button.layer.cornerRadius = 5
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        button.setTitle("Make Purchase!", for: .normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapPurchase))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Handler for tapping purchase button
    @objc func didTapPurchase() {
        let url = URL(string: "https://www.amazon.com")!

        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    //setup buttons
    func setupUI() {
        
        self.view.addSubview(purchaseButton)
        
        NSLayoutConstraint.activate([
            
            purchaseButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            purchaseButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100.0),
        
        ])
        
    }
}
