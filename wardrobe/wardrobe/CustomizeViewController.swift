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
    
    //Female gender button
    lazy var femaleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .red
        button.tintColor = .red
        button.setTitle("Female", for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapFemale))
        
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
        
        femaleButton.backgroundColor = .red
        maleButton.tintColor = .red
    }
    
    // Handler for tapping male button
    @objc func didTapFemale() {
        femaleButton.backgroundColor = .green
        femaleButton.tintColor = .green
        
        maleButton.backgroundColor = .red
        maleButton.tintColor = .red
    }

    
    //setup buttons
    func setupUI() {
        
        self.view.addSubview(maleButton)
        self.view.addSubview(femaleButton)
        
        NSLayoutConstraint.activate([
            
            maleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 50.0),
            maleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0),
            
            femaleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -50.0),
            femaleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0),
        
        ])
        
    }
}
