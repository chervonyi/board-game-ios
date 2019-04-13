//
//  NewShop.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class NewShop : Card {
    
    override var information: String! {
        get {
            return "Refill the shop with new products for $" + String(cost)
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
        cost = 6
        shopView = "new_shop"
    }
    
    override func use(user: Game.PlayerState) -> Bool {
        return false
    }
}
