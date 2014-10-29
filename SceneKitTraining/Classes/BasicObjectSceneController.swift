//
//  BasicObjectSceneController.swift
//  SceneKitTraining
//
//  Created by Mattak on 2014/10/25.
//  Copyright (c) 2014年 Mattak. All rights reserved.
//

import SceneKit
import QuartzCore

class BasicObjectSceneController: NSViewController {

    @IBOutlet weak var baseView: BaseView!

    override func awakeFromNib () {
        let scene = BaseObjectScene(named: "cube scene")

        self.baseView!.scene = scene
        self.baseView!.allowsCameraControl = true
        self.baseView!.showsStatistics = true
        self.baseView!.backgroundColor = NSColor.whiteColor()
    }
}
