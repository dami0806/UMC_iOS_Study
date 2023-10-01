//
//  TabBarController.swift
//  2_CarrotMarket_Scroll
//
//  Created by 박다미 on 2023/09/26.
//

import Foundation
import UIKit

//MARK - Tabbar

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupTabBarAppearance()
        setupViewControllers()
    }
    
    private func setupTabBarAppearance() {
        UITabBar.appearance().tintColor = .black
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .selected)
    }
    
    private func setupViewControllers() {
        let homeVC = createNavigationController(rootViewController: HomeViewController(), title: "홈", imageName: "house")
        let neighborhoodVC = createNavigationController(rootViewController: NeighborhoodLifeViewController(), title: "동네생활", imageName: "newspaper")
        let nearPlacesVC = createNavigationController(rootViewController: NearPlacesViewController(), title: "내 근처", imageName: "mappin.and.ellipse")
        let chatVC = createNavigationController(rootViewController: ChattingViewController(), title: "채팅", imageName: "bubble.left.and.bubble.right")
        let myPageVC = createNavigationController(rootViewController: MyPageViewController(), title: "나의 당근", imageName: "person")
        
        viewControllers = [homeVC, neighborhoodVC, nearPlacesVC, chatVC, myPageVC]
    }
    
    private func createNavigationController(rootViewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: imageName), selectedImage: UIImage(systemName: "\(imageName).fill"))
        return navigationController
    }
}

class NeighborhoodLifeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}
class NearPlacesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

class ChattingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

class MyPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

