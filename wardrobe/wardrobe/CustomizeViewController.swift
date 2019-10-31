//
//  CustomizeViewController.swift
//  wardrobe
//
//  Created by Jackson McIntyre on 10/31/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit

class CustomizeViewController: UIViewController {
    
    //Male gender button
    lazy var maleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .green
        button.tintColor = .green
        button.setTitle("Male", for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMale))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Handler for tapping male button
    @objc func didTapMale() {
        maleButton.backgroundColor = .green
        maleButton.tintColor = .green
    }
    
    //setup buttons
    func setupUI() {
        
        self.view.addSubview(maleButton)
        
        NSLayoutConstraint.activate([
            
            maleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 50.0),
            maleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25.0),
        
        ])
        
    }
}
