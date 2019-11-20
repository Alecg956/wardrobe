//
//  ViewController.swift
//  wardrobe
//
//  Created by Alec Goldberg on 10/20/19.
//  Copyright © 2019 Alec Goldberg. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARTestViewController: UIViewController, ARSCNViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    lazy var pickerView = UIPickerView()
    lazy var currentColorNamePair = ColorNamePair(color: .red, name: "red")
    
    struct ColorNamePair {
        var color :UIColor
        var name:String
    }
    
    let pickerValues:[ColorNamePair] = [ColorNamePair(color: .white, name: "white"), ColorNamePair(color: .black, name: "black"), ColorNamePair(color: .red, name: "red"), ColorNamePair(color: .blue, name: "blue"), ColorNamePair(color: .green, name: "green"), ColorNamePair(color: .yellow, name: "yellow")]
    
    lazy var pickerTextField: UITextField = {
        let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .gray
        textField.text = "color"
        textField.textAlignment = .center
        textField.backgroundColor = .greenBGDisabled
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8.0
        textField.tintColor = .clear
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    lazy var pickerToolBar: UIToolbar = {
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapPickerDone))

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }()
    
    lazy var numModels = Int()
    static let rotateRightSmall = SCNAction.rotateBy(x: 0, y: 0.2, z: 0, duration: 0)
    static let rotateLeftSmall = SCNAction.rotateBy(x: 0, y: -0.2, z: 0, duration: 0)
    static let scaleUpSmall = SCNAction.scale(by: 1.1, duration: 0)
    static let scaleDownSmall = SCNAction.scale(by: 0.90909, duration: 0)
    
    lazy var timer: Timer = Timer()
    lazy var modelFileName : String = "other_model"
    lazy var previousGenderSelected : Gender = Global.gender

    @IBOutlet var sceneView: ARSCNView!
    
    lazy var sizeUpButton: UIButton = testUIButton(imageString: "plus.circle.fill")
    lazy var sizeDownButton: UIButton = testUIButton(imageString: "minus.circle.fill")
    lazy var modelSizeUpButton: UIButton = testUIButton(imageString: "person.crop.circle.fill.badge.plus")
    lazy var modelSizeDownButton: UIButton = testUIButton(imageString: "person.crop.circle.fill.badge.minus")
    lazy var modelDeleteButton: UIButton = testUIButton(imageString: "person.crop.circle.fill.badge.xmark")
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel();
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8.0
        label.layer.masksToBounds = true
        label.backgroundColor = .greenBGDisabled
        label.text = "Size: M"
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var rotateRightButton: UIButton = {
        
        let button = testUIButton(imageString: "arrow.counterclockwise.circle.fill")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRotateRight))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressRotateRight))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy var rotateLeftButton: testUIButton = {
        
        let button = testUIButton(imageString: "arrow.clockwise.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRotateLeft))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressRotateLeft))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Create a gesture recognizer for tapping to insert the model
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        self.tabBarController?.tabBar.backgroundColor = .clear
        self.tabBarController?.tabBar.isTranslucent = true
        self.sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // Set up the UI
        setupUI()
        
        if numModels == 0 {
            let alert = UIAlertController(title: "Testing with AR", message: "To add a model wait for a flat surface to be detected and tap the screen.  Select clothing by looking in the browse tab and see it appear on your model!", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Got it!", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    // Handler for adding the model to the scene
    @objc func didTapScreen(_ gesture: UITapGestureRecognizer) {
        
        // Get the scene view and the coordinates of the tap
        let sceneView = gesture.view as? ARSCNView
        let touchCoords = gesture.location(in: sceneView)
        
        // Create hit test object, allows us to determine if a plane tapped
        guard let hitTest = sceneView?.hitTest(touchCoords, types: .existingPlaneUsingExtent), !hitTest.isEmpty, let hitTestRes = hitTest.first else {
            
            return
        }
        
        // Get the position of the center of the plane
        let position = SCNVector3Make(hitTestRes.worldTransform.columns.3.x, hitTestRes.worldTransform.columns.3.y, hitTestRes.worldTransform.columns.3.z)
                
        // Add item to our scene
        addModelToPosition(position)
    }
    
    func setModelFileName() {
        
        switch (Global.gender) {
            case .male:
                modelFileName = "male_model"
                previousGenderSelected = .male
            
            case .female:
                modelFileName = "female_model"
                previousGenderSelected = .female
            
            default:
                modelFileName = "other_model"
                previousGenderSelected = .other
        }
    }
    
    // Add a model to the scene on tap
    func addModelToPosition(_ position: SCNVector3) {
        
        if numModels >= 1 {
            return
        }
        
        // Load model based on gender
        setModelFileName()
        
        let scene = SCNScene(named: "art.scnassets/models/" + modelFileName + ".scn")
    
        // Add to the scene in the background to not block the UI
        DispatchQueue.main.async {
            
            if let node = scene?.rootNode.childNode(withName: self.modelFileName, recursively: false) {
                
                self.numModels += 1
                
                print(self.modelFileName)
                print(self.numModels)
                
                node.position = position
                node.scale = SCNVector3Make(0.005, 0.005, 0.005)
                
                self.sceneView.automaticallyUpdatesLighting = true
                self.sceneView.autoenablesDefaultLighting = true
                self.sceneView.scene.rootNode.addChildNode(node)

                self.changeModelHeightAndWeight()
                
                self.addAndEnableModelButtons()
                
                if (Global.selectedItem != "") {
                    self.addClothingToModel()
                    Global.selectedItem = ""
                }
            }
        }
    }
    
    // Add clothing item to model
    func addClothingToModel() {
        
        let scene = SCNScene(named: "art.scnassets/clothing/" + Global.selectedItem + ".scn")

        DispatchQueue.main.async {
            
            if let node = scene?.rootNode.childNode(withName: Global.selectedType, recursively: false) {
                
                self.sceneView.automaticallyUpdatesLighting = true
                self.sceneView.autoenablesDefaultLighting = true
                
                if let parentNode = self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true) {
                    
                    parentNode.addChildNode(node)
                    self.setClothingButtonsEnabled(enabled: true)
                }
            }
        }
    }
    
    // Replace old item with new item (Hard coded at the moment)
    func replaceClothingOnModel() {
        
        if let oldNode = self.sceneView.scene.rootNode.childNode(withName: Global.selectedType, recursively: true) {
            
            let scene = SCNScene(named: "art.scnassets/clothing/" + Global.selectedItem + ".scn")
            
            if let newNode = scene?.rootNode.childNode(withName: Global.selectedType, recursively: true) {
                if let parentNode = self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true) {
                    parentNode.replaceChildNode(oldNode, with: newNode)
                }
            }
        }
    }
    
    // Replace model when a different gender has beens selected
    func replaceModel() {
        
        let oldModelFileName : String = modelFileName
        
        setModelFileName();
        
        if let oldNode = self.sceneView.scene.rootNode.childNode(withName: oldModelFileName, recursively: true) {
            
            print(oldModelFileName)
            
            let scene = SCNScene(named: "art.scnassets/models/" + modelFileName + ".scn")
            
            if let newNode = scene?.rootNode.childNode(withName: modelFileName, recursively: true) {
                
                print(modelFileName)
                
                // Give old node's child nodes to the new node
                for childNode in oldNode.childNodes {
                    newNode.addChildNode(childNode)
                }
                
                newNode.position = oldNode.position;
                newNode.scale = oldNode.scale;
                self.sceneView.scene.rootNode.replaceChildNode(oldNode, with: newNode)
                print(self.sceneView.scene.rootNode.childNodes.count)
            }
        }
    }
    
    // Change height
    func changeModelHeightAndWeight() {
        if let node = self.sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: true) {
            var height:Float = 1.0;
            var thick:Float = 1.0;
            
            switch(Global.gender) {
                case .male:
                    height = Float(Global.height) / Float(Global.defaultHeight.male.rawValue)
                    thick = Float(Global.weight) / Float(Global.defaultWeight.male.rawValue)
                case .female:
                    height = Float(Global.height) / Float(Global.defaultHeight.female.rawValue)
                    thick = Float(Global.weight) / Float(Global.defaultWeight.female.rawValue)
                case .other:
                    height = Float(Global.height) / Float(Global.defaultHeight.other.rawValue)
                    thick = Float(Global.weight) / Float(Global.defaultWeight.other.rawValue)
            }
            node.scale = SCNVector3Make(0.005 * thick, 0.005 * height, 0.005 * thick)
            print(height)
        }
    }
    
    // Set up the initial state of the scene, this is called
    // Anytime the tab is tapped (we should update the model here)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Enable plane detection
        configuration.planeDetection = .horizontal
        configuration.isLightEstimationEnabled = true
        
        // show feature points
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        // Run the view's session
        sceneView.session.run(configuration)
        
        // Check to see if a new item has been selected and there is a model on screen
        if (Global.selectedItem != "" && numModels == 1) {
            
            // Check if model has clothing type on it already
            if let node = self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true), node.childNodes.count > 0 {
                
                replaceClothingOnModel()
            }
            else {
                print(Global.selectedItem)
                addClothingToModel()
            }
        }
        
        // Check if gender has been changed
        // Check count to see if a model is there already
        if (previousGenderSelected != Global.gender && numModels == 1) {
            replaceModel()
        }
        
        self.changeModelHeightAndWeight()
    }

    func scaleClothes() {

        if let node = self.sceneView.scene.rootNode.childNode(withName: Global.selectedType, recursively: true) {
            if(Global.size == -1) {
                print("S")
                node.scale = SCNVector3Make(0.9, 0.9, 0.9)
                node.position = SCNVector3Make(0, 15, 0)
            }
            if(Global.size == 0) {
                print("M")
                node.scale = SCNVector3Make(1, 1, 1)
                node.position = SCNVector3Make(0, 0, 0)
            }
            if(Global.size == 1) {
                print("L")
                node.scale = SCNVector3Make(1.1, 1.1, 1.1)
                node.position = SCNVector3Make(0, -12, 0)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        // only process these nodes because we only want to detect planes
        if let planeAnchor = anchor as? ARPlaneAnchor {
            
            // represents a one sided plane geometry
            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            plane.firstMaterial?.diffuse.contents = UIColor.white.withAlphaComponent(0.75)
            
            // use the anchor's position to set the center of the plane
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(planeAnchor.center.x, planeAnchor.center.x, planeAnchor.center.z)
            
            // rotate it, default would be perpendicular
            planeNode.eulerAngles.x = -.pi/2
            
            node.addChildNode(planeNode)
        }
    }
    
    // update current scene based on new camera detections, expands planes
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        // only process these nodes because we only want to detect planes
        if let planeAnchor = anchor as? ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane {
            
            plane.width = CGFloat(planeAnchor.extent.x)
            plane.height = CGFloat(planeAnchor.extent.z)
            planeNode.position = SCNVector3Make(planeAnchor.center.x, 0, planeAnchor.center.z)
        }
    }

    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

// UI Stuff
extension ARTestViewController {
    
    func setupUI() {
        
        sizeDownButton.addTarget(self, action: #selector(didTapSizeDown), for: .touchUpInside)
        sizeUpButton.addTarget(self, action: #selector(didTapSizeUp), for: .touchUpInside)
        
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerTextField.inputAccessoryView = pickerToolBar
        
        self.view.addSubview(sizeUpButton)
        self.view.addSubview(sizeDownButton)
        self.view.addSubview(rotateRightButton)
        self.view.addSubview(rotateLeftButton)
        self.view.addSubview(sizeLabel)
        self.view.addSubview(pickerTextField)
        
        NSLayoutConstraint.activate([
            
            pickerTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            pickerTextField.bottomAnchor.constraint(equalTo: sizeLabel.topAnchor, constant: -10),
            pickerTextField.widthAnchor.constraint(equalTo: sizeLabel.widthAnchor),
            pickerTextField.heightAnchor.constraint(equalToConstant: 30),
            
            sizeDownButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -75.0),
            sizeDownButton.centerYAnchor.constraint(equalTo: sizeLabel.centerYAnchor),
            sizeDownButton.heightAnchor.constraint(equalToConstant: 40),
            sizeDownButton.widthAnchor.constraint(equalToConstant: 40),
            
            sizeUpButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 75.0),
            sizeUpButton.centerYAnchor.constraint(equalTo: sizeLabel.centerYAnchor),
            sizeUpButton.heightAnchor.constraint(equalToConstant: 40),
            sizeUpButton.widthAnchor.constraint(equalToConstant: 40),
            
            rotateRightButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            rotateRightButton.bottomAnchor.constraint(equalTo: self.sizeDownButton.topAnchor, constant: -55.0),
            rotateRightButton.heightAnchor.constraint(equalToConstant: 50.0),
            rotateRightButton.widthAnchor.constraint(equalToConstant: 50.0),
            
            rotateLeftButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            rotateLeftButton.bottomAnchor.constraint(equalTo: self.sizeDownButton.topAnchor, constant: -55.0),
            rotateLeftButton.heightAnchor.constraint(equalToConstant: 50.0),
            rotateLeftButton.widthAnchor.constraint(equalToConstant: 50.0),
            
            
            sizeLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -45.0),
            sizeLabel.heightAnchor.constraint(equalToConstant: 30),
            sizeLabel.leadingAnchor.constraint(equalTo: sizeDownButton.trailingAnchor, constant: 8),
            sizeLabel.trailingAnchor.constraint(equalTo: sizeUpButton.leadingAnchor, constant: -8)
        ])
        
    }
    
    func setModelButtonsEnabled(enabled: Bool) {
        
        let color: UIColor = enabled ? .greenBG : .greenBGDisabled
        
        rotateLeftButton.tintColor = color
        rotateLeftButton.isUserInteractionEnabled = enabled
        
        rotateRightButton.tintColor = color
        rotateRightButton.isUserInteractionEnabled = enabled
        
        modelSizeUpButton.tintColor = color
        modelSizeUpButton.isUserInteractionEnabled = enabled
        
        modelSizeDownButton.tintColor = color
        modelSizeDownButton.isUserInteractionEnabled = enabled
        
        modelDeleteButton.tintColor = color
        modelDeleteButton.isUserInteractionEnabled = enabled
    }
    
    func setClothingButtonsEnabled(enabled: Bool) {
        
        let color: UIColor = enabled ? .greenBG : .greenBGDisabled

        pickerTextField.backgroundColor = color
        pickerTextField.isUserInteractionEnabled = enabled
        
        sizeLabel.backgroundColor = color
        
        sizeUpButton.tintColor = color
        sizeUpButton.isUserInteractionEnabled = enabled
        
        sizeDownButton.tintColor = color
        sizeDownButton.isUserInteractionEnabled = enabled
    }
    
    func addAndEnableModelButtons() {
        
        modelSizeUpButton.addTarget(self, action: #selector(didTapScaleUp), for: .touchUpInside)
        modelSizeDownButton.addTarget(self, action: #selector(didTapScaleDown), for: .touchUpInside)
        modelDeleteButton.addTarget(self, action: #selector(modelDeleteTapped), for: .touchUpInside)
        
        setModelButtonsEnabled(enabled: true)
        
        if !Global.selectedItem.isEmpty {
            setClothingButtonsEnabled(enabled: true)
        }
        
        self.view.addSubview(modelSizeUpButton)
        self.view.addSubview(modelSizeDownButton)
        self.view.addSubview(modelDeleteButton)
        
        NSLayoutConstraint.activate([
            modelSizeUpButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
            modelSizeUpButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            modelSizeUpButton.heightAnchor.constraint(equalToConstant: 40),
            modelSizeUpButton.widthAnchor.constraint(equalToConstant: 50),
            
            modelSizeDownButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
            modelSizeDownButton.topAnchor.constraint(equalTo: modelSizeUpButton.bottomAnchor, constant: 10.0),
            modelSizeDownButton.heightAnchor.constraint(equalToConstant: 40),
            modelSizeDownButton.widthAnchor.constraint(equalToConstant: 50),
            
            modelDeleteButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
            modelDeleteButton.topAnchor.constraint(equalTo: modelSizeDownButton.bottomAnchor, constant: 10.0),
            modelDeleteButton.heightAnchor.constraint(equalToConstant: 40),
            modelDeleteButton.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// didTap Functions
extension ARTestViewController {
    
    @objc func didTapPickerDone() {
        
         if let node = self.sceneView.scene.rootNode.childNode(withName: Global.selectedType, recursively: true) {
            
            // kind of hacky, we shouldn't have to hardcode in the actual node name
            node.geometry?.material(named: "item")?.diffuse.contents = currentColorNamePair.color
            node.geometry?.material(named: "tongue")?.diffuse.contents = currentColorNamePair.color
            node.geometry?.material(named: "upper")?.diffuse.contents = currentColorNamePair.color
            
        }
        
        pickerTextField.resignFirstResponder()
    }
    
    @objc func modelDeleteTapped() {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            
            node.removeFromParentNode()
            numModels -= 1
            modelDeleteButton.removeFromSuperview()
            modelSizeUpButton.removeFromSuperview()
            modelSizeDownButton.removeFromSuperview()
            
            setModelButtonsEnabled(enabled: false)
            setClothingButtonsEnabled(enabled: false)
        }
    }
    
    // Handler for tapping scale up button
    @objc func didTapSizeUp() {
        
        if Global.size < Global.maxSize {
            
            Global.size += 1
            
            if let newSize = Global.sizes[Global.size] {
                sizeLabel.text = "Size \(newSize)"
            }

            //add function for changing size of clothes up
            scaleClothes()
        }
    }
    
    // Handler for tapping scale down button
    @objc func didTapSizeDown () {
        
        if Global.size > Global.minSize {
            
            Global.size -= 1
            
            if let newSize = Global.sizes[Global.size] {
                sizeLabel.text = "Size \(newSize)"
            }

            //add function for changing size of clothes down
            scaleClothes()
        }
    }
    
    // Handler for tapping scale down button
    @objc func didTapScaleDown () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.scaleDownSmall)
        }
    }
    
    // Handler for tapping scale down button
    @objc func didTapScaleUp () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.scaleUpSmall)
        }
    }
    
    // Handler for tapping rotate right button
    @objc func didTapRotateRight (gesture: UITapGestureRecognizer) {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.rotateRightSmall)
        }
    }
    
    // Handler for tapping rotate left button
    @objc func didTapRotateLeft () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.rotateLeftSmall)
        }
    }
    
    // Handler for holding rotate right button
    @IBAction func didPressRotateRight(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(didTapRotateRight), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // Handler for holding rotate left button
    @IBAction func didPressRotateLeft(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(didTapRotateLeft), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
}

// Picker delegate functions
extension ARTestViewController {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerValues[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.backgroundColor = pickerValues[row].color
        pickerTextField.text = pickerValues[row].name
        currentColorNamePair = pickerValues[row]
        pickerTextField.reloadInputViews()
    }
}
