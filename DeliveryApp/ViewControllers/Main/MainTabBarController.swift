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
        shareData()
    }
    
    private func shareData() {
        viewControllers?.forEach{ vc in
            if let navigationVC = vc as? UINavigationController {
                if let categoriesVC = navigationVC.viewControllers.first as? CategoriesListViewController {
                    categoriesVC.categories = dataService.categories
                } else if let restaurantsVC = navigationVC.viewControllers.first as? RestaurantsListViewController {
                    restaurantsVC.restaurants = dataService.restaurants
                } 
                else if let cartVC = navigationVC.viewControllers.first as? CartViewController {
                    cartVC.cartManager = cartManager
                }
            }
        }
        
    }
    

}
