//
//  Gun.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/14/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import Foundation
import SceneKit

class Gun: SCNNode{
    var power: Double
    var staminaCost: Double
    
    init(power: Double, staminaCost: Double) {
        self.power = power
        self.staminaCost = staminaCost
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
