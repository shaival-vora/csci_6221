//
//  TabbarController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit

final class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationController?.isNavigationBarHidden = true
        self.setUpTabbar()
        self.setUpTabbarUI()
    }
    
    private func setUpTabbarUI() {
        self.tabBar.tintColor = UIColor.blueDark
        self.tabBar.unselectedItemTintColor = UIColor.blackMedium
        self.tabBar.backgroundImage = UIImage()
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.white
            appearance.backgroundImage = UIImage()
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance

        }

    }
    
    private func setUpTabbar() {
        let homeStoryboard = UIStoryboard(name: "HomeViewController", bundle: nil)
        let destinationVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeView") as? HomeController
        let homeController = self.createTabbar(with: "Home",
                                               and: UIImage(systemName: "house.fill"),
                                               viewController: destinationVC ?? ViewController())

        
        let profileController = self.createTabbar(with: "Profile",
                                                  and: UIImage(systemName: "person.fill"),
                                                  viewController: ProfileController())
        
        let transactionStoryboard = UIStoryboard(name: "TransactionView", bundle: nil)
        let transactionViewController = transactionStoryboard.instantiateViewController(withIdentifier: "transactionView") as? TransactionController
        let transactionController = self.createTabbar(with: "Transactions",
                                                      and: UIImage(systemName: "plus.circle.fill"),
                                                      viewController: transactionViewController ?? UIViewController())
   
        
        self.setViewControllers([homeController,
                                 transactionController,
                                 profileController],
                                animated: true)
    }
    
    private func createTabbar(with title: String,
                              and image: UIImage?,
                              viewController: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }
}
