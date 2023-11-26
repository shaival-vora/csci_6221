//
//  SignUpViewController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import UIKit
/// This is the base view controller which handles the sign up page, which creates a new user account
final class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var fullnameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetData()
        self.setUpInitialData()
    }
    
    private func resetData() {
        titleLabel.text = ""
        subTitleLabel.text = ""
        subTitleLabel.attributedText = nil
        fullnameLabel.text = ""
        fullnameTextField.text = ""
        emailLabel.text = ""
        emailTextField.text = ""
        passwordLabel.text = ""
        passwordTextField.text = ""
        confirmPasswordLabel.text = ""
        confirmPasswordTextField.text = ""
        signUpButton.setTitle("", for: .normal)
        
    }
    
    private func setUpInitialData() {
        setTitleLabel()
        setSubTitleLabel()
        setUpFullNameLabel()
        setUpEmailLabel()
        setUpPasswordLabel()
        setUpSignUpButton()
    }
    
    private func setTitleLabel() {
        titleLabel.text = CommonStrings.SignUp.welcomeLabel.value()
        titleLabel.textColor = UIColor.blackHigh
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.numberOfLines = 0
    }
    
    private func setSubTitleLabel() {
        let subtitleAttributedString: NSAttributedString = .makeClickableString(text: CommonStrings.SignUp.signInLabel.value(),
                                                                                fontSize: 14,
                                                                                textColor: .blackHigh,
                                                                                targetString: CommonStrings.SignUp.signIn.value(),
                                                                                targetColor: UIColor.redDark)
        
        subTitleLabel.attributedText = subtitleAttributedString
        subTitleLabel.isUserInteractionEnabled = true // Enabling User interaction for the sign up text click action
        subTitleLabel.lineBreakMode = .byWordWrapping
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(subtitleLabelTapped(_:)))
        subTitleLabel.addGestureRecognizer(tapGesture)

    }
    
    @objc func subtitleLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let title = subTitleLabel,
              let range: NSRange = (title.text as? NSString)?.range(of: CommonStrings.SignUp.signIn.value()),
              gesture.didTapAttributedTextInLabel(label: title, inRange: range) else {
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "LoginView") as? ViewController {
            destinationVC.modalPresentationStyle = .overFullScreen
            dismiss(animated: true)
        }
    }
    
    private func setUpFullNameLabel() {
        fullnameLabel.text = CommonStrings.SignUp.fullName.value()
        fullnameLabel.font = UIFont.systemFont(ofSize: 14)
        fullnameLabel.textColor = UIColor.blackHigh
        fullnameTextField.placeholder = CommonStrings.SignUp.fullName.value()
        fullnameTextField.backgroundColor = UIColor.grayLight4
    }
    
    private func setUpEmailLabel() {
        emailLabel.text = CommonStrings.SignUp.email.value()
        emailLabel.font = UIFont.systemFont(ofSize: 14)
        emailLabel.textColor = UIColor.blackHigh
        emailTextField.placeholder = CommonStrings.SignUp.email.value()
        emailTextField.backgroundColor = UIColor.grayLight4
    }
    
    private func setUpPasswordLabel() {
        passwordLabel.text = CommonStrings.SignUp.password.value()
        passwordLabel.textColor = UIColor.blackHigh
        passwordLabel.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.placeholder = CommonStrings.SignUp.password.value()
        passwordTextField.backgroundColor = UIColor.grayLight4
        
        confirmPasswordLabel.text = CommonStrings.SignUp.confirmPassword.value()
        confirmPasswordLabel.font = UIFont.systemFont(ofSize: 14)
        confirmPasswordLabel.textColor = UIColor.blackHigh
        confirmPasswordTextField.placeholder = CommonStrings.SignUp.confirmPassword.value()
        confirmPasswordTextField.backgroundColor = UIColor.grayLight4
    }
    
    private func setUpSignUpButton() {
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        signUpButton.setTitle(CommonStrings.SignUp.signUp.value(), for: .normal)
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.layer.cornerRadius = 8
        signUpButton.configuration?.titlePadding = 8
        signUpButton.backgroundColor = UIColor.redDark
    }
    
}
