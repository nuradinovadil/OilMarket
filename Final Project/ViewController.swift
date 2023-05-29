//
//  ViewController.swift
//  Final Project
//
//  Created by Nuradinov Adil on 13/03/23.
//

import UIKit
import SnapKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.init(red: 151/255, green: 93/255, blue: 196/255, alpha: 1)
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: StatisticsViewController())
        let vc3 = UINavigationController(rootViewController: CartViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "chart.pie")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "chart.pie.fill")
        vc3.tabBarItem.image = UIImage(systemName: "cart")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "cart.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.circle")
        vc4.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        
        vc1.title = "Home"
        vc2.title = "Statistics"
        vc3.title = "Cart"
        vc4.title = "Profile"
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
    

}

