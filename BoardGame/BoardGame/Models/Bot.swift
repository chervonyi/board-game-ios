//
//  Bot.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Bot {
    
    func getMove(board: [Cell]) -> Move {
        
        var cellsToMove = [Move]()
        
        for cell in board {
            if cell.owner == Game.PlayerState.ENEMY {
                for i in cell.availabelCellsToMove {
                    if board[i].isEmpty || board[i].owner == Game.PlayerState.ALLIANCE {
                        cellsToMove.append(Move(from: cell.id, to: i))
                    }
                }
            }
        }
        
        return cellsToMove.count > 0 ? cellsToMove[cellsToMove.count.random] : Move(from: -1, to: -1)
    }
}
