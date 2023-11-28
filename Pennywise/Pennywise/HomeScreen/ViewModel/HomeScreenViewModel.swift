//
//  HomeScreenViewModel.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/28/23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabaseInternal


final class HomeScreenViewModel: NSObject {
    
    let reference = Database.database().reference()
    var username: String? = "John Doe"
    let uuid: String?
    var expenseList: [AddTransactionData] = []
    
    var incomeArray: [AddTransactionData] = []
    var expenseArray: [AddTransactionData] = []
    
    var totalIncome: Double = 0
    var totalExpense: Double = 0
    
    var reloadData: (()-> Void)?
    private let imageMapping: [String: String] = ["Salary": "income",
                                                  "Housing":"housing",
                                                  "Utilities": "utilities",
                                                  "Transportation":"transit",
                                                  "Grocery": "groceries",
                                                  "Entertainment": "entertainment",
                                                  "Dining": "dining",
                                                  "Gas": "gas",
                                                  "Shopping": "shopping",
                                                  "travel": "travel",
                                                  "HealthCare": "healthcare",
                                                  "Savings": "investments",
                                                  "Investments": "investments",
                                                  "Other Income": "income",
                                                  "Other Expenses": "others"]
    

    init(uuid: String? = Auth.auth().currentUser?.uid) {
        self.uuid = uuid
        super.init()
        self.observeExpenses(for: uuid)
    }
    
    func observeExpenses(for userId: String?) {
        let database = Database.database().reference()

        // Reference to the "expenses" node for the specified user
        let expensesRef = database.child("users").child(userId ?? "").child("Expenses")
        let nameData = database.child("users").child(userId ?? "")
        
        nameData.observe(.value, with: { [weak self] snapshot in
            guard let data = snapshot.value as? [String: Any]  else {
                return
            }
            self?.username = data["name"] as? String
            self?.reloadData?()
        })

        // Add an observer to listen for changes in the expenses node
        expensesRef.observe(.value, with: { [weak self] snapshot in
            self?.expenseList.removeAll()
            guard let expensesData = snapshot.value as? [String: Any] else {
                return
            }
            // Loop through each expense
            for (_, expenseData) in expensesData {
                if let expenseDict = expenseData as? [String: Any],
                   let transactionName = expenseDict["transactionName"] as? String,
                   let amount = expenseDict["amount"] as? String,
                   let category = expenseDict["category"] as? String,
                   let type = expenseDict["type"] as? String,
                   let date = expenseDict["date"] as? String {
                    let expense = AddTransactionData(transactionName: transactionName,
                                                     transactionAmount: amount,
                                                     tranactionType: type,
                                                     transactionCategory: category,
                                                     transactionDate: date)
                    self?.expenseList.append(expense)
                }
            }
            
            self?.separateExpenseList()
            self?.calculateTotelIncomeAndExpense()
            self?.reloadData?()
        })
    }
    
    
    func separateExpenseList() {
        incomeArray = expenseList.filter { $0.tranactionType.lowercased() == "income" }
        expenseArray = expenseList.filter { $0.tranactionType.lowercased() == "expense" }
        
    }
    
    func calculateTotelIncomeAndExpense() {
        totalIncome = 0
        totalExpense = 0
        incomeArray.forEach { income in
            if let amountData = Double(income.transactionAmount) {
                totalIncome += amountData
            }
        }
        
        expenseArray.forEach { expense in
            if let amountData = Double(expense.transactionAmount) {
                totalExpense += amountData
            }
        }
    }
    
    func setUpHeaderData() -> HeaderDataModel {
        let headerDataModel: HeaderDataModel = HeaderDataModel(username: self.username ?? "John Doe",
                                                               totalBalance: self.totalIncome - self.totalExpense,
                                                               totalIncome: self.totalIncome,
                                                               totalExpense: self.totalExpense)
        
        return headerDataModel
    }
    
    func setUpRecentTransactionDataModel() -> [RecentTransactionDataModel] {
        var recentTransactionsList: [RecentTransactionDataModel] = []
        var recentTransactionData: RecentTransactionDataModel = RecentTransactionDataModel()
        expenseList.forEach { expense in
            recentTransactionData.transactionName = expense.transactionName
            recentTransactionData.transactionType = expense.tranactionType
            recentTransactionData.transactionDate = expense.transactionDate
            recentTransactionData.amount = Double(expense.transactionAmount) ?? 0.0
            recentTransactionData.transactionCategory = expense.transactionCategory
            recentTransactionData.categoryImage = UIImage(named: self.imageMapping[expense.transactionCategory] ?? "others")
            recentTransactionsList.append(recentTransactionData)
        }
        return recentTransactionsList
    }
}
