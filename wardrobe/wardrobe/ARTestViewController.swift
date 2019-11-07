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

class ARTestViewController: UIViewController, ARSCNViewDelegate {
    
    lazy var numModels = Int()
    static let rotateRightSmall = SCNAction.rotateBy(x: 0, y: 0.2, z: 0, duration: 0.05)
    static let rotateLeftSmall = SCNAction.rotateBy(x: 0, y: -0.2, z: 0, duration: 0.05)
    static let scaleUpSmall = SCNAction.scale(by: 1.1, duration: 0.05)
    static let scaleDownSmall = SCNAction.scale(by: 0.9, duration: 0.05)
    
    var timer: Timer = Timer()
    
    var modelFileName : String = "other_model"
    
    var previousGenderSelected : Gender = Global.gender

    @IBOutlet var sceneView: ARSCNView!
    
    lazy var scaleSlider: UISlider = {
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300,height: 10))
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.isContinuous = true
        slider.tintColor = Global.greenBG
        slider.value = 50
        
        return slider
    }()
    
    lazy var scaleUpButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = Global.greenBG
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapScaleUp))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressScaleUp))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy var scaleDownButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = Global.greenBG
        button.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapScaleDown))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressScaleDown))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy var rotateRightButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = Global.greenBG
        button.setImage(UIImage(systemName: "arrow.counterclockwise.circle.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRotateRight))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressRotateRight))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy var rotateLeftButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = Global.greenBG
        button.setImage(UIImage(systemName: "arrow.clockwise.circle.fill"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapRotateLeft))
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(didPressRotateLeft))
        
        button.addGestureRecognizer(longGesture)
        button.addGestureRecognizer(tapGesture)
        return button
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel();
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8.0
        label.layer.masksToBounds = true
        label.backgroundColor = Global.greenBG
        label.text = "Size: M"
        label.textColor = .gray
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a gesture recognizer for tapping to insert the model
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        self.tabBarController?.tabBar.backgroundColor = .clear
        self.tabBarController?.tabBar.isTranslucent = true
        self.sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // Set up the UI
        setupUI()
    }
    
    // Handler for tapping scale up button
    @objc func didTapScaleUp() {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.scaleUpSmall)
        }
    }
    
    // Handler for tapping scale down button
    @objc func didTapScaleDown () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: modelFileName, recursively: false) {
            node.runAction(ARTestViewController.scaleDownSmall)
        }
    }
    
    // Handler for holding scale up button
    @IBAction func didPressScaleUp(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapScaleUp), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // Handler for holding scale down button
    @IBAction func didPressScaleDown(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapScaleDown), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
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
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapRotateRight), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // Handler for holding rotate left button
    @IBAction func didPressRotateLeft(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapRotateLeft), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
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
        
        let scene = SCNScene(named: "art.scnassets/" + modelFileName + ".scn")
    
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
            }
        }
    }
    
    // Add clothing item to model
    func addClothingToModel() {
        let scene = SCNScene(named: "art.scnassets/" + Global.selectedItem + ".scn")

        DispatchQueue.main.async {
            if let node = scene?.rootNode.childNode(withName: "shirt", recursively: false) {
                node.scale = SCNVector3Make(105, 105, 105)
                node.position = SCNVector3Make(1.5, 40, 2)
                self.sceneView.automaticallyUpdatesLighting = true
                self.sceneView.autoenablesDefaultLighting = true
                self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true)!.addChildNode(node)
            }
        }
    }
    
    // Replace old item with new item (Hard coded at the moment)
    func replaceClothingOnModel() {
        if let oldNode = self.sceneView.scene.rootNode.childNode(withName: "shirt", recursively: true) {
            let scene = SCNScene(named: "art.scnassets/" + Global.selectedItem + ".scn")
            if let newNode = scene?.rootNode.childNode(withName: "shirt", recursively: true) {
                newNode.scale = SCNVector3Make(105, 105, 105)
                newNode.position = SCNVector3Make(1.5, 40, 2)
                self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true)!.replaceChildNode(oldNode, with: newNode)
            }
        }
    }
    
    // Replace model when a different gender has beens selected
    func replaceModel() {
        let oldModelFileName : String = modelFileName
        
        setModelFileName();
        
        if let oldNode = self.sceneView.scene.rootNode.childNode(withName: oldModelFileName, recursively: true) {
            print(oldModelFileName)
            let scene = SCNScene(named: "art.scnassets/" + modelFileName + ".scn")
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
        if (Global.selectedItem != "" && self.sceneView.scene.rootNode.childNodes.count > 4) {
            // Check if model has clothing type on it already
            if (self.sceneView.scene.rootNode.childNode(withName: self.modelFileName, recursively: true)!.childNodes.count > 0) {
                replaceClothingOnModel()
            }
            else {
                print(Global.selectedItem)
                addClothingToModel()
            }
        }
        
        // Check if gender has been changed
        // Check count to see if a model is there already
        if (previousGenderSelected != Global.gender && self.sceneView.scene.rootNode.childNodes.count > 4) {
            replaceModel()
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
    
    // Set up the UI (not AR related)
    func setupUI() {
        
        self.view.addSubview(scaleSlider)
        self.view.addSubview(scaleUpButton)
        self.view.addSubview(scaleDownButton)
        self.view.addSubview(rotateRightButton)
        self.view.addSubview(rotateLeftButton)
        self.view.addSubview(sizeLabel)
        
        NSLayoutConstraint.activate([
            
            scaleSlider.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            scaleSlider.widthAnchor.constraint(equalToConstant: 130),
            scaleSlider.heightAnchor.constraint(equalToConstant: 10),
            scaleSlider.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            
            scaleDownButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -75.0),
            scaleDownButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -35.0),
            
            scaleUpButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 75.0),
            scaleUpButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -35.0),
            scaleUpButton.heightAnchor.constraint(equalToConstant: 50),
            scaleUpButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            rotateRightButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            rotateRightButton.bottomAnchor.constraint(equalTo: self.scaleDownButton.topAnchor, constant: -55.0),
            rotateRightButton.heightAnchor.constraint(equalToConstant: 50.0),
            rotateRightButton.widthAnchor.constraint(equalToConstant: 50.0),
            scaleDownButton.heightAnchor.constraint(equalToConstant: 50),
            scaleDownButton.widthAnchor.constraint(equalToConstant: 50),
            
            
            rotateLeftButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            rotateLeftButton.bottomAnchor.constraint(equalTo: self.scaleDownButton.topAnchor, constant: -55.0),
            rotateLeftButton.heightAnchor.constraint(equalToConstant: 50.0),
            rotateLeftButton.widthAnchor.constraint(equalToConstant: 50.0),
            
            
            sizeLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            sizeLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -45.0),
            sizeLabel.heightAnchor.constraint(equalToConstant: 30),
            sizeLabel.leadingAnchor.constraint(equalTo: scaleDownButton.trailingAnchor, constant: 8),
            sizeLabel.trailingAnchor.constraint(equalTo: scaleUpButton.leadingAnchor, constant: -8)
            
//            sizeLabel.widthAnchor.constraint(equalToConstant: 50),
            
            
        
        ])
        
    }
}
