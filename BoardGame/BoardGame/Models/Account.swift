//
//  Account.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/14/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Account {
    
    private var _amount: Int
    private var _income: Int
    
    var amount: Int {
        set {
            if newValue >= 0 {
                _amount = newValue
            }
        }
        get { return _amount }
    }
    
    var income: Int {
        set {
            if newValue >= 0 {
                _income = newValue
            }
        }
        get { return _income }
    }
    
    init(amount: Int, income: Int) {
        _amount = amount
        _income = income
    }
    
    func round() {
        _amount += _income
    }
}
