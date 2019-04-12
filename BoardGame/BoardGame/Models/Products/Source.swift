//
//  Source.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Source : Figure {
    
    override init() {
        super.init()
        
        cost = 5
        
        ableToMove = false
        ableToFight = false
        
        blackFigureIcon = "sorket_b"
        redFigureIcon = "sorket_r"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        return [Int]()
    }
}
