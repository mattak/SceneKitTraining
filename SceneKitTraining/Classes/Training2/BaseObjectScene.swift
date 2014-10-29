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
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
        rootNode.addChildNode(cameraNode)

        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = NSColor.darkGrayColor()
        rootNode.addChildNode(ambientLightNode)
        
        let text = createText()
        rootNode.addChildNode(text)
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
    
    func createCapsule() -> SCNNode {
        let capsule = SCNCapsule(capRadius: 1, height: 4)
        let capsuleNode = SCNNode(geometry: capsule)
        return capsuleNode
    }
    
    func createCone() -> SCNNode {
        let cone = SCNCone(topRadius: 1, bottomRadius: 2, height: 2)
        let coneNode = SCNNode(geometry: cone)
        let rotateDegree : CGFloat = CGFloat(M_PI_4) / 2
        coneNode.transform = SCNMatrix4MakeRotation(1.0, rotateDegree, rotateDegree, 0)
        return coneNode
    }
    
    func createCylinder() -> SCNNode {
        let cylinder = SCNCylinder(radius: 1.0, height: 2.0)
        let cylinderNode = SCNNode(geometry: cylinder)
        let rotateDegree : CGFloat = CGFloat(M_PI_4) / 2
        cylinderNode.transform = SCNMatrix4MakeRotation(1.0, rotateDegree, rotateDegree, 0)
        return cylinderNode
    }
    
    func createFloor() -> SCNNode {
        let floor = SCNFloor()
        let floorNode = SCNNode(geometry: floor)
        let rotateDegree : CGFloat = CGFloat(M_PI_4)
        floorNode.transform = SCNMatrix4MakeRotation(rotateDegree, 0.1, 1, 0)
        return floorNode
    }
    
    func createPlane() -> SCNNode {
        let plane = SCNPlane(width: 1.5, height: 1.5)
        plane.firstMaterial!.doubleSided = true
        plane.firstMaterial!.diffuse.contents = NSColor.darkGrayColor()
        let planeNode = SCNNode(geometry: plane)
        return planeNode
    }
    
    func createPyramid() -> SCNNode {
        let pyramid = SCNPyramid(width: 1.5, height: 1.5, length: 1.5)
        pyramid.firstMaterial!.doubleSided = true
        pyramid.firstMaterial!.diffuse.contents = NSColor.darkGrayColor()
        let pyramidNode = SCNNode(geometry: pyramid)
        let rotateDegree : CGFloat = CGFloat(M_PI_4)
        pyramidNode.transform = SCNMatrix4MakeRotation(rotateDegree, 1, 0, 0)
        return pyramidNode
    }
    
    func createShape() -> SCNNode {
        let path = NSBezierPath()
        let step : CGFloat = CGFloat(M_PI * 2 / 5)
        let scale : CGFloat = CGFloat(0.4)
        
        path.moveToPoint(NSMakePoint(cos(0), sin(0)))
        path.lineToPoint(NSMakePoint(scale * cos(step * 0.5), scale * sin(step * 0.5)))
        let i : CGFloat = 0
        for i in 1...4 {
            let pos : CGFloat = CGFloat(step * CGFloat(i))
            let pos_offset : CGFloat = CGFloat(step * CGFloat(CGFloat(i) + 0.5))
            path.lineToPoint(NSMakePoint(cos(pos), sin(pos)))
            path.lineToPoint(NSMakePoint(scale * cos(pos_offset), scale * sin(pos_offset)))
        }
        path.closePath()
        
        let shape = SCNShape(path: path, extrusionDepth: 1.0)
        shape.firstMaterial!.diffuse.contents = NSColor.darkGrayColor()
        
        let shapeNode = SCNNode(geometry: shape)
        return shapeNode
    }
    
    func createSphere() -> SCNNode {
        let sphere = SCNSphere(radius: 1)
        let sphereNode = SCNNode(geometry: sphere)
        return sphereNode
    }
    
    func createText() -> SCNNode {
        let text = SCNText(string: "Hello Text", extrusionDepth: 2)
        text.font = NSFont(name: "Arial", size: 1.0)
        text.chamferRadius = 0.3
        text.flatness = 0.1
        text.firstMaterial!.diffuse.contents = NSColor.darkGrayColor()
        text.alignmentMode = kCAAlignmentCenter
        text.containerFrame = CGRectMake(-2.4, 0.0, 5, 1)
        let textNode = SCNNode(geometry: text)
        let rotateDegree : CGFloat = CGFloat(M_PI_4)
        return textNode
    }
    
    func createTextMaterial() -> SCNMaterial {
        let material = SCNMaterial()
        material.specular.contents = NSColor.darkGrayColor()
        // material.reflective.contents = "color_envmap.png"
        material.shininess = 0.1
        return material
    }
    
    func createTorus() -> SCNNode {
        let torus = SCNTorus(ringRadius: 1.0, pipeRadius: 0.4)
        let torusNode = SCNNode(geometry: torus)
        torusNode.transform = SCNMatrix4MakeRotation(CGFloat(M_PI_4), 1, 0, 0)
        return torusNode
    }
    
    func createTube() -> SCNNode {
        let tube = SCNTube(innerRadius: 0.5, outerRadius: 1.0, height: 2)
        let tubeNode = SCNNode(geometry: tube)
        tubeNode.transform = SCNMatrix4MakeRotation(CGFloat(M_PI_4 * 2 / 3), 1, 0, 0)
        return tubeNode
    }
}
