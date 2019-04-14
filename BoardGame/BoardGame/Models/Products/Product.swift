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
        case SOURCE, SOLDIER, MASTER, STONE, PREDATOR
        case ADVERTISEMENT, BUSINESSMAN, CONTROLL_RANDOM_ENEMY, CREATE_RANDOM_FIGURE, KILL_RANDOM_ENEMY, NEW_SHOP
        
        var product: Product {
            switch self {
            case Kind.MASTER:                   return Master()
            case Kind.SOURCE:                   return Source()
            case Kind.SOLDIER:                  return Soldier()
            case Kind.STONE:                    return Stone()
            case Kind.PREDATOR:                 return Predator()
            case Kind.ADVERTISEMENT:            return Advertisement()
            case Kind.BUSINESSMAN:              return Businessman()
            case Kind.CONTROLL_RANDOM_ENEMY:    return ControlRandomEnemy()
            case Kind.CREATE_RANDOM_FIGURE:     return CreateRandomFigure()
            case Kind.KILL_RANDOM_ENEMY:        return KillRandomEnemy()
            case Kind.NEW_SHOP:                 return NewShop()
            }
        }
    }
    
    var cost: Int! = nil
    
    var shopView: String! = nil
    
    var isFigure: Bool {
        return self is Figure
    }
}
