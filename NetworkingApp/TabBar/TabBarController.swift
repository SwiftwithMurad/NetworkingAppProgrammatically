//
//  TabBarController.swift
//  NetworkingApp
//
//  Created by Mac on 26.01.25.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViewControllers()
    }
    
    func setUpViewControllers() {
        tabBar.isTranslucent = false
        
        let firstVC = UINavigationController(rootViewController: PostController())
        let secondVC = UINavigationController(rootViewController: AlbumsController())
        let thirdVC = UINavigationController(rootViewController: PhotosController())
        let fourthVC = UINavigationController(rootViewController: UsersController())
        
        firstVC.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(systemName: "message.fill"), tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "person.2.crop.square.stack.fill"), tag: 2)
        thirdVC.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 3)
        fourthVC.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person.fill"), tag: 4)
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
