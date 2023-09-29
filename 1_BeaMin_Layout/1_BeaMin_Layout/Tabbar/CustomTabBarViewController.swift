//
//  CustomTabBarViewController.swift
//  1_BeaMin_Layout
//
//  Created by 박다미 on 2023/09/19.
//

import Foundation
import UIKit

///MARK: - CustomTabBarController
final class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView()
        settingTabbar()
       

        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(named: "1"), selectedImage: nil)
        
        let wishlistVC = UINavigationController(rootViewController: WishlistViewController())
        wishlistVC.tabBarItem = UITabBarItem(title: "찜", image: UIImage(named: "2"), selectedImage: nil)
        
        let homeVC = UINavigationController(rootViewController: ViewController())
        homeVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "3"), selectedImage: nil)
        
        let ordersVC = UINavigationController(rootViewController: OrdersViewController())
        ordersVC.tabBarItem = UITabBarItem(title: "주문내역", image: UIImage(named: "4"), selectedImage: nil)
        
        let myBaeminVC = UINavigationController(rootViewController: MyBaeminViewController())
        myBaeminVC.tabBarItem = UITabBarItem(title: "My배민", image: UIImage(named: "5"), selectedImage: nil)
        
        // 아이콘 크기 조절
        searchVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        wishlistVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 8, right: -10) //이미지파일 자체를 크게넣어서 크기를 좀더 줄였음
        ordersVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        myBaeminVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        
        self.viewControllers = [searchVC, wishlistVC, homeVC, ordersVC, myBaeminVC]
    }
    
    //homeVC 처음 로딩
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            self.selectedIndex = 2
        }
    private func settingView(){
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 1.5
        view.layer.masksToBounds = false
        
    }
    private func settingTabbar(){
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .selected)
        
    }
    
}



class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

class WishlistViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

class OrdersViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

class MyBaeminViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}
