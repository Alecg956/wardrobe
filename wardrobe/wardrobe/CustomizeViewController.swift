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
        let slider = UISlider(frame: CGRect(x: displayWidth / 6, y: 275, width: displayWidth / 1.5, height: 20))
        
        slider.minimumValue = 36
        slider.maximumValue = 84
        slider.setValue(Global.defaultHeight.other.rawValue, animated: true)
        slider.isContinuous = true
        slider.tintColor = .greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 1
        
        return slider
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var feet = Int(Global.defaultHeight.other.rawValue / 12)
        var inches = Int(Global.defaultHeight.other.rawValue) % 12
        
        label.text = "Height: \(feet) feet \(inches) Inches"
        
        return label
    }()
    
    //neck slider
    lazy var weightSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 6, y: 375, width: displayWidth / 1.5, height: 20))
        
        slider.minimumValue = 50
        slider.maximumValue = 300
        slider.setValue(Global.defaultWeight.other.rawValue, animated: true)
        slider.isContinuous = true
        slider.tintColor = .greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 2
        
        return slider
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Weight: \(Int(Global.defaultWeight.other.rawValue)) Pounds"
        
        return label
    }()
    
    //chest slider
    lazy var chestSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 6, y: 475, width: displayWidth / 1.5, height: 20))
        
        slider.minimumValue = 20
        slider.maximumValue = 60
        slider.setValue(Global.defaultChest.other.rawValue, animated: true)
        slider.isContinuous = true
        slider.tintColor = .greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 3
        
        return slider
    }()
    
    lazy var chestLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Chest: \(Int(Global.defaultChest.other.rawValue)) Inches"
        
        return label
    }()
    
    //waist slider
    lazy var waistSlider: UISlider = {
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let slider = UISlider(frame: CGRect(x: displayWidth / 6, y: 575, width: displayWidth / 1.5, height: 20))
        
        slider.minimumValue = 20
        slider.maximumValue = 60
        slider.setValue(Global.defaultWaist.other.rawValue, animated: true)
        slider.isContinuous = true
        slider.tintColor = .greenBG
        slider.addTarget(self, action: #selector(CustomizeViewController.sliderValueDidChange(_:)), for: .valueChanged)
        slider.tag = 4
        
        return slider
    }()
    
    lazy var waistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Waist: \(Int(Global.defaultWaist.other.rawValue)) Inches"
        
        return label
    }()
    
    lazy var helpButton: testUIButton = {
        
        let button = testUIButton(imageString: "questionmark.circle.fill")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapHelp))

        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Switches the coloring of the buttons to represent current choice
    func buttonSelected(selectedButton: customizeButton, otherOne: customizeButton, otherTwo: customizeButton) {
        selectedButton.backgroundColor = .white
        selectedButton.tintColor = .white
        
        otherOne.backgroundColor = .greenBG
        otherOne.tintColor = .greenBG
        
        otherTwo.backgroundColor = .greenBG
        otherTwo.tintColor = .greenBG
    }
    
    // Handler for tapping male button
    @objc func didTapMale() {
        buttonSelected(selectedButton: maleButton, otherOne: femaleButton, otherTwo: otherButton)
        
        Global.gender = .male
        
        updateHeightVals(newHeight: Global.defaultHeight.male.rawValue)
        updateWeightVals(newWeight: Global.defaultWeight.male.rawValue)
        updateChestVals(newChest: Global.defaultChest.male.rawValue)
        updateWaistVals(newWaist: Global.defaultWaist.male.rawValue)
        
    }
    
    // Handler for tapping female button
    @objc func didTapFemale() {
        buttonSelected(selectedButton: femaleButton, otherOne: maleButton, otherTwo: otherButton)
        
        Global.gender = .female
        
        updateHeightVals(newHeight: Global.defaultHeight.female.rawValue)
        updateWeightVals(newWeight: Global.defaultWeight.female.rawValue)
        updateChestVals(newChest: Global.defaultChest.female.rawValue)
        updateWaistVals(newWaist: Global.defaultWaist.female.rawValue)
    }
    
    // Handler for tapping other button
    @objc func didTapOther() {
        buttonSelected(selectedButton: otherButton, otherOne: maleButton, otherTwo: femaleButton)
        
        Global.gender = .other
        
        updateHeightVals(newHeight: Global.defaultHeight.other.rawValue)
        updateWeightVals(newWeight: Global.defaultWeight.other.rawValue)
        updateChestVals(newChest: Global.defaultChest.other.rawValue)
        updateWaistVals(newWaist: Global.defaultWaist.other.rawValue)
    }
    
    // Handler for tapping help button
    @objc func didTapHelp () {
        
        let alert = UIAlertController(title: "Customize The AR Model", message: "Select the gender with which you identify, then adjust the sliders to fit your body measurements. After that you can move to Browse, and select the clothing you wish to test in AR!", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!) {
        let roundedValue = round(sender.value)
        
        switch sender.tag {
            
        case 1:
            updateHeightVals(newHeight: roundedValue)
        case 2:
            updateWeightVals(newWeight: Float(Int(sender.value/5) * 5))
        case 3:
            updateChestVals(newChest: roundedValue)
        case 4:
            updateWaistVals(newWaist: roundedValue)
        default:
            print("Default switch")
        }
        
    }
    
    func updateHeightVals(newHeight:Float) {
        
        Global.height = newHeight
        
        let feet = Int(Global.height / 12)
        let inches = Int(Global.height) % 12
        heightLabel.text = "Height: \(feet) feet \(inches) Inches"
        heightSlider.setValue(Global.height, animated: true)
    }
    
    func updateWeightVals(newWeight:Float) {
        Global.weight = newWeight
        weightLabel.text = "Weight: \(Int(Global.weight)) Pounds"
        weightSlider.setValue(Global.weight, animated: true)
    }
    
    func updateChestVals(newChest:Float) {
        Global.chest = newChest
        chestLabel.text = "Chest: \(Int(Global.chest)) Inches"
        chestSlider.setValue(Global.chest, animated: true)
    }
    
    func updateWaistVals(newWaist:Float) {
        Global.waist = newWaist
        waistLabel.text = "Waist: \(Int(Global.waist)) Inches"
        waistSlider.setValue(Global.waist, animated: true)
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
        self.view.addSubview(helpButton)
        
        helpButton.tintColor = .greenBG
        helpButton.isUserInteractionEnabled = true
        
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
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -15),
            
            weightLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -15),

            
            chestLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            chestLabel.bottomAnchor.constraint(equalTo: chestSlider.topAnchor, constant: -15),

            
            waistLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
            waistLabel.bottomAnchor.constraint(equalTo: waistSlider.topAnchor, constant: -15),


            helpButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 15.0),
            helpButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            helpButton.heightAnchor.constraint(equalToConstant: 50),
            helpButton.widthAnchor.constraint(equalToConstant: 50),
        
        ])
        
    }
}
