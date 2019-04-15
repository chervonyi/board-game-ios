//
//  Figure.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/12/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class  Figure : Product {
    
    enum Figures {
        case Source, Soldier, Master, Stone, Predator
    }
    
    var ableToMove: Bool! = nil
    
    var ableToFight: Bool! = nil
    
    var blackFigureIcon: String! = nil
    
    var redFigureIcon: String! = nil
    
    var priority: Int! = nil
    
    func getAvailableCellsToMove(from position: Int) -> [Int] {
        return [Int]()
    }
}
