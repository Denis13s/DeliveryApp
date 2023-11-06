//
//  CategoriesViewController.swift
//  DeliveryApp
//
//  Created by Denis Yarets on 04/11/2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableViewLeft: UITableView!
    @IBOutlet weak var tableViewRight: UITableView!

    var categories: [Category]!
    
    @objc func didEndScrollingLeft() {
        tableViewLeft.delegate = self
    }
    
    @objc func didEndScrollingRight() {
        tableViewRight.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableViewLeft.delegate = self
        self.tableViewRight.delegate = self
        self.tableViewLeft.reloadData()
        self.tableViewRight.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for tableView in [tableViewLeft, tableViewRight] {
            tableView?.separatorStyle = .none
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let restaurantsListVC = segue.destination as? RestaurantsListViewController {
            if let restaurants = sender as? [Restaurant] {
                restaurantsListVC.restaurants = restaurants
            }
        }
    }
}

// MARK: UITableViewDataSource
extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tableViewLeft: return Int((Double(categories.count) / 2.0).rounded())
        case tableViewRight: return Int(Double(categories.count) / 2.0)
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategory", for: indexPath) as! CategoryViewCell
        
        let index: Int
        
        switch tableView {
        case tableViewLeft: index = indexPath.row * 2
        case tableViewRight: index = indexPath.row * 2 + 1
        default: index = 0
        }
        
        let category = categories[index]
        
        cell.imageCategory.image = UIImage(named: category.image)
        cell.imageCategory.contentMode = .scaleAspectFill
        cell.imageCategory.layer.cornerRadius = 15
        cell.labelTitle.text = category.title
        
        cell.viewContainer.layer.cornerRadius = 15
        
        cell.viewContainer.layer.shadowColor = UIColor.black.cgColor
        cell.viewContainer.layer.shadowOpacity = 0.2
        cell.viewContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        cell.selectionStyle = .none
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableViewLeft {
            tableViewRight.delegate = nil
            tableViewRight.contentOffset = scrollView.contentOffset
            self.perform(#selector(self.didEndScrollingRight), with: nil, afterDelay: 0.3)
        }
        if scrollView == tableViewRight {
            tableViewLeft.delegate = nil
            tableViewLeft.contentOffset = scrollView.contentOffset
            self.perform(#selector(self.didEndScrollingLeft), with: nil, afterDelay: 0.3)
        }
    }
    
}

// MARK: UITableViewDelegate
extension CategoriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index: Int
        
        switch tableView {
        case tableViewLeft: index = indexPath.row * 2
        case tableViewRight: index = indexPath.row * 2 + 1
        default: index = 0
        }
        
        performSegue(withIdentifier: "showCategoryRestaurants", sender: categories[index].restaurants)
    }
    
}
