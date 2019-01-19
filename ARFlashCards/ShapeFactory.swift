//
//  ShapeFactory.swift
//  ARFlashCards
//
//  Created by Zack Schreur on 1/19/19.
//  Copyright © 2019 Zack Schreur. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class ShapesFactory {
    
    var sceneView: ARSCNView!
    
    init(sceneView: ARSCNView) {
        self.sceneView = sceneView
    }
    
    func createShape(filePath: String, nodeName: String,
                     anchor: ARImageAnchor) {
        let obj = SCNScene(named: filePath)!
        let objNode = obj.rootNode.childNode(withName: nodeName, recursively: true)
        self.sceneView.scene.rootNode.addChildNode(objNode!)
        print("anchor position:", anchor.transform[0])
        objNode!.position = SCNVector3(
            anchor.transform.columns.3.x,
            anchor.transform.columns.3.y,
            anchor.transform.columns.3.z)
    }
    
}
