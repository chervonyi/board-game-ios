//
//  Product.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Product {
    
    enum Kind {
        case Source, Soldier, Master, Stone, Predator
        //case Adverisement, KillRandomFigure, CreateRandomFigure // TODO - finish this list
    }
    
    var cost: Int! = nil
    
    var shopView: String! = nil
    
}
