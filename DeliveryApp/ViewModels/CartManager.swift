//
//  CartManager.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import Foundation

final class CartItem {
    let item: MenuItem
    var amount: Int
    
    init(item: MenuItem, amount: Int) {
        self.item = item
        self.amount = amount
    }
}

final class CartManager {
    
    static let shared = CartManager()
    
    private(set) var cart = [CartItem]()
    
    private init() {}
    
    func addItem(_ item: MenuItem) {
        let cartItem = cart.first(where: { $0.item.title == item.title } )
        if let cartItem {
            cartItem.amount += 1
        } else {
            cart.append(
                CartItem(
                    item: item,
                    amount: 1
                )
            )
        }
    }
    
    func removeItem(_ item: MenuItem) {
        let cartItem = cart.first(where: { $0.item.title == item.title } )
        if let cartItem {
            cartItem.amount -= 1
            if cartItem.amount == 0 {
                cart.removeAll(where: { $0.item.title == item.title })
            }
        }
    }
    
}



