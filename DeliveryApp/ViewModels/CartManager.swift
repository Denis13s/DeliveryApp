//
//  CartManager.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 03/11/2023.
//

import Foundation

final class CartManager {
    
    static let shared = CartManager()
    
    private(set) var cart: [String: Int] = [:]
    
    private init() {}
    
    func addItem(withID id: String) {
        
        NotificationCenter.default.post(name: Notification.Name("CartUpdated"), object: nil)
    }
    
    func removeItem(withID id: String) {
        
        NotificationCenter.default.post(name: Notification.Name("CartUpdated"), object: nil)
    }
    
}
