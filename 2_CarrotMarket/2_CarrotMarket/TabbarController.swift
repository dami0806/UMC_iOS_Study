//
//  TabbarController.swift
//  2_CarrotMarket
//
//  Created by 박다미 on 2023/09/25.
//
import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        settingTabbar()
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
    
    private func settingView(){
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
    }
    private func settingTabbar(){
        
    }
    
}

class NeighborhoodLifeViewController: UIViewController {
}

class NearPlacesViewController: UIViewController {
}
class ChattingViewController: UIViewController {
}

class MyPageViewController: UIViewController {
}
