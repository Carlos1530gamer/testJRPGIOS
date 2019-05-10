//
//  Creature.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import Foundation
import SceneKit

class Creature: SCNNode {
    var life: Double = 100.0{
        willSet(newValueOfLife){
            if(newValueOfLife == 0){
                died()
            }
        }
    }
    
    internal func died(){
        
    }
}
