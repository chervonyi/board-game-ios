//
//  Base.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Base {
    
    private let owner: Game.PlayerState
    
    private let size: Int
    
    private let from: Int
    private let to: Int
    
    init(owner: Game.PlayerState, sizeOfBase: Int) {
        self.owner = owner
        self.size = sizeOfBase
        
        if (owner == Game.PlayerState.ENEMY) {
            from = 0
            to = Game.COLUMNS * sizeOfBase - 1
        } else {
            from = Game.CELLS - Game.COLUMNS * sizeOfBase
            to = Game.CELLS - 1
        }
    }

    func getFreeCells(board: [Cell]) -> [Int] {
    
        var freeCells = [Int]()
    
        for i in from...to {
            if board[i].isEmpty {
                freeCells.append(i)
            }
        }
        
        return freeCells
    }

    func getRandomFreeCell(board: [Cell]) -> Int? {
        let freeCells = getFreeCells(board: board)
        
        if freeCells.count == 0 {
            return nil
        }
        
        return freeCells[freeCells.count.random]
    }
}

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}









