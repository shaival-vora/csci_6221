//
//  ProfileController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit
import Firebase
import FirebaseAuth

final class ProfileController: UIViewController {
        
    let loggoutButton = UIButton(type: .custom)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
 //       self.setUpLoggoutButton()
    }
    
    private func setUpLoggoutButton() {
        loggoutButton.setTitle("Sign Out", for: .normal)
        loggoutButton.setTitleColor(UIColor.white, for: .normal)
        loggoutButton.backgroundColor = UIColor.redDark
        loggoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        // Add button target (action) for touchUpInside event
        loggoutButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Add button to the view
        view.addSubview(loggoutButton)
        
        // Give button rounded Corners
        loggoutButton.layer.cornerRadius = 8
        
        // Set constraints for the button (optional)
        loggoutButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loggoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loggoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loggoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            loggoutButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // Button tap action
    @objc func buttonTapped() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            self.showToast(message: "Error Signing out. Please Try Again")
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
