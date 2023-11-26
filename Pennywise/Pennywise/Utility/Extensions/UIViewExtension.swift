//
//  UIViewExtension.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/26/23.
//

import UIKit

extension UIViewController {
    /// - showToast func is used to display toast messages on the application, the defualt duration of the toast message is kept to 2 seconds and can be be changed as per the requirements
    func showToast(message: String,
                   backgroundColor: UIColor = UIColor.black,
                   textColor: UIColor = UIColor.white,
                   duration: TimeInterval = 2.0) {
        // Using programmatic views and label to create a UIView and UILabel for the toast message UI
        let toastView = UIView()
        toastView.backgroundColor = backgroundColor
        toastView.alpha = 0.0
        toastView.layer.cornerRadius = 10
        toastView.clipsToBounds = true
        
        let label = UILabel()
        label.text = message
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        
        toastView.addSubview(label)
        view.addSubview(toastView)
        
        // Constraints: Adding Constraints so that the toast view is kept at the bottom the screen 
        toastView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let labelPadding: CGFloat = 16.0
        
        NSLayoutConstraint.activate([
            toastView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toastView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                              constant: -30),
            toastView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor,
                                             constant: -32),
            
            label.topAnchor.constraint(equalTo: toastView.topAnchor,
                                       constant: labelPadding),
            label.bottomAnchor.constraint(equalTo: toastView.bottomAnchor,
                                          constant: -labelPadding),
            label.leadingAnchor.constraint(equalTo: toastView.leadingAnchor,
                                           constant: labelPadding),
            label.trailingAnchor.constraint(equalTo: toastView.trailingAnchor,
                                            constant: -labelPadding),
        ])
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: .curveEaseOut,
                       animations: {
            toastView.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.3,
                           delay: duration,
                           options: .curveEaseOut,
                           animations: {
                toastView.alpha = 0.0
            }, completion: { _ in
                toastView.removeFromSuperview()
            })
        })
    }
}
