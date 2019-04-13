//
//  CreateRandomFigure.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class CreateRandomFigure : Card {
    
    override var information: String! {
        get {
            return  "Create a random piece for $" + String(cost)
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
        cost = 8
        shopView = "new_figure"
    }
    
    override func use(user: Game.PlayerState) -> Bool {
        return false
    }
}
