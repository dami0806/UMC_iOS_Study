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
        
        setupTabBarAppearance()
        setupViewControllers()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setSelectIndex()
       
    }
  
    private func setupTabBarAppearance(){
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = UIColor.gray.cgColor
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 1.5
        view.layer.masksToBounds = false
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .selected)
    }
    private func setupViewControllers(){
        let searchVC = createNavigationController(rootViewController: SearchViewController(), title: "검색", imageName: "1")
        let wishlistVC = createNavigationController(rootViewController: WishlistViewController(), title: "찜", imageName: "2")
        let homeVC = createNavigationController(rootViewController: ViewController(), title: "", imageName: "3")
        let ordersVC = createNavigationController(rootViewController: OrdersViewController(), title: "주문내역", imageName: "4")
        let myBaeminVC = createNavigationController(rootViewController: MyBaeminViewController(), title: "My배민", imageName: "5")
        // 아이콘 크기 조절
        searchVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        wishlistVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 8, right: -10) //이미지파일 자체를 크게넣어서 크기를 좀더 줄였음
        ordersVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        myBaeminVC.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: -10, bottom: 0, right: -10)
        
        viewControllers = [searchVC, wishlistVC, homeVC, ordersVC, myBaeminVC]
        
        
    }
    private func createNavigationController(rootViewController: UIViewController,title: String, imageName: String) ->UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: nil)
        return navigationController
    }
    //homeVC 처음 로딩
    private func setSelectIndex(){
        selectedIndex = 2
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
