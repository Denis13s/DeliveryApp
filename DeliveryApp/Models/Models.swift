//
//  Models.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 01/11/2023.
//

import Foundation

struct Category {
    let title: String
    let image: String
    let restaurants: [Restaurant]
}

struct Restaurant {
    let title: String
    let image: String
    let categoryTitle: String
    let menuItems: [MenuItem]
    
    let deliveryTime: String
    let deliveryFee: Double
}

struct MenuItem {
    let title: String
    let image: String
    let description: String
    let price: Double
    let restaurantTitle: String
}

struct Developer {
    let fullName: String
    let image: String
}

// MARK: Getting data
extension Category {
    static func getData() -> [Category] {
        
        let restaurants = Restaurant.getData()
        
        var burgersRestaurants = [Restaurant]()
        var pizzaRestaurants = [Restaurant]()
        var sushiRestaurants = [Restaurant]()
        var mexicanRestaurants = [Restaurant]()
        
        restaurants.forEach { restaurant in
            if restaurant.categoryTitle == "Burgers" {
                burgersRestaurants.append(restaurant)
            } else if restaurant.categoryTitle == "Pizza" {
                pizzaRestaurants.append(restaurant)
            } else if restaurant.categoryTitle == "Sushi" {
                sushiRestaurants.append(restaurant)
            } else if restaurant.categoryTitle == "Mexican" {
                mexicanRestaurants.append(restaurant)
            }
        }
        
        return [
            Category(
                title: "Burgers",
                image: "bk",
                restaurants: burgersRestaurants
            ),
            Category(
                title: "Pizza",
                image: "dominoes",
                restaurants: pizzaRestaurants
            ),
            Category(
                title: "Sushi",
                image: "nobu",
                restaurants: sushiRestaurants
            ),
            Category(
                title: "Mexican",
                image: "chipotle",
                restaurants: mexicanRestaurants
            )
        ]
    }
}

extension Restaurant {
    static func getDeliveryTime() -> String {
        switch Int.random(in: 0...2) {
        case 0: return "30-45 min"
        case 1: return "45-60 min"
        default: return "60-90 min"
        }
    }
    
    static func getDeliveryFee() -> Double {
        switch Int.random(in: 0...2) {
        case 0: return 0.99
        case 1: return 1.99
        default: return 2.99
        }
    }
    
    static func getData() -> [Restaurant] {
        [
            Restaurant(
                title: "Burger King",
                image: "bk",
                categoryTitle: "Burgers",
                menuItems: [
                    MenuItem(title: "Classic Burger", image: "bk-1", description: "Delicious burger with fresh ingredients.", price: 3.99, restaurantTitle: "Burger King"),
                    MenuItem(title: "Cheeseburger Deluxe", image: "bk-2", description: "Served with a side of crispy fries.", price: 4.49, restaurantTitle: "Burger King"),
                    MenuItem(title: "BBQ Bacon Burger", image: "bk-3", description: "Topped with special BBQ sauce.", price: 4.99, restaurantTitle: "Burger King")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            ),
            Restaurant(
                title: "McDonald's",
                image: "md",
                categoryTitle: "Burgers",
                menuItems: [
                    MenuItem(title: "Spicy Chicken Sandwich", image: "md-1", description: "Made with spicy seasoning.", price: 5.29, restaurantTitle: "McDonald's"),
                    MenuItem(title: "Vegetarian Burger", image: "md-2", description: "A perfect choice for vegetarians.", price: 3.79, restaurantTitle: "McDonald's"),
                    MenuItem(title: "Burger Supreme", image: "md-3", description: "Loaded with gourmet toppings.", price: 5.99, restaurantTitle: "McDonald's")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            ),
            Restaurant(
                title: "Dominoe's",
                image: "dominoes",
                categoryTitle: "Pizza",
                menuItems: [
                    MenuItem(title: "Margherita Pizza", image: "dominoes-1", description: "Classic pizza with tomato and cheese.", price: 6.99, restaurantTitle: "Dominoe's"),
                    MenuItem(title: "Pepperoni Pizza", image: "dominoes-2", description: "Topped with savory pepperoni slices.", price: 7.49, restaurantTitle: "Dominoe's"),
                    MenuItem(title: "Vegetarian Pizza", image: "dominoes-3", description: "Abundance of fresh vegetables.", price: 6.79, restaurantTitle: "Dominoe's")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            ),
            Restaurant(
                title: "Pizza Hut",
                image: "ph",
                categoryTitle: "Pizza",
                menuItems: [
                    MenuItem(title: "Hawaiian Pizza", image: "ph-1", description: "Sweet and savory combination.", price: 8.99, restaurantTitle: "Pizza Hut"),
                    MenuItem(title: "Meat Lover's Pizza", image: "ph-2", description: "Packed with various meat toppings.", price: 9.49, restaurantTitle: "Pizza Hut"),
                    MenuItem(title: "Supreme Pizza", image: "ph-3", description: "Loaded with diverse gourmet ingredients.", price: 8.79, restaurantTitle: "Pizza Hut")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            ),
            Restaurant(
                title: "Nobu",
                image: "nobu",
                categoryTitle: "Sushi",
                menuItems: [
                    MenuItem(title: "Sushi Combo A", image: "nobu-1", description: "Assortment of fresh sushi pieces.", price: 12.99, restaurantTitle: "Nobu"),
                    MenuItem(title: "Sashimi Platter", image: "nobu-2", description: "Thinly sliced raw fish.", price: 14.99, restaurantTitle: "Nobu"),
                    MenuItem(title: "Dragon Roll", image: "nobu-3", description: "Sushi roll with eel and avocado.", price: 10.99, restaurantTitle: "Nobu")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            ),
            Restaurant(
                title: "Chipotle",
                image: "chipotle",
                categoryTitle: "Mexican",
                menuItems: [
                    MenuItem(title: "Burrito Bowl", image: "chipotle-1", description: "Rice, beans, meat, and fresh toppings.", price: 7.99, restaurantTitle: "Chipotle"),
                    MenuItem(title: "Tacos Al Pastor", image: "chipotle-2", description: "Tacos with marinated pork and pineapple.", price: 8.49, restaurantTitle: "Chipotle")
                ],
                deliveryTime: Restaurant.getDeliveryTime(),
                deliveryFee: Restaurant.getDeliveryFee()
            )
        ]
    }
}

extension Developer {
    static func getData() -> [Developer] {
        [
            Developer(fullName: "Denis", image: "denis"),
            Developer(fullName: "Kirill", image: "kirill"),
            Developer(fullName: "Nikita", image: "nikita"),
            Developer(fullName: "Daniil", image: "daniil")
        ]
    }
}
