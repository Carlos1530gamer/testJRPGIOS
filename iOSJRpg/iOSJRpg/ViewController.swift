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
            self?.player.childNode(withName: "mesh", recursively: true)?.eulerAngles.y = Float(-data.angle)
            self?.player.playAnimation(.run)
            if data.velocity.x != 0 || data.velocity.y != 0{
                self?.player.position.x -= Float(data.velocity.x/10)
                self?.player.position.z -= Float(data.velocity.y/10)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.player.playAnimation(.run)
    }
    
}

