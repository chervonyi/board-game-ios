//
//  Bot.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Bot {
    
    private var shop = Shop(owner: Game.PlayerState.ENEMY)
    
    func getMove(game: Game) -> Move {
        
        // Get random number from 0 to 99 to make prediction of bot action
        let prediction = 100.random
        
        if prediction > 40 {
            // 60% chance to make the best move
            return getBestMove(board: game.board)
        } else if prediction > 30 {
            // 10% chance to make a random move
            return getRandomMove(board: game.board)
        } else if buyRandomProduct(game: game) {
            // 30% chance to buy a random product from own shop
            return Move(from: -1, to: -1)
        }
        
        // If product could not be bought - make the best move
        return getBestMove(board: game.board)
    }
    
    
    func buyRandomProduct(game: Game) -> Bool {
        
        // Get list of products that bot could buy
        var avaialbelProducts = [Int]()
        
        for i in shop.cart.indices {
            if shop.canBuy(product: i, with: game.accounts[Game.PlayerState.ENEMY]!.amount) {
                avaialbelProducts.append(i)
            }
        }
        
        if avaialbelProducts.count == 0 { return false }
        
        guard let randomPosition = game.bases[Game.PlayerState.ENEMY]?.getRandomFreeCell(board: game.board) else {
            return false
        }
        
        let id = avaialbelProducts.first!
        if shop.cart[id].isFigure {
            let figure = shop.buy(product: id) as! Figure
            game.accounts[Game.PlayerState.ENEMY]!.amount -= figure.cost
            game.board[randomPosition].set(figure: figure, owner: Game.PlayerState.ENEMY)
        } else {
            let card = shop.buy(product: id) as! Card
            game.accounts[Game.PlayerState.ENEMY]!.amount -= card.cost
            return card.use(user: Game.PlayerState.ENEMY, game: game)
        }
        
        return true
    }
    
    func getRandomMove(board: [Cell]) -> Move {
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
    
    func getBestMove(board: [Cell]) -> Move {
        
        let cellsToMove = getMapOfAvailabelMoves(board)
        
        if cellsToMove.count == 0 { return Move(from: -1, to: -1) }
        
        let maxPriority = Array(cellsToMove.keys).max()
        
        return cellsToMove[maxPriority!]!
    }
    
    func getMapOfAvailabelMoves(_ board: [Cell]) -> [Int : Move] {
        
        var vault = [Int : Move]()
        
        for botCell in board.getFigures(of: Game.PlayerState.ENEMY) {
            for id in botCell.availabelCellsToMove {
                let cellToMove = board[id]
                
                if cellToMove.isEmpty ||
                    (cellToMove.owner == Game.PlayerState.ALLIANCE
                        && (botCell.occupation?.ableToFight)!) {
                    let priority = calculatePriority(board: board, cellFrom: botCell, cellTo: cellToMove)
                    vault[priority] = Move(from: botCell.id, to: cellToMove.id)
                }
            }
        }
        
        return vault
    }
    
    func calculatePriority(board: [Cell], cellFrom: Cell, cellTo: Cell) -> Int {
        
        var priority = 0
        
        if !cellTo.isEmpty {
            priority += cellTo.occupation!.priority
        }
        
        priority += cellFrom.occupation!.priority
        
        let length = getLengthToNearestFinalFigure(board: board, forCell: cellTo)
        
        if length > 9 {
            priority += 5
        } else {
            priority += 200 - length * 10
        }
        
        return priority
    }
    
    func getLengthToNearestFinalFigure(board: [Cell], forCell: Cell) -> Int {
        
        let finalFiguresOfPlayer = board.filter { $0.isEndingFigure && $0.owner == Game.PlayerState.ALLIANCE }
        
        var minLength = 0
        
        for finalFigure in finalFiguresOfPlayer {
            let length = getLength(from: forCell, to: finalFigure)
            
            if length < minLength || minLength == 0 {
                minLength = length
            }
        }
        return minLength
    }
    
    func getLength(from: Cell, to: Cell) -> Int {
        let (fromX, fromY) = Cell.getXY(from: from.id)
        let (toX, toY) = Cell.getXY(from: to.id)
        return abs(fromX - toX) + abs(fromY - toY)
    }
}
