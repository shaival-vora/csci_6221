//
//  ViewController.swift
//  Pennywise
//
//  Created by Shaival Vora on 10/31/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameTextView: UITextView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextView: UITextView!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBAction func loginButtonClick(_ sender: Any) {
        let mainTabBarController = TabbarController()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(mainTabBarController, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetData()
        self.setUpInitialData()
    }
    
    private func resetData() {
        titleLabel.text = ""
        subtitleLabel.text = ""
        subtitleLabel.attributedText = nil
        usernameLabel.text = ""
        passwordLabel.text = ""
        usernameTextView.text = ""
        passwordTextView.text = ""
        loginButton.setTitle("",
                             for: .normal)
    }
    
    private func setRoundedCorners() {
        usernameTextView.layer.cornerRadius = 8
        passwordTextView.layer.cornerRadius = 8
    }
    
    // setUpInitialData set the data for the initial Login Page
    private func setUpInitialData() {
        setUpTitleLabel()
        setUpSubTitleLabel()
        setUpUserNameLabel()
        setUpPasswordLabel()
        setUpLoginButton()
        setRoundedCorners()
    }
    
    private func setUpTitleLabel() {
        titleLabel.text = CommonStrings.Login.welcomeLabel.value()
        titleLabel.textColor = UIColor.blackHigh
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.numberOfLines = 0
    }
    
    private func setUpSubTitleLabel() {
        let subtitleAttributedString: NSAttributedString = .makeClickableString(text: CommonStrings.Login.signUpLabel.value(),
                                                                                fontSize: 14,
                                                                                textColor: .blackHigh,
                                                                                targetString: CommonStrings.Login.signUp.value(),
                                                                                targetColor: UIColor.redDark)
        
        subtitleLabel.attributedText = subtitleAttributedString
        subtitleLabel.isUserInteractionEnabled = true // Enabling User interaction for the sign up text click action
        subtitleLabel.lineBreakMode = .byWordWrapping
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(subtitleLabelTapped(_:)))
        subtitleLabel.addGestureRecognizer(tapGesture)
    }
    
    private func setUpUserNameLabel() {
        usernameLabel.text = CommonStrings.Login.email.value()
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = UIColor.blackMedium
        usernameTextView.backgroundColor = UIColor.grayLight4
    }
    
    private func setUpPasswordLabel() {
        passwordLabel.text = CommonStrings.Login.password.value()
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordLabel.textColor = UIColor.blackMedium
        passwordTextView.backgroundColor = UIColor.grayLight4
    }
    
    private func setUpLoginButton() {
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        loginButton.setTitle(CommonStrings.Login.login.value(), for: .normal)
        loginButton.setTitleColor(UIColor.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        loginButton.configuration?.titlePadding = 8
        loginButton.backgroundColor = UIColor.redDark
    }
    
    @objc func subtitleLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let title = subtitleLabel,
              let range: NSRange = (title.text as? NSString)?.range(of: CommonStrings.Login.signUp.value()),
              gesture.didTapAttributedTextInLabel(label: title, inRange: range) else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "SignUpView") as? SignUpViewController {
            destinationVC.modalPresentationStyle = .overFullScreen
            present(destinationVC, animated: true)
        }
    }
}
