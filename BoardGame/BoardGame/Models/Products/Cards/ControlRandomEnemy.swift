//
//  ControlRandomEnemy.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class ControlRandomEnemy : Card {
    
    override var information: String! {
        get {
            return  "Take control of the random enemy piece for $" + String(cost)
        }
        set { }
    }
    
    override var submitQuestion: String! {
        get {
            return "Use"
        }
        set { }
    }
    
    override init() {
        super.init()
        cost = 10
        shopView = "control"
    }
    
    override func use(user: Game.PlayerState) -> Bool {
        return false
    }
}
