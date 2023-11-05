//
//  MainTabBarController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 01/11/2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    let dataService = DataService.shared
    let cartManager = CartManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        cartManager.tabBarDelegate = self
        shareData()
    }
    
    private func shareData() {
        viewControllers?.forEach{ vc in
            if let navigationVC = vc as? UINavigationController {
                if let categoriesVC = navigationVC.viewControllers.first as? CategoriesViewController {
                    categoriesVC.categories = dataService.categories
                } else if let restaurantsVC = navigationVC.viewControllers.first as? RestaurantsListViewController {
                    restaurantsVC.restaurants = dataService.restaurants
                } 
                else if let cartVC = navigationVC.viewControllers.first as? CartViewController {
                    cartVC.cartManager = cartManager
                } else if let developersVS = navigationVC.viewControllers.first as? DevelopersListViewController {
                    developersVS.developers = dataService.developers
                }
            }
        }
        
    }
    
}

extension MainTabBarController: CartManagerDelegate {
    func updatedCart(with cart: [CartItem]) {
            var amount = 0
            cart.forEach { cartItem in
                amount += cartItem.amount
            }
                
        if let tabBarItems = tabBar.items, tabBarItems.indices.contains(2) {
            let tabBarItem = tabBarItems[2]
            if amount != 0 {
                tabBarItem.badgeValue = "\(amount)"
            } else {
                tabBarItem.badgeValue = nil
            }
        }
    }
}
