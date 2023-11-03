//
//  Models.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 01/11/2023.
//

import Foundation

struct Category {
    let id: String
    let title: String
    let image: String
    let restaurantsId: [String]
}

struct Restaurant {
    let id: String
    let title: String
    let image: String
    let categoryId: String
    let menuItemsId: [String]
}

struct MenuItem {
    let id: String
    let title: String
    let image: String
    let description: String
    let price: String
}

// MARK: Getting data
extension Category {
    static func getData() -> [Category] {
        [
            Category(
                id: "BRG",
                title: "Burgers",
                image: "bk",
                restaurantsId: ["BK", "MD"]
            ),
            Category(
                id: "PZZ",
                title: "Pizza",
                image: "dominoes",
                restaurantsId: ["DMN", "PH"]
            ),
            Category(
                id: "SSH",
                title: "Sushi",
                image: "nobu",
                restaurantsId: ["NB"]
            ),
            Category(
                id: "MXN",
                title: "Mexican",
                image: "chipotle",
                restaurantsId: ["CHP"]
            )
        ]
    }
}

extension Restaurant {
    static func getData() -> [Restaurant] {
        [
            Restaurant(
                id: "BK",
                title: "Burger King",
                image: "bk",
                categoryId: "BRG",
                menuItemsId: ["BK-1", "BK-2", "BK-3"]
            ),
            Restaurant(
                id: "MD",
                title: "McDonald's",
                image: "md",
                categoryId: "BRG",
                menuItemsId: ["MD-1", "MD-2", "MD-3"]
            ),
            Restaurant(
                id: "DMN",
                title: "Domino's",
                image: "dominoes",
                categoryId: "PZZ",
                menuItemsId: ["DMN-1", "DMN-2", "DMN-3"]
            ),
            Restaurant(
                id: "PH",
                title: "Pizza Hut",
                image: "ph",
                categoryId: "PZZ",
                menuItemsId: ["PH-1", "PH-2", "PH-3"]
            ),
            Restaurant(
                id: "NB",
                title: "Nobu",
                image: "nobu",
                categoryId: "SSH",
                menuItemsId: ["NB-1", "NB-2", "NB-3"]
            ),
            Restaurant(
                id: "CHP",
                title: "Chipotle",
                image: "chipotle",
                categoryId: "MXN",
                menuItemsId: ["CHP-1", "CHP-2"]
            )
        ]
    }
}

extension MenuItem {
    static func getData() -> [MenuItem] {
        [
            MenuItem(id: "BK-1", title: "Classic Burger", image: "bk-1", description: "Delicious burger with fresh ingredients.", price: "$3.99"),
            MenuItem(id: "BK-2", title: "Cheeseburger Deluxe", image: "bk-2", description: "Served with a side of crispy fries.", price: "$4.49"),
            MenuItem(id: "BK-3", title: "BBQ Bacon Burger", image: "bk-3", description: "Topped with special BBQ sauce.", price: "$4.99"),
            MenuItem(id: "MD-1", title: "Spicy Chicken Sandwich", image: "md-1", description: "Made with spicy seasoning.", price: "$5.29"),
            MenuItem(id: "MD-2", title: "Vegetarian Burger", image: "md-2", description: "A perfect choice for vegetarians.", price: "$3.79"),
            MenuItem(id: "MD-3", title: "Burger Supreme", image: "md-3", description: "Loaded with gourmet toppings.", price: "$5.99"),
            MenuItem(id: "DMN-1", title: "Margherita Pizza", image: "dominoes-1", description: "Classic pizza with tomato and cheese.", price: "$6.99"),
            MenuItem(id: "DMN-2", title: "Pepperoni Pizza", image: "dominoes-2", description: "Topped with savory pepperoni slices.", price: "$7.49"),
            MenuItem(id: "DMN-3", title: "Vegetarian Pizza", image: "dominoes-3", description: "Abundance of fresh vegetables.", price: "$6.79"),
            MenuItem(id: "PH-1", title: "Hawaiian Pizza", image: "ph-1", description: "Sweet and savory combination.", price: "$8.99"),
            MenuItem(id: "PH-2", title: "Meat Lover's Pizza", image: "ph-2", description: "Packed with various meat toppings.", price: "$9.49"),
            MenuItem(id: "PH-3", title: "Supreme Pizza", image: "ph-3", description: "Loaded with diverse gourmet ingredients.", price: "$8.79"),
            MenuItem(id: "NB-1", title: "Sushi Combo A", image: "nobu-1", description: "Assortment of fresh sushi pieces.", price: "$12.99"),
            MenuItem(id: "NB-2", title: "Sashimi Platter", image: "nobu-2", description: "Thinly sliced raw fish.", price: "$14.99"),
            MenuItem(id: "NB-3", title: "Dragon Roll", image: "nobu-3", description: "Sushi roll with eel and avocado.", price: "$10.99"),
            MenuItem(id: "CHP-1", title: "Burrito Bowl", image: "chipotle-1", description: "Rice, beans, meat, and fresh toppings.", price: "$7.99"),
            MenuItem(id: "CHP-2", title: "Tacos Al Pastor", image: "chipotle-2", description: "Tacos with marinated pork and pineapple.", price: "$8.49")
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
