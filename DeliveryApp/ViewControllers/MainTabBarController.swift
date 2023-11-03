//
//  MainTabBarController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 01/11/2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    let dataService = DataService.shared
    let cart = CartManager.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
