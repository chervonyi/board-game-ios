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
        
        cost = 10
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "soldier_b"
        redFigureIcon = "soldier_r"
        shopView = "soldier_shop"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        
        guard Cell.isExist(position) else { return [Int]() }
        
        var availabelCells = [Int]()
        
        let (x, y) = Cell.getXY(from: position)
        
        let minX = x - 1
        let maxX = x + 1
        let minY = y - 1
        let maxY = y + 1
        
        for _y in minY...maxY {
            for _x in minX...maxX {
                if Cell.isExist(_x, _y) && !(x == _x && y == _y) {
                    availabelCells.append(Cell.getPosition(_x, _y))
                }
            }
        }
        
        return availabelCells
    }
}
