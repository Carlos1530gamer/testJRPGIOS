//
//  Player.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import Foundation
import SceneKit

enum PlayerAnimation: String {
    case dance = "dance"
}

class Player: Creature , SCNNodeRendererDelegate{
    var stamina: Double
    var animations = [String: CAAnimation]()
    var mesh: SCNNode!
    
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
        guard let path = Bundle.main.path(forResource: "player", ofType: "scn", inDirectory: "art.scnassets") else { return }
        let url = URL(fileURLWithPath: path)
        guard let scene = try? SCNScene(url: url, options: nil) else { return }
        
        //
        for childNode in scene.rootNode.childNodes {
            if childNode.name == "player"{
                for child in childNode.childNodes{
                    if child.name == "mesh"{
                        self.mesh = child
                    }
                    self.addChildNode(child)
                }
                self.physicsBody = childNode.physicsBody
            }
        }
        
        loadAnimation(withKey: "dance", sceneName: "art.scnassets/Animations/Player/Breakdance", animationIdentifier: "Breakdance-1")
        
        loadAnimation(withKey: "stay", sceneName: "art.scnassets/Animations/Player/Idle", animationIdentifier: "Idle-1", isInfinite: true)
    }
    
    //MARK: private funcs
    
    private func loadAnimation(withKey: String, sceneName:String, animationIdentifier:String) {
        let sceneURL = Bundle.main.url(forResource: sceneName, withExtension: "dae")
        let sceneSource = SCNSceneSource(url: sceneURL!, options: nil)!
        
        if let animationObject = sceneSource.entryWithIdentifier(animationIdentifier, withClass: CAAnimation.self) {
            // The animation will only play once
            animationObject.repeatCount = 1
            // To create smooth transitions between animations
            animationObject.fadeInDuration = CGFloat(1)
            animationObject.fadeOutDuration = CGFloat(0.5)
            // Store the animation for later use
            animations[withKey] = animationObject
        }
    }
    
    private func loadAnimation(withKey: String, sceneName:String, animationIdentifier:String, isInfinite: Bool) {
        let sceneURL = Bundle.main.url(forResource: sceneName, withExtension: "dae")
        let sceneSource = SCNSceneSource(url: sceneURL!, options: nil)!
        
        if let animationObject = sceneSource.entryWithIdentifier(animationIdentifier, withClass: CAAnimation.self) {
            if(isInfinite){
                animationObject.repeatCount = .infinity
            }else{
                // The animation will only play once
                animationObject.repeatCount = 1
            }
            // To create smooth transitions between animations
            animationObject.fadeInDuration = CGFloat(1)
            animationObject.fadeOutDuration = CGFloat(0.5)
            // Store the animation for later use
            self.addAnimation(animationObject, forKey: withKey)
        }
    }
    
    
    func playAnimation(_ animationKey: PlayerAnimation){
        self.addAnimation(animations[animationKey.rawValue]!, forKey: animationKey.rawValue)
    }
    
    //MARK: render delegte functions
}
