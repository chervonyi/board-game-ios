//
//  Advertisement.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Advertisement : Card {
    
    let REWARD = 30
    
    override var information: String! {
        get {
            return "Watch video ads to get extra $" + String(REWARD) + "!"
        }
        set { }
    }
    
    override var submitQuestion: String! {
        get {
            return "Watch"
        }
        set { }
    }
    
    override init() {
        super.init()
        cost = 0
        shopView = "advertisement"
    }
    
    override func use(user: Game.PlayerState, game: Game) -> Bool {
        return false
    }
}
