//
//  CustomTabBarViewController.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Create view controllers for each tab with navigation controllers
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "1"), tag: 0)
        
        let wishlistVC = UINavigationController(rootViewController: WishlistViewController())
        wishlistVC.tabBarItem = UITabBarItem(title: "찜", image: UIImage(named: "2"), tag: 1)
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "3"), tag: 2)
        
        let ordersVC = UINavigationController(rootViewController: OrdersViewController())
        ordersVC.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(named: "4"), tag: 3)
        
        let myBaeminVC = UINavigationController(rootViewController: MyBaeminViewController())
        myBaeminVC.tabBarItem = UITabBarItem(title: "my배민", image: UIImage(named: "5"), tag: 4)

        self.viewControllers = [searchVC, wishlistVC, homeVC, ordersVC, myBaeminVC]
    }
    
}


class SearchViewController: UIViewController {
}

class WishlistViewController: UIViewController {
}

class HomeViewController: UIViewController {
}

class OrdersViewController: UIViewController {
}

class MyBaeminViewController: UIViewController {
}
