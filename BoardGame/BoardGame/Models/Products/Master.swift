//
//  Master.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation


class Master : Figure {
    
    override init() {
        super.init()
        
        cost = 16
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "master_b"
        redFigureIcon = "master_r"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        return [Int]()
    }
}
