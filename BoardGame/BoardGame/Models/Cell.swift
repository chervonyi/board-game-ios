//
//  Cell.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Cell {
    
    let id: Int
    
    var isHighlighted: Bool
    
    var owner: Game.PlayerState?
    
    var occupation: Figure?
    
    var isEmpty: Bool {
        return owner == nil
    }
    
    var availabelCellsToMove: [Int] {
        return occupation!.getAvailableCellsToMove(from: id)
    }
    
    var isEndingFigure: Bool {
        return occupation is Source
    }
    
    // CONSTRUCTOR
    init(id : Int) {
        self.id = id
        isHighlighted = false
    }
    
    func set(figure: Figure, owner: Game.PlayerState) {
        self.occupation = figure
        self.owner = owner
    }
    
    func set(_ cell: Cell) {
        self.occupation = cell.occupation
        self.owner = cell.owner
    }
    
    func reset() {
        self.occupation = nil
        self.owner = nil
    }
    
    static func isExist(_ position: Int) -> Bool {
        return !(position < 0 || position >= Game.CELLS)
    }
    
    static func isExist(_ x: Int, _ y: Int) -> Bool {
        return !(x < 0 || y < 0 || x >= Game.COLUMNS || y >= Game.ROWS)
    }
    
    static func getXY(from position: Int) -> (Int, Int) {
    
        let y = position / Game.COLUMNS
        let x = position - Game.COLUMNS * y
    
        return (x, y)
    }
    
    static func getPosition(_ x: Int, _ y: Int) -> Int {
        
        var position = Game.COLUMNS * y
        position += x
        
        return position
    }
    
    
    
    
}
