//
//  ViewController.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import UIKit
import SceneKit
import CDJoystick

class ViewController: UIViewController {
    //MARK: propieties
    @IBOutlet weak var sceneView: SCNView!
    let player = Player(stamina: 100.0)
    @IBOutlet weak var joystick: CDJoystick!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadScene()
        loadJoystick()
    }
    
    
    private func loadScene(){
        let scene = SCNScene(named: "art.scnassets/Maps/FirstScene.scn")!
        scene.rootNode.addChildNode(player)
        self.sceneView.scene = scene
    }
    
    private func loadJoystick(){
        joystick.trackingHandler = {[weak self] data in
            
        }
        
    }
    
}

