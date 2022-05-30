//
//  TabBarViewController.swift
//  Desafio_Popcode
//
//  Created by Rita Lisboa on 02/05/22.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let homeViewController = HomeViewController(collectionViewLayout: layout)
        let homeVC = UINavigationController(rootViewController: homeViewController)
        homeVC.tabBarItem.title = "Home"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let viewController = FavoriteTableViewController()
        let favController = UINavigationController(rootViewController: viewController)
        favController.tabBarItem.title = "Favoritos"
        favController.tabBarItem.image = UIImage(systemName: "heart.fill")
        
        viewControllers = [homeVC, favController]
        
        
        self.modalPresentationStyle = .fullScreen
        self.tabBar.tintColor = UIColor(named: "backgroundColor")
        self.tabBar.backgroundColor = .systemGray5
    }

}
