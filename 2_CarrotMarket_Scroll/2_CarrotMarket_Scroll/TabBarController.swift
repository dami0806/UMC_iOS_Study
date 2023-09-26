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
        settingTabbar()
        // 홈 뷰 컨트롤러 생성
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
        let neigborVC = UINavigationController(rootViewController: NeighborhoodLifeViewController())
        neigborVC.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper"))
        
        let nearVC = UINavigationController(rootViewController: NearPlacesViewController())
        nearVC.tabBarItem = UITabBarItem(title: "내 근처", image:  UIImage(systemName: "house"), selectedImage:  UIImage(systemName: "house"))
        
        let chatVC = UINavigationController(rootViewController: ChattingViewController())
        chatVC.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "bubble.left.and.bubble.right"), selectedImage: UIImage(systemName: "bubble.left.and.bubble.right"))
        
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        myPageVC.tabBarItem = UITabBarItem(title: "나의 당근", image:UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        
        self.viewControllers = [homeVC, neigborVC, nearVC, chatVC, myPageVC]
        
    
    }
    private func settingTabbar(){
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .selected)
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

