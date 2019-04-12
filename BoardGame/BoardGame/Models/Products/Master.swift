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
        guard Cell.isExist(position) else { return [Int]() }
        
        var availabelCells = [Int]()
        
        let (x, y) = Cell.getXY(from: position)
        
        let minX = x - 2
        let maxX = x + 2
        let minY = y - 2
        let maxY = y + 2
        
        for _y in minY...maxY {
            for _x in minX...maxX {
                if Cell.isExist(_x, _y) && x != _x && y != _y {
                    availabelCells.append(Cell.getPosition(_x, _y))
                }
            }
        }
        
        return availabelCells
    }
}
