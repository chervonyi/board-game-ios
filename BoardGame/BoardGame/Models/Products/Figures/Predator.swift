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
        priority = 40
        
        ableToMove = true
        ableToFight = true
        
        blackFigureIcon = "predator_b"
        redFigureIcon = "predator_r"
        shopView = "predator_shop"
    }
    
    override func getAvailableCellsToMove(from position: Int) -> [Int] {
        guard Cell.isExist(position) else { return [Int]() }
        
        var availabelCells = [Int]()
        
        let (x, y) = Cell.getXY(from: position)
        
        let arrayX = [x - 1, x + 1, x - 1, x + 1]
        let arrayY = [y - 1, y - 1, y + 1, y + 1]
        
        for i in 0..<arrayX.count {
            let tmpX = arrayX[i]
            let tmpY = arrayY[i]
            
            if (Cell.isExist(tmpX, tmpY)) {
                availabelCells.append(Cell.getPosition(tmpX, tmpY))
            }
        }
        
        return availabelCells
    }
}
