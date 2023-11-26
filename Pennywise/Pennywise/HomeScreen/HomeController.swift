//
//  HomeController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit

final class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
