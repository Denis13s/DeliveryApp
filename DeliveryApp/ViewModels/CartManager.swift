//
//  CartManager.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import Foundation

protocol CartManagerDelegate {
    func updatedCart(with cart: [CartItem])
}

final class CartManager {
    
    static let shared = CartManager()
    
    private(set) var cart = [CartItem]()
    
    var tabBarDelegate: CartManagerDelegate?
    
    private init() {}
}

extension CartManager {
    
    func addItem(_ item: MenuItem) {
        let cartItem = cart.first(where: { $0.item.title == item.title } )
        if let cartItem {
            cartItem.amount += 1
            cartItem.cost = ((item.price * Double(cartItem.amount)) * 100).rounded() / 100
        } else {
            cart.append(
                CartItem(
                    item: item,
                    amount: 1
                )
            )
        }
        
        tabBarDelegate?.updatedCart(with: cart)
    }
    
    func removeItem(_ item: MenuItem) {
        let cartItem = cart.first(where: { $0.item.title == item.title } )
        if let cartItem {
            cartItem.amount -= 1
            if cartItem.amount == 0 {
                cart.removeAll(where: { $0.item.title == item.title })
            } else {
                cartItem.cost = ((item.price * Double(cartItem.amount)) * 100).rounded() / 100
            }
            tabBarDelegate?.updatedCart(with: cart)
        }
    }
    
}

final class CartItem {
    let item: MenuItem
    var amount: Int
    var cost: Double
    
    init(item: MenuItem, amount: Int) {
        self.item = item
        self.amount = amount
        let cost = ((item.price * Double(amount)) * 100).rounded() / 100
        self.cost = cost
    }
}


