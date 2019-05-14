//
//  ViewController.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
    //MARK: propieties
    @IBOutlet weak var sceneView: SCNView!
    let player = Player(stamina: 100.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadScene()
    }
    
    
    private func loadScene(){
        let scene = SCNScene()
        scene.rootNode.addChildNode(player)
        self.sceneView.scene = scene
    }
}

