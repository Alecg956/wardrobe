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

    @IBOutlet var sceneView: ARSCNView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // create a gesture recognizer for tapping to insert the model
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapScreen(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        self.tabBarController?.tabBar.backgroundColor = .clear
        self.tabBarController?.tabBar.isTranslucent = true
        self.sceneView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        // set up the UI
        setupUI()
    }
    
    // Handler for tapping scale up button
    @objc func didTapScaleUp() {
        
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.runAction(ARTestViewController.scaleUpSmall)
        }
    }
    
    // handler for tapping scale down button
    @objc func didTapScaleDown () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.runAction(ARTestViewController.scaleDownSmall)
        }
    }
    
    // handler for holding scale up button
    @IBAction func didPressScaleUp(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapScaleUp), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // handler for holding scale down button
    @IBAction func didPressScaleDown(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapScaleDown), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // handler for tapping rotate right button
    @objc func didTapRotateRight (gesture: UITapGestureRecognizer) {
        
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.runAction(ARTestViewController.rotateRightSmall)
        }
    }
    
    // handler for tapping rotate left button
    @objc func didTapRotateLeft () {
        
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.runAction(ARTestViewController.rotateLeftSmall)
        }
    }
    
    // handler for holding rotate right button
    @IBAction func didPressRotateRight(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapRotateRight), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // handler for holding rotate left button
    @IBAction func didPressRotateLeft(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(didTapRotateLeft), userInfo: nil, repeats: true)
        } else if gesture.state == .ended || gesture.state == .cancelled {
            timer.invalidate()
        }
    }
    
    // Handler for adding the model to the scene
    @objc func didTapScreen(_ gesture: UITapGestureRecognizer) {
        
        // get the scene view and the coordinates of the tap
        let sceneView = gesture.view as? ARSCNView
        let touchCoords = gesture.location(in: sceneView)
        
        // create hit test object, allows us to determine if a plane tapped
        guard let hitTest = sceneView?.hitTest(touchCoords, types: .existingPlaneUsingExtent), !hitTest.isEmpty, let hitTestRes = hitTest.first else {
            
            return
        }
        
        // get the position of the center of the plane
        let position = SCNVector3Make(hitTestRes.worldTransform.columns.3.x, hitTestRes.worldTransform.columns.3.y, hitTestRes.worldTransform.columns.3.z)
        
        print(position)
        
        // add item to our scene
        addItemToPosition(position)
        
    }
    
    // Add an item to the scene on tap
    func addItemToPosition(_ position: SCNVector3) {
        
        if numModels >= 1 {
            return
        }
        
        guard let url = Bundle.main.url(forResource: "human_male", withExtension: "usdz", subdirectory: "art.scnassets") else { return }
        
        let scene: SCNScene
        
        do {
            scene = try SCNScene(url: url, options: [.checkConsistency: true])
        } catch {
            fatalError()
        }
        
        // add to the scene in the background to not block the UI
        DispatchQueue.main.async {
            
            if let node = scene.rootNode.childNode(withName: "human_male", recursively: false) {
                
                self.numModels += 1
                
                node.position = position
                node.scale = SCNVector3Make(0.9, 0.9, 0.9)
                
                self.sceneView.automaticallyUpdatesLighting = true
                self.sceneView.autoenablesDefaultLighting = true
                self.sceneView.scene.rootNode.addChildNode(node)
                
            }
        }
    }
    
    // Set up the initial state of the scene, this is called
    // anytime the tab is tapped (we should update the model here)
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
        
        self.view.addSubview(scaleUpButton)
        self.view.addSubview(scaleDownButton)
        self.view.addSubview(rotateRightButton)
        self.view.addSubview(rotateLeftButton)
        
        NSLayoutConstraint.activate([
            
            scaleDownButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -50.0),
            scaleDownButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -35.0),
            
            scaleUpButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 50.0),
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
        
        ])
        
    }
}
