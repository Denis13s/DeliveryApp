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
}

struct MenuItem {
    let title: String
    let image: String
    let description: String
    let price: String
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
    static func getData() -> [Restaurant] {
        [
            Restaurant(
                title: "Burger King",
                image: "bk",
                categoryTitle: "Burgers",
                menuItems: [
                    MenuItem(title: "Classic Burger", image: "bk-1", description: "Delicious burger with fresh ingredients.", price: "$3.99"),
                    MenuItem(title: "Cheeseburger Deluxe", image: "bk-2", description: "Served with a side of crispy fries.", price: "$4.49"),
                    MenuItem(title: "BBQ Bacon Burger", image: "bk-3", description: "Topped with special BBQ sauce.", price: "$4.99")
                ]
            ),
            Restaurant(
                title: "McDonald's",
                image: "md",
                categoryTitle: "Burgers",
                menuItems: [
                    MenuItem(title: "Spicy Chicken Sandwich", image: "md-1", description: "Made with spicy seasoning.", price: "$5.29"),
                    MenuItem(title: "Vegetarian Burger", image: "md-2", description: "A perfect choice for vegetarians.", price: "$3.79"),
                    MenuItem(title: "Burger Supreme", image: "md-3", description: "Loaded with gourmet toppings.", price: "$5.99")
                ]
            ),
            Restaurant(
                title: "Domino's",
                image: "dominoes",
                categoryTitle: "Pizza",
                menuItems: [
                    MenuItem(title: "Margherita Pizza", image: "dominoes-1", description: "Classic pizza with tomato and cheese.", price: "$6.99"),
                    MenuItem(title: "Pepperoni Pizza", image: "dominoes-2", description: "Topped with savory pepperoni slices.", price: "$7.49"),
                    MenuItem(title: "Vegetarian Pizza", image: "dominoes-3", description: "Abundance of fresh vegetables.", price: "$6.79")
                ]
            ),
            Restaurant(
                title: "Pizza Hut",
                image: "ph",
                categoryTitle: "Pizza",
                menuItems: [
                    MenuItem(title: "Hawaiian Pizza", image: "ph-1", description: "Sweet and savory combination.", price: "$8.99"),
                    MenuItem(title: "Meat Lover's Pizza", image: "ph-2", description: "Packed with various meat toppings.", price: "$9.49"),
                    MenuItem(title: "Supreme Pizza", image: "ph-3", description: "Loaded with diverse gourmet ingredients.", price: "$8.79")
                ]
            ),
            Restaurant(
                title: "Nobu",
                image: "nobu",
                categoryTitle: "Sushi",
                menuItems: [
                    MenuItem(title: "Sushi Combo A", image: "nobu-1", description: "Assortment of fresh sushi pieces.", price: "$12.99"),
                    MenuItem(title: "Sashimi Platter", image: "nobu-2", description: "Thinly sliced raw fish.", price: "$14.99"),
                    MenuItem(title: "Dragon Roll", image: "nobu-3", description: "Sushi roll with eel and avocado.", price: "$10.99")
                ]
            ),
            Restaurant(
                title: "Chipotle",
                image: "chipotle",
                categoryTitle: "Mexican",
                menuItems: [
                    MenuItem(title: "Burrito Bowl", image: "chipotle-1", description: "Rice, beans, meat, and fresh toppings.", price: "$7.99"),
                    MenuItem(title: "Tacos Al Pastor", image: "chipotle-2", description: "Tacos with marinated pork and pineapple.", price: "$8.49")
                ]
            )
        ]
    }
}


/*
 MARK: - Hints, how to access values

var macDonaldsMenu = [MenuItem]()

let macDonaldsItemsIds = restaurants.first(where: { $0.id == "MD" })?.menuItemsId
if let ids = macDonaldsItemsIds {
    for id in ids {
        if let menuItem = menuItems.first(where: { $0.id == id } ) {
            macDonaldsMenu.append(menuItem)
        }
    }
}

print(macDonaldsMenu)
for macDonaldsItem in macDonaldsMenu {
    print(macDonaldsItem.title)
}
 */
