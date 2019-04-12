//
//  Cell.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Cell {
    
    private var id: Int
    
    var isHighlighted: Bool
    
    var owner: Game.PlayerState?
    
    var occupation: Figure?
    
    var isFree: Bool {
        return owner == nil
    }
    
    init(id : Int) {
        self.id = id
        isHighlighted = false
    }
    
    func set(figure: Figure, owner: Game.PlayerState) {
        self.occupation = figure
        self.owner = owner
    }
    
    func reset() {
        self.occupation = nil
        self.owner = nil
    }
}
