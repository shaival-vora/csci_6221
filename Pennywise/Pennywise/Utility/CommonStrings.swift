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
    
    enum SignUp: String {
        case welcomeLabel = "Ready to begin\nSign up here"
        case signInLabel = "Already a member? Sign In"
        case signIn = "Sign In"
        case fullName = "Enter Full Name"
        case email = "Enter Email ID"
        case password = "Enter Password"
        case confirmPassword = "Confirm Password"
        case signUp = "Sign Up"
        
        func value() -> String {
            return self.rawValue
        }
    }
    
    enum Transaction: String {
        case header = "Add Transactions"
        case title = "Transaction title"
        case amount = "Amount"
        case category = "Transaction Category"
        case date = "Transaction Date"
        case type = "Transaction Type"
        
        enum TextFieldPlaceholder: String {
            case type = "Select Transaction Type"
            case category = "Select Transaction Category"
            case amount = "Enter Amount"
            case error = "Data Not Found"
            case name = "Enter Transaction Name"
        }
    }
}
