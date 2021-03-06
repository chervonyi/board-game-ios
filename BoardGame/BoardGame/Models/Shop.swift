//
//  Shop.swift
//  BoardGame
//
//  Created by Yuri Chervonyi on 4/13/19.
//  Copyright © 2019 CHRGames. All rights reserved.
//

import Foundation

class Shop {
    
    private(set) var cart = [Product]()
    
    private var availabelProducts: [Product.Kind] = [
        // Figures:
        .SOURCE,
        .SOLDIER,
        .MASTER,
        .STONE,
        .PREDATOR,
    
        // Cards:
        .ADVERTISEMENT,
        .BUSINESSMAN,
        .CONTROLL_RANDOM_ENEMY,
        .CREATE_RANDOM_FIGURE,
        .KILL_RANDOM_ENEMY,
        .NEW_SHOP
    ]
    
    private var availabelProductsForBot: [Product.Kind] = [
        // Figures:
        .SOURCE,
        .SOLDIER,
        .MASTER,
        .STONE,
        .PREDATOR,
        
        // Cards:
        .CONTROLL_RANDOM_ENEMY,
        .CREATE_RANDOM_FIGURE,
        .KILL_RANDOM_ENEMY
    ]
    
    private let owner: Game.PlayerState
    
    let PRODUCT_COUNT = 3
    
    init(owner: Game.PlayerState) {
        self.owner = owner
        
        // Fill up cart with products
        for _ in 0..<PRODUCT_COUNT {
            cart.append(nextProduct())
        }
    }
    
    func canBuy(product position: Int, with amount: Int) -> Bool {
        return cart[position].cost <= amount
    }
    
    func canBuy(product: Product, with amount: Int) -> Bool {
        return product.cost <= amount
    }
    
    func buy(product position: Int) -> Product {
        let boughtProduct = cart[position]
        cart[position] = nextProduct()
        return boughtProduct
    }
    
    private func nextProduct() -> Product {
        return owner == Game.PlayerState.ALLIANCE
            ? availabelProducts[availabelProducts.count.random].product
            : availabelProductsForBot[availabelProductsForBot.count.random].product
    }
    
}
