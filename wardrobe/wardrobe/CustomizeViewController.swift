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

    
    //Other gender button
    lazy var otherButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.backgroundColor = .red
        button.tintColor = .red
        button.setTitle("Other", for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOther))
        
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
        femaleButton.tintColor = .red
        
        otherButton.backgroundColor = .red
        otherButton.tintColor = .red
    }
    
    // Handler for tapping female button
    @objc func didTapFemale() {
        femaleButton.backgroundColor = .green
        femaleButton.tintColor = .green
        
        maleButton.backgroundColor = .red
        maleButton.tintColor = .red
        
        otherButton.backgroundColor = .red
        otherButton.tintColor = .red
    }
    
    // Handler for tapping other button
    @objc func didTapOther() {
        otherButton.backgroundColor = .green
        otherButton.tintColor = .green
        
        femaleButton.backgroundColor = .red
        femaleButton.tintColor = .red
        
        maleButton.backgroundColor = .red
        maleButton.tintColor = .red
    }

    
    //setup buttons
    func setupUI() {
        
        self.view.addSubview(maleButton)
        self.view.addSubview(femaleButton)
        self.view.addSubview(otherButton)
        
        NSLayoutConstraint.activate([
            
            maleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -100.0),
            maleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0),
            
            femaleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            femaleButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0),
            
            otherButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 100.0),
            otherButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 0.0),
        
        ])
        
    }
}
