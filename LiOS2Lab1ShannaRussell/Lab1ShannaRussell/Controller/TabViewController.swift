//
//  TabViewController.swift
//  Lab1ShannaRussell
//
//  Created by user214013 on 1/28/22.
//

import Foundation
import UIKit

class TabViewController: UITabBarController {
    
    //1. Reference to table and collection vc and put them into my tab
    var homeViewController = HomeViewController()
    var collectionViewController = CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    var logViewController = LoginViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        //2. We set the tab bar item image to be put inside the tab bar for each view controller
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        collectionViewController.tabBarItem = UITabBarItem(title: "Collection", image: UIImage(named: "grid"), tag: 1)
        logViewController.tabBarItem = UITabBarItem(title: "Login", image: UIImage(named: "login"), tag: 2)
        
        //3. Specify which items are visible in the tab bar
        self.viewControllers = [homeViewController, logViewController, collectionViewController]
        
       self.tabBar.barStyle = .black
       self.tabBar.barTintColor = .green

    }
    
}
