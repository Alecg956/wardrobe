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
    lazy var maleButton: customizeButton = {
        let button = customizeButton(title: "Male")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMale))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()
    
    //Female gender button
    lazy var femaleButton: customizeButton = {
        let button = customizeButton(title: "Female")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapFemale))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()

    
    //Other gender button
    lazy var otherButton: customizeButton = {
        let button = customizeButton(title: "Other")
        
        button.backgroundColor = .white
        button.tintColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOther))
        
        button.addGestureRecognizer(tapGesture)
        
        return button
    }()
    
    //height slider
    lazy var heightSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 4, y: 300, width: displayWidth / 2, height: 20))
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.tintColor = Global.greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 1
        
        return slider
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Height: 0 Inches"
        
        return label
    }()
    
    //neck slider
    lazy var weightSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 4, y: 400, width: displayWidth / 2, height: 20))
        
        slider.minimumValue = 0
        slider.maximumValue = 300
        slider.isContinuous = true
        slider.tintColor = Global.greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 2
        
        return slider
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Weight: 0 Pounds"
        
        return label
    }()
    
    //chest slider
    lazy var chestSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 4, y: 500, width: displayWidth / 2, height: 20))
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.tintColor = Global.greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 3
        
        return slider
    }()
    
    lazy var chestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Chest: 0 Inches"
        
        return label
    }()
    
    //waist slider
    lazy var waistSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 4, y: 600, width: displayWidth / 2, height: 20))
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.tintColor = Global.greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 4
        
        return slider
    }()
    
    lazy var waistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Waist: 0 Inches"
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Switches the coloring of the buttons to represent current choice
    func buttonSelected(selectedButton: customizeButton, otherOne: customizeButton, otherTwo: customizeButton) {
        selectedButton.backgroundColor = .white
        selectedButton.tintColor = .white
        
        otherOne.backgroundColor = Global.greenBG
        otherOne.tintColor = Global.greenBG
        
        otherTwo.backgroundColor = Global.greenBG
        otherTwo.tintColor = Global.greenBG
    }
    
    // Handler for tapping male button
    @objc func didTapMale() {
        buttonSelected(selectedButton: maleButton, otherOne: femaleButton, otherTwo: otherButton)
        
        Global.gender = .male
    }
    
    // Handler for tapping female button
    @objc func didTapFemale() {
        buttonSelected(selectedButton: femaleButton, otherOne: maleButton, otherTwo: otherButton)
        
        Global.gender = .female
    }
    
    // Handler for tapping other button
    @objc func didTapOther() {
        buttonSelected(selectedButton: otherButton, otherOne: maleButton, otherTwo: femaleButton)
        
        Global.gender = .other
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!) {
        let roundedValue = round(sender.value)
        
        switch sender.tag {
        case 1:
            heightLabel.text = "Height: \(Int(roundedValue)) Inches"
            Global.height = Int(roundedValue)
        case 2:
            weightLabel.text = "Weight: \(Int(roundedValue)) Pounds"
            Global.weight = Int(roundedValue)
        case 3:
            chestLabel.text = "Chest: \(Int(roundedValue)) Inches"
        case 4:
            waistLabel.text = "Waist: \(Int(roundedValue)) Inches"
        default:
            print("Default switch")
        }
        
    }


    
    //setup buttons
    func setupUI() {
        self.view.addSubview(maleButton)
        self.view.addSubview(femaleButton)
        self.view.addSubview(otherButton)
        self.view.addSubview(heightSlider)
        self.view.addSubview(heightLabel)
        self.view.addSubview(weightSlider)
        self.view.addSubview(weightLabel)
        self.view.addSubview(chestSlider)
        self.view.addSubview(chestLabel)
        self.view.addSubview(waistSlider)
        self.view.addSubview(waistLabel)
        
        NSLayoutConstraint.activate([
            
            maleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -100.0),
            maleButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            
            femaleButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            femaleButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            
            otherButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 100.0),
            otherButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            
            //heightSlider.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            //heightSlider.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200.0),
            
            heightLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            heightLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 225.0),
            
            weightLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            weightLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 325.0),
            
            chestLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            chestLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 425.0),
            
            waistLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            waistLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 525.0),

        
        ])
        
    }
}
