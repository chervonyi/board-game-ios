//
//  Game.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Game {
    
    enum PlayerState {
        case ENEMY, ALLIANCE
        
        var reverse: PlayerState {
            return self == .ALLIANCE ? .ENEMY : .ALLIANCE
        }
    }
    
    // CONSTANTS:
    static let COLUMNS = 5
    static let ROWS = 10
    static let CELLS = Game.COLUMNS * Game.ROWS
    static let BASE_SIZE = 3
    
    // VARS:
    private(set) var board = [Cell]()
    private var _selectedCell = -1
    private var _selectedProduct = -1
    private var turn = PlayerState.ALLIANCE
    private var bot = Bot()
    var shop = Shop()
    
    weak var delegate: GameDelegate?
    
    var accounts = [PlayerState.ALLIANCE : Account(amount: 100, income: 10),
                    PlayerState.ENEMY : Account(amount: 100, income: 10)]
    
    var bases = [PlayerState.ALLIANCE : Base(owner: PlayerState.ALLIANCE, sizeOfBase: Game.BASE_SIZE),
                 PlayerState.ENEMY : Base(owner: PlayerState.ENEMY, sizeOfBase: Game.BASE_SIZE)]
    
    // PROPERTIES:
    var selectedCell: Int {
        set {
            // Check if newValue is in 0..49 range and it's player's turn
            guard Cell.isExist(newValue) && turn == PlayerState.ALLIANCE else { return }
            
            let cell = board[newValue]
            
            if _selectedCell == -1 && _selectedProduct != -1 && cell.isHighlighted {
                // Buy figure and replace it on the board
                
                let piece = shop.buy(product: _selectedProduct) as! Figure
                accounts[.ALLIANCE]!.amount -= piece.cost
                cell.set(figure: piece, owner: PlayerState.ALLIANCE)
                
                endTurn()
                
                removeAnySelection()
                return
                
            } else if _selectedCell != -1 && cell.isHighlighted {
                // Move figure
                if cell.isEmpty || (cell.owner == PlayerState.ENEMY && cell.occupation!.ableToFight) {
                    move(from: _selectedCell, to: newValue)
                    removeAnySelection()
                    return
                }
            }
            
            removeAnySelection()
            
            if !cell.isEmpty && cell.occupation!.ableToMove && cell.owner == PlayerState.ALLIANCE {
                
                _selectedCell = newValue
                
                for cellId in cell.availabelCellsToMove {
                    board[cellId].isHighlighted = true
                }
            }
        }
        
        get { return _selectedCell }
    }
    
    var selectedProduct: Int {
        set {
            guard 0...shop.PRODUCT_COUNT ~= newValue && turn == PlayerState.ALLIANCE else { return }
            
            removeAnySelection()
            
            // Check if user has enough money to buy selected product
            if shop.canBuy(product: newValue, with: accounts[PlayerState.ALLIANCE]!.amount) {
                
                // Find out if selected product is a piece or a card
                if shop.cart[newValue].isFigure {
                    _selectedProduct = newValue
                    
                    for cellId in (bases[PlayerState.ALLIANCE]?.getFreeCells(board: board))! {
                        board[cellId].isHighlighted = true
                    }
                } else {
                    
                    let card = shop.buy(product: newValue) as! Card
                    accounts[.ALLIANCE]!.amount -= card.cost
                    if card.use(user: Game.PlayerState.ALLIANCE, game: self) {
                        endTurn()
                    }
                }
            }
        }
        get { return _selectedProduct }
    }
    
    // CONSTRUCTOR
    init() {
        // Fill up board with instances of Cell
        for i in 0..<Game.CELLS {
            board.append(Cell(id: i))
        }
        
        locateStartPieces()
    }
    
    private func move(from: Int, to: Int) {
        guard Cell.isExist(from) && Cell.isExist(to) else { return }
        
        let cellFrom = board[from]
        let cellTo = board[to]
        
        if !cellTo.isEmpty || cellFrom.owner != cellTo.owner {
            if cellTo.isEndingFigure {
                // TODO - end of game
            } else {
                // TODO - get reward for a destroy
            }
        }
        
        cellTo.set(cellFrom)
        cellFrom.reset()
        endTurn()
    }
    
    private func makeBotMove() {
        let botMove = bot.getMove(board: board)
        
        if botMove.from == -1 {
            endTurn()
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.move(from: botMove.from, to: botMove.to)
        })
    }
    
    private func endTurn() {
        accounts[turn]?.round()
        
        if turn == PlayerState.ALLIANCE {
            turn = .ENEMY
            makeBotMove()
        } else {
            delegate?.updateBoard()
            turn = .ALLIANCE
        }
    }
    
    private func removeAnySelection() {
        for cell in board {
            cell.isHighlighted = false
        }
        
        _selectedProduct = -1
        _selectedCell = -1
    }
    
    private func locateStartPieces() {
        let set: [Figure.Figures] = [Figure.Figures.Source, .Stone, .Stone, .Soldier]
        
        locate(set: set, owner: PlayerState.ALLIANCE)
        locate(set: set, owner: PlayerState.ENEMY)
    }
    
    // Locate given list of figures at random cells on appropriate base
    private func locate(set: [Figure.Figures], owner: PlayerState) {
        
        for kind in set {
            guard let freePosition = bases[owner]?.getRandomFreeCell(board: board) else {
                return
            }
            
            var figure: Figure
            
            switch kind {
            case Figure.Figures.Source: figure = Source()
            case .Soldier:              figure = Soldier()
            case .Master:               figure = Master()
            case .Stone:                figure = Stone()
            case .Predator:             figure = Predator()
            }
            
            board[freePosition].set(figure: figure, owner: owner)
        }
    }
}

extension Array where Element == Cell {
    
    func getFigures(of owner: Game.PlayerState) -> [Cell] {
        return self.filter {$0.owner == owner && !$0.isEndingFigure }
    }
    
    var random: Cell {
        return self[self.count.random]
    }
}

extension Array where Element == Int {
    var random: Int {
        return self[self.count.random]
    }
}



