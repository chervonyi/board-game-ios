//
//  Soldier.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Soldier : Figure {
    
    override init() {
        super.init()
        
        cost = 20
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "soldier_b"
        redFigureIcon = "soldier_r"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        return [Int]()
    }
}
