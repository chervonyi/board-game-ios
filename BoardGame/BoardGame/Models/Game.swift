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
    }
    
    
    // CONSTANTS
    static let COLUMNS = 5
    static let ROWS = 10
    static let CELLS = Game.COLUMNS * Game.ROWS
    static let BASE_SIZE = 3
    
    // VARS
    private(set) var board = [Cell]()
    
    var bases = [PlayerState.ALLIANCE : Base(owner: PlayerState.ALLIANCE, sizeOfBase: Game.BASE_SIZE),
                 PlayerState.ENEMY : Base(owner: PlayerState.ENEMY, sizeOfBase: Game.BASE_SIZE)]
    
    private var _selectedCell = -1
    
    var selectedCell: Int {
        set {
            // Check if newValue is in 0..49 range
            guard Cell.isExist(newValue) else { return }
            
            let cell = board[newValue]
            
            if _selectedCell != -1 && cell.isHighlighted {
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
        
        get {
            return _selectedCell
        }
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
    }
    
    private func removeAnySelection() {
        for cell in board {
            cell.isHighlighted = false
        }
        
        _selectedCell = -1
    }
    
    // CONSTRUCTOR
    init() {
    
        // Fill up board with instances of Cell
        for i in 0..<Game.CELLS {
            board.append(Cell(id: i))
        }
        
        locateStartPieces()
    }
    
    private func locateStartPieces() {
        let set: [Figure.Kind] = [Figure.Kind.Source, .Stone, .Stone, .Soldier]
        
        locate(set: set, owner: PlayerState.ALLIANCE)
        locate(set: set, owner: PlayerState.ENEMY)
    }
    
    // Locate given list of figures at random cells on appropriate base
    private func locate(set: [Figure.Kind], owner: PlayerState) {
        
        for kind in set {
            guard let freePosition = bases[owner]?.getRandomFreeCell(board: board) else {
                return
            }
            
            var figure: Figure
            
            switch kind {
            case Figure.Kind.Source:
                figure = Source()
                
            case .Soldier:
                figure = Soldier()
                
            case .Master:
                figure = Master()
                
            case .Stone:
                figure = Stone()
                
            case .Predator:
                figure = Predator()
            }
            
            board[freePosition].set(figure: figure, owner: owner)
        }
    }
}
