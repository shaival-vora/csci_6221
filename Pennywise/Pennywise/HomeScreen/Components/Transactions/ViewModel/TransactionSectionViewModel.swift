//
//  TransactionSectionViewModel.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/28/23.
//

import Foundation

final class TransactionSectionViewModel {
    var recentTransactionData: [RecentTransactionDataModel]
    
    init(recentTransactionData: [RecentTransactionDataModel]) {
        self.recentTransactionData = recentTransactionData
    }
    
    var numberOfRows: Int {
        return self.recentTransactionData.count
    }
    
    func setUpTransactionData(index: Int) -> RecentTransactionDataModel? {
        if let recentTransaction = recentTransactionData[safe: index] {
            return recentTransaction
        }
        return nil
    }
}
