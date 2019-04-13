//
//  Card.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Card : Product {
    
    var information: String!
    
    var submitQuestion: String!
    
    func use(user: Game.PlayerState) -> Bool {
        return false
    }
}
