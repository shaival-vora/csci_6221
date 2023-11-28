//
//  AddTransactionData.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/28/23.
//

import Foundation


struct AddTransactionData: Codable {
    var transactionName: String
    var transactionAmount: String
    var tranactionType: String
    var transactionCategory: String
    var transactionDate: String
}
