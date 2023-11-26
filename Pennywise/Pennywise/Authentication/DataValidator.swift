//
//  DataValidator.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/26/23.
//

import Foundation

/// :- This data Validation Protocol handles all the functions for the data validation for the sign up and login pages
protocol DataValidation: AnyObject {
    func isValidEmail(_ email: String) -> Bool
    func isValidFullName(_ fullName: String) -> Bool
    func isValidPassword(_ password: String) -> Bool
}

// MARK: - Auth Data Validations Functions for Email, Password and User full name
final class DataValidator: DataValidation {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func isValidFullName(_ fullName: String) -> Bool {
        let nameRegex = "^[a-zA-Z ]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        return namePredicate.evaluate(with: fullName)
    }

    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}
