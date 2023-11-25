//
//  CommonStrings.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/25/23.
//

import Foundation

// This is Class which handles all the Strings for the application
// Define separate Enums for differnet part of the application
struct CommonStrings {
    // Enum Login to handle all the Login and signUp page Strings
    enum Login: String {
        case welcomeLabel = "Welcome Back!\nPlease Log In"
        case signUpLabel = "Dont have an account yet? sign up"
        case signUp = "sign up"
        case email = "Please Enter Email ID"
        case password = "Enter Password"
        case login = "Log In"
        
        func value() -> String {
            return self.rawValue
        }
        
        
    }
}
