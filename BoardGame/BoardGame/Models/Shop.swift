//
//  Shop.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Shop {
    
    var cart = [Product]()
    
    private var availabelProducts: [Product.Kind] = [
        .Master,
        .Source,
        .Stone,
        .Soldier,
        .Predator
        // + Cards
    ]
    
    let PRODUCT_COUNT = 3
    
    init() {
        
        // Fill up cart with products
        for _ in 0..<PRODUCT_COUNT {
            cart.append(nextProduct())
        }
    }
    
    func canBuy(product position: Int, with amount: Int) -> Bool {
        return cart[position].cost <= amount
    }
    
    func buy(product position: Int) -> Product {
        let boughtProduct = cart[position]
        cart[position] = nextProduct()
        return boughtProduct
    }
    
    private func nextProduct() -> Product {
        switch availabelProducts[availabelProducts.count.random] {
        case Product.Kind.Master:
            return Master()
        case .Source:
            return Source()
        case .Soldier:
            return Soldier()
        case .Stone:
            return Stone()
        case .Predator:
            return Predator()
        }
    }
    
}
