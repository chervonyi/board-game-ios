//
//  Stone.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Stone : Figure {
    
    override init() {
        super.init()
        
        cost = 6
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "stone_b"
        redFigureIcon = "stone_r"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        return [Int]()
    }
}
