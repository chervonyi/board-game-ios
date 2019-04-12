//
//  Game.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Game {
    
     enum PlayerState {
        case ENEMY, ALLIANCE
    }
    
    var board = [Cell]()
    
    private var _selectedCell = -1
    
    var selectedCell: Int {
        set {
            
        }
        
        get {
            return _selectedCell
        }
    }
    
}
