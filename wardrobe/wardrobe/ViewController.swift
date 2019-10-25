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

class ViewController: UIViewController, ARSCNViewDelegate {
    
    lazy var numModels = Int()

    @IBOutlet var sceneView: ARSCNView!
    
    lazy var scaleUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .green
        button.setTitle("Scale Up", for: .normal)
        button.addTarget(self, action: #selector(didTapScaleUp), for: .touchUpInside)
        return button
    }()
    
    lazy var scaleDownButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tintColor = .red
        button.setTitle("Scale Down", for: .normal)
        button.addTarget(self, action: #selector(didTapScaleDown), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // create a gesture recognizer for tapping to insert the model
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        // set up the UI
        setupUI()
    }
    
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        
        // get the scene view and the coordinates of the tap
        let sceneView = gesture.view as? ARSCNView
        let touchCoords = gesture.location(in: sceneView)
        
        // create the hit test object, this will allow us to determine
        // if the user tapped a plane
        guard let hitTest = sceneView?.hitTest(touchCoords, types: .existingPlaneUsingExtent), !hitTest.isEmpty, let hitTestRes = hitTest.first else {
            
            return
        }
        
        // get the position of the center of the plane
        let position = SCNVector3Make(hitTestRes.worldTransform.columns.3.x, hitTestRes.worldTransform.columns.3.y, hitTestRes.worldTransform.columns.3.z)
        
        print(position)
        
        // add item to our scene
        addItemToPosition(position)
        
    }
    
    @objc func didTapScaleUp() {
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.scale.x += 0.1
            node.scale.y += 0.1
            node.scale.z += 0.1
        }
    }
    
    @objc func didTapScaleDown () {
        if let node = sceneView.scene.rootNode.childNode(withName: "human_male", recursively: false) {
            node.scale.x -= 0.1
            node.scale.y -= 0.1
            node.scale.z -= 0.1
        }
    }
  
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
    
    func setupUI() {
        
        self.view.addSubview(scaleUpButton)
        self.view.addSubview(scaleDownButton)
        
        NSLayoutConstraint.activate([
            
            scaleDownButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: -50.0),
            scaleDownButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25.0),
            
            scaleUpButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 50.0),
            scaleUpButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25.0),
        
        ])
        
    }
}
