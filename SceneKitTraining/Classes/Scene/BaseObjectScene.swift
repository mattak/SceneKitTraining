//
//  BaseObjectScene.swift
//  SceneKitTraining
//
//  Created by Mattak on 2014/10/25.
//  Copyright (c) 2014年 Mattak. All rights reserved.
//

import SceneKit

class BaseObjectScene: SCNScene {
    init(named name: String) {
        super.init()

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        rootNode.addChildNode(cameraNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = NSColor.darkGrayColor()
        rootNode.addChildNode(ambientLightNode)
        
        let cube = createCube()
        rootNode.addChildNode(cube)
    }

    required init(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }
    
    func createCube() -> SCNNode {
        let cube = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        let cubeNode = SCNNode(geometry: cube)
        let rotateDegree : CGFloat = CGFloat(M_PI_4) / 2
        cubeNode.transform = SCNMatrix4MakeRotation(1.0, rotateDegree, rotateDegree, 0)
        return cubeNode
    }
}