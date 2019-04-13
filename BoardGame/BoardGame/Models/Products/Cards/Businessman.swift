//
//  Businessman.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Businessman : Card {
    
    override var information: String! {
        get {
            return "Add +1$ for every subsequent move for $" + String(cost)
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
        cost = 3
        shopView = "business"
    }
    
    override func use(user: Game.PlayerState) -> Bool {
        return false
    }
}
