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
    var board = [Cell]()
    
    var bases = [PlayerState.ALLIANCE : Base(owner: PlayerState.ALLIANCE, sizeOfBase: Game.BASE_SIZE),
                 PlayerState.ENEMY : Base(owner: PlayerState.ENEMY, sizeOfBase: Game.BASE_SIZE)]
    
    private var _selectedCell = -1
    
    var selectedCell: Int {
        set {
            
        }
        
        get {
            return _selectedCell
        }
    }
    
    init() {
        
        for i in 0..<Game.CELLS {
            board.append(Cell(id: i))
        }
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
