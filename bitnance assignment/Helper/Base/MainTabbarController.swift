//
//  MainTabbarController.swift
//  foxclub-ios
//
//  Created by Wisarut Multhonggad on 10/22/20.
//

import UIKit
//import DrawerMenu

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        //drawer()?.style = Slide()
        self.tabBar.barTintColor = UIColor.CIColor.barColor
        tabBar(self.tabBar, didSelect: (self.tabBar.items!)[0])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //drawer()?.panGestureType = .none
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //drawer()?.panGestureType = .none
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (self.tabBar.items!)[0]{
            self.tabBar.isHidden = true
        } else {
            self.tabBar.isHidden = false
        }
    }
}
