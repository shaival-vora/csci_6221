//
//  HomeHeaderView.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/27/23.
//

import UIKit

final class HomeHeaderView: UIView {
    
    @IBOutlet weak var mainBacgroundView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var totalBalanceLabel: UILabel!
    @IBOutlet weak var totalBalanceCountLabel: UILabel!
    @IBOutlet weak var incomeTextLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var expenceTextLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var expenseView: UIView!
    
    func setBackgroundColor() {
        mainBacgroundView.backgroundColor = UIColor.greenLight3
        incomeView.backgroundColor = UIColor.grayLight5
        expenseView.backgroundColor = UIColor.grayLight5
    }
    
    func setRoundedCorners() {
        incomeView.layer.cornerRadius = 16
        expenseView.layer.cornerRadius = 16
        profileView.layer.cornerRadius = 24
        mainBacgroundView.layer.cornerRadius = 4
    }
    
    func setHeaderData() {
        profileImageView.image = UIImage.init(systemName: "person.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.blackHigh)
        firstLabel.text = "Hi, Welcome Back"
        firstLabel.textColor = UIColor.white
        firstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        usernameLabel.text = "Shaival Vora"
        usernameLabel.textColor = UIColor.white
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        totalBalanceLabel.text = "Total Balance"
        totalBalanceLabel.textColor = UIColor.white
        totalBalanceLabel.font = UIFont.systemFont(ofSize: 12)
        
        totalBalanceCountLabel.text = "$24000"
        totalBalanceCountLabel.textColor = UIColor.white
        totalBalanceCountLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        incomeTextLabel.text = "Total Income"
        incomeTextLabel.textColor = UIColor.blackHigh
        incomeTextLabel.font = UIFont.systemFont(ofSize: 12)
        
        incomeLabel.text  = "+$40000"
        incomeLabel.textColor = UIColor.blackMedium
        incomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        expenceTextLabel.text = "Total Expense"
        expenceTextLabel.textColor = UIColor.blackHigh
        expenceTextLabel.font = UIFont.systemFont(ofSize: 12)
        
        expenseLabel.text  = "-$26000"
        expenseLabel.textColor = UIColor.blackMedium
        expenseLabel.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
}
