//
//  TransactionTableViewCell.swift
//  Pennywise
//
//  Created by Shaival Vora on 11/27/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var transactionTypeLabel: UILabel!
    @IBOutlet weak var transactionAmountLabel: UILabel!
    @IBOutlet weak var transactionDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func resetData() {
        categoryImageView.image = nil
        transactionLabel.text = ""
        transactionTypeLabel.text = ""
        transactionAmountLabel.text = ""
        transactionDateLabel.text = ""
    }
    
    func recentTransactionDataSetup(recentTransaction: RecentTransactionDataModel?) {
        categoryImageView.image = recentTransaction?.categoryImage ?? UIImage(named: "others")
        categoryImageView.contentMode = .scaleAspectFit
        transactionLabel.text = recentTransaction?.transactionName ?? ""
        transactionLabel.textColor = UIColor.blackHigh
        transactionLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        transactionTypeLabel.text = recentTransaction?.transactionCategory
        transactionTypeLabel.textColor = UIColor.blackMedium
        transactionTypeLabel.font = UIFont.systemFont(ofSize: 14)
        
        if recentTransaction?.transactionType.lowercased() == "income" {
            transactionAmountLabel.text = "+$\(recentTransaction?.amount ?? 0.0)"
            transactionAmountLabel.textColor = UIColor.greenLight2
        } else {
            transactionAmountLabel.text = "-$\(recentTransaction?.amount ?? 0.0)"
            transactionAmountLabel.textColor = UIColor.redDark
        }
        transactionAmountLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        transactionDateLabel.text = recentTransaction?.transactionDate ?? ""
        transactionDateLabel.textColor = UIColor.blackMedium
        transactionDateLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
}
