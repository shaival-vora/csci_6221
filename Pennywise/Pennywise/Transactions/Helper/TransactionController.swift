//
//  TransactionController.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/28/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabaseInternal

final class TransactionController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var transactionTypeTextField: UITextField!
    @IBOutlet weak var transactionCategory: UILabel!
    @IBOutlet weak var transactionCategoryTextField: UITextField!
    @IBOutlet weak var transactionDate: UILabel!
    @IBOutlet weak var transactionDatePicker: UIDatePicker!
    @IBOutlet weak var addTransactionButton: UIButton!
    
    
    @IBOutlet weak var transactionTypeLabel: UILabel!
    
    @IBAction func addTransactionButtonClick(_ sender: Any) {
        self.validateData()
    }
    
    private let transactionType: [String] = ["Income",
                                             "Expense"]
    private let transactionCategoryList: [String] = ["Salary", "Housing", "Utilities", "Transportation", "Grocery", "Entertainment", "Dining", "Gas", "Shopping", "travel", "HealthCare", "Savings","Investments", "Other Income", "Other Expenses"]
    
    private var transactionTypePickerView = UIPickerView()
    private var transactionCategoryPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setUpInitialData()
    }
    
    func setUpInitialData() {
        setUpHeaderData()
        setUpTransactionName()
        setUpTransactionAmount()
        setUpTransactionType()
        setUpTransactionCategory()
        setTransactionDate()
        setUpAddTransactionButton()
    }
    
    private func setUpHeaderData() {
        headerLabel.text = CommonStrings.Transaction.header.rawValue
        headerLabel.textColor = UIColor.blackHigh
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.textAlignment = .center
    }
    
    private func setUpTransactionName() {
        transactionName.text = CommonStrings.Transaction.title.rawValue
        transactionName.textColor = UIColor.blackHigh
        transactionName.font = UIFont.systemFont(ofSize: 14)
        
        transactionNameTextField.placeholder = CommonStrings.Transaction.TextFieldPlaceholder.name.rawValue
        transactionNameTextField.backgroundColor = UIColor.grayLight4
        
    }
    
    private func setUpTransactionAmount() {
        amountLabel.text = CommonStrings.Transaction.amount.rawValue
        amountLabel.textColor = UIColor.blackHigh
        amountLabel.font = UIFont.systemFont(ofSize: 14)
        
        amountTextField.placeholder = CommonStrings.Transaction.TextFieldPlaceholder.amount.rawValue
        amountTextField.backgroundColor = UIColor.grayLight4
        
    }
    
    private func setUpTransactionType() {
        transactionTypeLabel.text = CommonStrings.Transaction.type.rawValue
        transactionTypeLabel.textColor = UIColor.blackHigh
        transactionTypeLabel.font = UIFont.systemFont(ofSize: 14)
        
        transactionTypeTextField.placeholder = CommonStrings.Transaction.TextFieldPlaceholder.type.rawValue
        transactionTypeTextField.inputView = transactionTypePickerView
        transactionTypeTextField.backgroundColor = UIColor.grayLight4
        
        transactionTypePickerView.delegate = self
        transactionTypePickerView.dataSource = self
        transactionTypePickerView.tag =  100000
        
    }
    
    private func setUpTransactionCategory() {
        transactionCategory.text = CommonStrings.Transaction.category.rawValue
        transactionCategory.textColor = UIColor.blackHigh
        transactionCategory.font = UIFont.systemFont(ofSize: 14)
        
        transactionCategoryTextField.placeholder = CommonStrings.Transaction.TextFieldPlaceholder.category.rawValue
        transactionCategoryTextField.inputView = transactionCategoryPickerView
        transactionCategoryTextField.backgroundColor = UIColor.grayLight4
        
        transactionCategoryPickerView.delegate = self
        transactionCategoryPickerView.dataSource = self
        transactionCategoryPickerView.tag =  100001
    }
    
    private func setTransactionDate() {
        transactionDate.text = CommonStrings.Transaction.date.rawValue
        transactionDate.textColor = UIColor.blackHigh
        transactionDate.font = UIFont.systemFont(ofSize: 14)
        transactionDate.textAlignment = .right
        
        transactionDatePicker.datePickerMode = .date
    }
    
    private func setUpAddTransactionButton() {
        addTransactionButton.setTitle(CommonStrings.Transaction.header.rawValue, for: .normal)
        addTransactionButton.setTitleColor(UIColor.white, for: .normal)
        addTransactionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
    private func validateData() {
        guard let transactionName = transactionNameTextField.text,
              !transactionName.isEmpty,
              let transactionAmount = amountTextField.text,
              !transactionAmount.isEmpty,
              let transactionType = transactionTypeTextField.text,
              !transactionType.isEmpty,
              let transactionCategory = transactionCategoryTextField.text,
              !transactionCategory.isEmpty else {
            self.showToast(message: "Enter All the Fields to record a transaction")
            return
        }
        
        let reference = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        let addTransactionData = AddTransactionData(transactionName: transactionName,
                                                    transactionAmount: transactionAmount,
                                                    tranactionType: transactionType,
                                                    transactionCategory: transactionCategory,
                                                    transactionDate: transactionDatePicker.date.formatted())
        
        let expenseDict = [
                "transactionName": transactionName,
                "amount": transactionAmount,
                "type": transactionType,
                "category": transactionCategory,
                "date": transactionDatePicker.date.formatted()
            ]
        let data = ["transactionName": transactionName]
        reference.child("users").child(uid ?? "").child("Expenses").childByAutoId().setValue(expenseDict)
        self.showToast(message: "Transaction Entry Recorded")

        
    }
    
}


extension TransactionController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 100000:
            return transactionType.count
        case 100001:
            return transactionCategoryList.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 100000:
            return transactionType[row]
        case 100001:
            return transactionCategoryList[row]
        default:
            return CommonStrings.Transaction.TextFieldPlaceholder.error.rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 100000:
            transactionTypeTextField.text = transactionType[row]
            transactionTypeTextField.resignFirstResponder()
        case 100001:
            transactionCategoryTextField.text =  transactionCategoryList[row]
            transactionCategoryTextField.resignFirstResponder()
        default:
           break
        }
    }
    
    
}

