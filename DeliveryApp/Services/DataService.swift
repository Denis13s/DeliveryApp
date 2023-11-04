//
//  DataService.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 01/11/2023.
//

import Foundation

final class DataService {
    
    static let shared = DataService()
    
    let categories: [Category]
    let restaurants: [Restaurant]
    
    private init() {
        categories = Category.getData()
        restaurants = Restaurant.getData()
    }
    
}
