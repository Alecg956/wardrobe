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

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Enable plane detection
        configuration.planeDetection = .horizontal
        
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
}
