//
//  Predator.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Predator : Figure {
    
    override init() {
        super.init()
        
        cost = 4
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "predator_b"
        redFigureIcon = "predator_r"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        return [Int]()
    }
}
