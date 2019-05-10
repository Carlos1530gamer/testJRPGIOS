//
//  Player.swift
//  iOSJRpg
//
//  Created by Carlos Daniel Hernandez Chauteco on 5/9/19.
//  Copyright © 2019 chauteco. All rights reserved.
//

import Foundation

class Player: Creature {
    var stamina: Double = 100.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
