//
//  KillRandomEnemy.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class KillRandomEnemy : Card {
    
    override var information: String! {
        get {
            return "Kill a random piece for $" + String(cost)
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
        cost = 5
        shopView = "random_kill"
    }
    
    override func use(user: Game.PlayerState, game: Game) -> Bool {
        
        // Get random figure of 'user' enemy and destroy (reset) it
        game.board.getFigures(of: user.reverse).random.reset()
        return true
    }
}
