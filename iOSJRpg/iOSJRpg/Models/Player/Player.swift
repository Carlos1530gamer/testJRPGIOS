//
//  Player.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import Foundation
import SceneKit

class Player: Creature , SCNNodeRendererDelegate{
    var stamina: Double
    
    init(stamina: Double) {
        self.stamina = stamina
        super.init()
        loadModel()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: init geometry of this node
    private func loadModel(){
        //load the scene with node
        guard let path = Bundle.main.path(forResource: "human", ofType: "scn", inDirectory: "art.scnassets") else { return }
        let url = URL(fileURLWithPath: path)
        guard let scene = try? SCNScene(url: url, options: nil) else { return }
        
        //
        for childNode in scene.rootNode.childNodes {
            if childNode.name == "player"{
                self.geometry = childNode.geometry
                for child in childNode.childNodes{
                    self.addChildNode(child)
                }
                self.physicsBody = childNode.physicsBody
            }
        }
    }
    
    //MARK: render delegte functions
}
